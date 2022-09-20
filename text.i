# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
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
# 2 "text.c" 2
# 1 "text.h" 1
void drawChar(int, int, char, u16);
void drawString(int, int, char*, u16);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2

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
