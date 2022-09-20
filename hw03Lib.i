# 1 "hw03Lib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "hw03Lib.c"
# 1 "hw03Lib.h" 1
# 39 "hw03Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef unsigned short u16;
typedef enum { false, true } bool;




typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;


void setPixel(int col, int row, u16 color);
u16 getPixel(int col, int row);
void drawRect(int col, int row, int width, int height, u16 color);
void drawBorderedRect(int col, int row, int width, int height, u16 fillColor, u16 borderColor);
void drawPara(int col, int row, int width, int height, u16 fillColor, u16 borderColor, int offset);
void drawParaVertical(int col, int row, int width, int height, u16 fillColor, u16 borderColor, int offset, int denominator);
void fillScreen(u16);
void fillImage(int, int, int, int, const unsigned short*);
void fillPartImage(int, int, int, int, int, int, int, const unsigned short*);
void waitForVBlank();
int abs(int);
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "hw03Lib.c" 2

volatile u16* videoBuffer = (unsigned short *)(0x6000000);

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
# 73 "hw03Lib.c"
void fillScreen(u16 color){
    volatile unsigned int temp = color | color << 16;
    ((volatile DMAREC*)0x040000b0)[3].cnt = 0;
    ((volatile DMAREC*)0x040000b0)[3].src = &temp;
    ((volatile DMAREC*)0x040000b0)[3].dst = videoBuffer;
    ((volatile DMAREC*)0x040000b0)[3].cnt = 1 << 31 |
                1 << 26 |
                1 << 24 |
                19200;
}

void fillImage(int col, int row, int width, int height, const unsigned short* bitmap) {
    ((volatile DMAREC*)0x040000b0)[3].cnt = 0;
    for (int i = 0; i < height; i++) {
        ((volatile DMAREC*)0x040000b0)[3].src = &bitmap[((i)*(width)+(0))];
        ((volatile DMAREC*)0x040000b0)[3].dst = &videoBuffer[((row + i)*(240)+(col))];
        ((volatile DMAREC*)0x040000b0)[3].cnt = 1 << 31 |
                    width;
    }
}

void fillPartImage(int col, int row, int colOffset, int rowOffset, int width, int height, int imageWidth, const unsigned short* bitmap) {







    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            setPixel(col + j, row + i, bitmap[((i + rowOffset)*(imageWidth)+(j + colOffset))]);
        }
    }
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) > 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}


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
