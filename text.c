#include "hw03Lib.h"
#include "text.h"
#include "font.h"

void drawChar(int col, int row, char ch, u16 color) {
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 8; j++) {
            if (fontdata_6x8[48*ch + i + 6*j]) {
                setPixel(col + i, row + j, color);
            }
        }
    }
}

void drawString(int col, int row, char *str, u16 color) {
    char i = 0;
    while (str[i] != '\0') {
        drawChar(col + (i * 6), row, str[i], color);
        i++;
    }
}