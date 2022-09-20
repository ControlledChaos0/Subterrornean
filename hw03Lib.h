// Registering different memory locations
#define REG_DISPCTL (*(volatile u16*)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)
#define VIDEO_BUFFER (0x6000000)
#define BUTTONS (*(volatile unsigned short *)0x04000130)
#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

// Create a color with the specified RGB values
#define COLOR(R, G, B) ((R) | (G)<<5 | (B)<<10)
#define BACKGROUND COLOR(26, 31, 31)
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK COLOR(0, 0, 0)
#define WHITE COLOR(31, 31, 31)

// Calculate the position of a pixel based on its row and column
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

// Display Constants
#define SCREENHEIGHT 160
#define SCREENWIDTH 240

// button masks
#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)
#define BUTTON_SELECT	(1<<2)
#define BUTTON_START	(1<<3)
#define BUTTON_RIGHT	(1<<4)
#define BUTTON_LEFT		(1<<5)
#define BUTTON_UP		(1<<6)
#define BUTTON_DOWN		(1<<7)
#define BUTTON_R		(1<<8)
#define BUTTON_L		(1<<9)

// variables for button macros
extern unsigned short oldButtons;
extern unsigned short buttons;

// button macros
#define BUTTON_PRESSED(key)     (!(~(oldButtons) & (key)) && (~buttons & (key)))
#define BUTTON_HELD(key)        (~(BUTTONS) & (key))

//Typedef Variables
typedef unsigned short u16;
typedef enum { false, true } bool;

//DMA
#define DMA ((volatile DMAREC*)0x040000b0)

typedef struct
{
  const volatile void *src;
  volatile void *dst;
  volatile unsigned int cnt;
} DMAREC;

//Function Prototypes
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