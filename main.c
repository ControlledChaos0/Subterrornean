/**
 * @file main.c
 * @author Jade Spooner
 * @brief 
 * @version 0.1
 * @date 2022-02-04
 * 
 * 
 */
#include "hw03Lib.h"
#include "print.h"
#include "text.h"
#include "main.h"
#include "game.h"
#include "background.h"
#include <stdio.h>
#include <stdlib.h>

int state = START;
short vCounter = 0;

int main() {
    mgba_open();

    initialize();
   
    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch (state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case LOSE:
            lose();
            break;
        }
    }

    return 0;
}

void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

unsigned char spiderDiagonal[] = {0, 0, 1, 0, 0, 1, 0, 0, 
                                    0, 0, 1, 1, 1, 1, 0, 1, 
                                    1, 1, 1, 1, 1, 0, 1, 0, 
                                    0, 1, 1, 1, 1, 1, 0, 0, 
                                    0, 1, 1, 1, 1, 2, 1, 1, 
                                    1, 1, 0, 1, 2, 1, 2, 0, 
                                    0, 0, 1, 0, 1, 2, 0, 0, 
                                    0, 1, 0, 0, 1, 0, 0, 0};
unsigned char spiderStraight[] = {1, 0, 0, 0, 0, 0, 0, 1, 
                                    0, 1, 1, 1, 1, 1, 1, 0, 
                                    0, 0, 1, 1, 1, 1, 0, 0, 
                                    1, 1, 1, 1, 1, 1, 1, 1, 
                                    0, 0, 2, 1, 1, 2, 0, 0, 
                                    1, 1, 0, 2, 2, 0, 1, 1, 
                                    0, 1, 0, 1, 1, 0, 1, 0, 
                                    1, 0, 0, 0, 0, 0, 0, 1};

void goToStart() {
    fillScreen(COLOR(10, 0, 0));
    drawString((SCREENWIDTH / 2) - 39 , (SCREENHEIGHT / 2) - 4, "SUB", COLOR(31, 31, 31));
    drawString((SCREENWIDTH / 2) - 21, (SCREENHEIGHT / 2) - 4, "TERROR", COLOR(31, 0, 0));
    drawString((SCREENWIDTH / 2) + 15 , (SCREENHEIGHT / 2) - 4, "NEAN", COLOR(31, 31, 31));
    state = START;
}

void start() {
    vCounter++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        initializeGame();
        goToGame();
        srand(vCounter);
    }
}

void goToGame() {
    if (state == START) {
        fillScreen(BLACK);
    }
    fillImage(42, 2, 156, 156, backgroundBitmap);
    drawString(2, (SCREENHEIGHT / 2 - 10), "Score:", WHITE);
    drawString(16, (SCREENHEIGHT / 2), "0", WHITE);
    drawGame();
    state = GAME;
}

void game() {
    update();
    waitForVBlank();
    if (state != LOSE) {
        draw();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
    }
}

void goToPause() {
    state = PAUSE;
    drawBorderedRect((SCREENWIDTH / 2) - 9, (SCREENHEIGHT / 2) - 13, 7, 25, WHITE, BLACK);
    drawBorderedRect((SCREENWIDTH / 2) + 9, (SCREENHEIGHT / 2) - 13, 7, 25, WHITE, BLACK);
}

void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
}

void goToLose() {
    fillImage(42, 2, 156, 156, backgroundBitmap);
    fillScreen(COLOR(29, 0, 0));
    drawString((SCREENWIDTH / 2) - 24, (SCREENHEIGHT / 2) - 4, "YOU DIED", WHITE);
    char str[10];
    itoa(score, str, 10);
    if (score < 10) {
        drawString((SCREENWIDTH / 2) - 3, (SCREENHEIGHT / 2) + 5, str, WHITE);
    } else if (score < 100) {
        drawString((SCREENWIDTH / 2) - 6, (SCREENHEIGHT / 2) + 5, str, WHITE);
    } else {
        drawString((SCREENWIDTH / 2) - 9, (SCREENHEIGHT / 2) + 5, str, WHITE);
    }
    state = LOSE;
}

void lose() {
    state = LOSE;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void update() {
    updateGame();
}

void draw() {
    drawGame();
}