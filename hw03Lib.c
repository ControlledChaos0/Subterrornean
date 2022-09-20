#include "hw03Lib.h"

volatile u16* videoBuffer = (unsigned short *)VIDEO_BUFFER;

void setPixel(int col, int row, u16 color) {
    videoBuffer[(col) + ((row) * 240)] = color;
}

u16 getPixel(int col, int row) {
    return videoBuffer[(col) + ((row) * 240)];
}

void drawRect(int col, int row, int width, int height, u16 color) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            if (col + i < 240 && row + j >= 0 && row + j < 160) {
                setPixel(col + i, row + j, color);
            }
        }
    }
}

void drawBorderedRect(int col, int row, int width, int height, u16 fillColor, u16 borderColor) {
    for (int i = 0; i < width; i++) {
        for (int j = 0; j < height; j++) {
            if (col + i < 240 && row + j < 160) {
                if (i == 0 || width - i == 1 || j == 0 || height - j == 1) {
                    setPixel(col + i, row + j, borderColor);
                } else {
                    setPixel(col + i, row + j, fillColor);
                }
            }
        }
    }
}

void drawPara(int col, int row, int width, int height, u16 fillColor, u16 borderColor, int offset) {
    for (int j = 0; j < height; j++) {
        for (int i = 0; i < width; i++) {
            if (i < abs(offset) || width - i <= abs(offset) || j < 1 || height - j <= 1) {
                setPixel(col + i + (j * offset), row + j, borderColor);
            } else {
                setPixel(col + i + (j * offset), row + j, fillColor);
            }
        }
    }
}

void drawParaVertical(int col, int row, int width, int height, u16 fillColor, u16 borderColor, int offset, int denominator) {
    if (denominator == 0) {
        //Why would you do this please stop
        return;
    }
    for (int j = 0; j < height; j++) {
        for (int i = 0; i < width; i++) {
            if (i < abs(offset) || width - i <= abs(offset) || j < 1 || height - j <= 1) {
                setPixel(col + i + ((j * offset) / denominator), row + j, borderColor);
            } else {
                setPixel(col + i + ((j * offset) / denominator), row + j, fillColor);
            }
        }
    }
}

/*void fillScreen(u16 color) {
    for (int i = 0; i < 38400; i++) {
        int x = i % 240;
        int y = i / 240;
        setPixel(x, y, color);
    }
}*/

void fillScreen(u16 color){
    volatile unsigned int temp = color | color << 16;  // Two pixels per-int.
    DMA[3].cnt = 0;  // clear it first! No leftover settings breaking things!
    DMA[3].src = &temp;
    DMA[3].dst = videoBuffer;
    DMA[3].cnt = 1 << 31 | // turn it on!
                1 << 26 | // set chunk size to 32 bits
                1 << 24 | // set src as fixed
                19200;    // 38400 / 2
}

void fillImage(int col, int row, int width, int height, const unsigned short* bitmap) {
    DMA[3].cnt = 0;
    for (int i = 0; i < height; i++) {
        DMA[3].src = &bitmap[OFFSET(0, i, width)];
        DMA[3].dst = &videoBuffer[OFFSET(col, row + i, SCREENWIDTH)];
        DMA[3].cnt = 1 << 31 | // turn it on!
                    width;
    }
}

void fillPartImage(int col, int row, int colOffset, int rowOffset, int width, int height, int imageWidth, const unsigned short* bitmap) {
    /*DMA[3].cnt = 0;
    for (int i = 0; i < height; i++) {
        DMA[3].src = &bitmap[OFFSET(colOffset, i + rowOffset, width)];
        DMA[3].dst = &videoBuffer[OFFSET(col, row + i, SCREENWIDTH)];
        DMA[3].cnt = 1 << 31 | // turn it on!
                    width;
    }*/
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, bitmap[OFFSET(j + colOffset, i + rowOffset, imageWidth)]);
        }
    }
}

void waitForVBlank() {
    while (SCANLINECOUNTER > 160);
    while (SCANLINECOUNTER < 160);
}

//Math
int abs(int x) {
    return x > 0 ? x : -(x);
}

int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB) {
    return
    rowA + heightA >= rowB
    && rowA <= rowB + heightB
    && colA + widthA >= colB
    && colA <= colB + widthB;
}