#include <stdlib.h>
#include "hw03Lib.h"
#include "game.h"
#include "background.h"
#include "main.h"
#include "text.h"

PLAYER player;
//Weird bug didn't let me have "#define BULLETCOUNT 6" in the header, so had to have a variable here
//In fact most of these are because of the weird bug I'm having
int bulletCount = 6;
BULLET bullets[6];
int spiderCount = 10;
int spiderVelocity = SPIDERVELOCITY;
SPIDER spiders[10];
int spiderLimit;
int spiderActive;
int spiderRand;
int frame = 0;
int score;
int oldScore;

unsigned char playerLeft[] = {0, 0, 1, 1, 1, 
                            0, 0, 0, 2, 2, 
                            0, 0, 3, 3, 3, 
                            4, 4, 2, 3, 3, 
                            0, 0, 0, 5, 3, 
                            0, 0, 0, 5, 5, 
                            0, 0, 5, 5, 5};
unsigned char playerRight[] = {1, 1, 1, 0, 0, 
                            2, 2, 0, 0, 0, 
                            3, 3, 3, 0, 0, 
                            3, 3, 2, 4, 4, 
                            3, 5, 0, 0, 0, 
                            5, 5, 0, 0, 0, 
                            5, 5, 5, 0, 0};
unsigned char playerFront[] = {0, 1, 1, 1, 0, 
                            0, 2, 2, 2, 0, 
                            3, 3, 3, 3, 3, 
                            3, 2, 4, 2, 3, 
                            3, 5, 5, 5, 3, 
                            5, 5, 0, 5, 5, 
                            5, 5, 0, 5, 5};
unsigned char playerBack[] = {0, 1, 1, 1, 0, 
                            0, 2, 2, 2, 0, 
                            3, 3, 3, 3, 3, 
                            3, 3, 3, 3, 3, 
                            3, 5, 5, 5, 3, 
                            5, 5, 0, 5, 5, 
                            5, 5, 0, 5, 5};

unsigned char* playerBitmaps[] = {playerLeft, playerRight, playerFront, playerBack};

unsigned char spiderStraight1[] = {1, 0, 0, 0, 0, 0, 0, 1, 
                                    0, 1, 1, 1, 1, 1, 1, 0, 
                                    0, 0, 1, 1, 1, 1, 0, 0, 
                                    1, 1, 1, 1, 1, 1, 1, 1, 
                                    0, 0, 2, 1, 1, 2, 0, 0, 
                                    1, 1, 0, 2, 2, 0, 1, 1, 
                                    0, 1, 0, 1, 1, 0, 1, 0, 
                                    1, 0, 0, 0, 0, 0, 0, 1};
unsigned char spiderStraight2[] = {0, 1, 0, 0, 0, 0, 1, 0, 
                                    0, 1, 1, 1, 1, 1, 1, 0, 
                                    1, 0, 1, 1, 1, 1, 0, 1, 
                                    0, 1, 1, 1, 1, 1, 1, 0, 
                                    1, 0, 2, 1, 1, 2, 0, 1, 
                                    0, 1, 0, 2, 2, 0, 1, 0, 
                                    1, 1, 0, 1, 1, 0, 1, 1, 
                                    0, 0, 0, 0, 0, 0, 0, 0};
unsigned char spiderDiagonal1[] = {0, 0, 1, 0, 0, 1, 0, 0, 
                                    0, 0, 1, 1, 1, 1, 0, 1, 
                                    1, 1, 1, 1, 1, 0, 1, 0, 
                                    0, 1, 1, 1, 1, 1, 0, 0, 
                                    0, 1, 1, 1, 1, 2, 1, 1, 
                                    1, 1, 0, 1, 2, 1, 2, 0, 
                                    0, 0, 1, 0, 1, 2, 0, 0, 
                                    0, 1, 0, 0, 1, 0, 0, 0};
unsigned char spiderDiagonal2[] = {0, 1, 0, 0, 0, 0, 1, 0, 
                                    1, 0, 1, 1, 1, 1, 0, 0, 
                                    0, 1, 1, 1, 1, 0, 1, 1, 
                                    0, 1, 1, 1, 1, 1, 0, 1, 
                                    0, 1, 1, 1, 1, 2, 1, 0, 
                                    0, 1, 0, 1, 2, 1, 2, 0, 
                                    1, 0, 1, 0, 1, 2, 0, 0, 
                                    0, 0, 1, 1, 0, 0, 0, 0};

unsigned char* spiderBitmaps[] = {spiderStraight1, spiderStraight2, spiderDiagonal1, spiderDiagonal2};


void initializeGame() {
    score = 0;
    oldScore = 0;
    spiderLimit = 2;
    spiderActive = 0;
    spiderRand = 500;
    initializePlayer();
    initializeBullet();
    initializeSpider();
}

void drawGame() {
    drawErase();
    drawScore();
    for (int i = 0; i < bulletCount; i++) {
        drawBullet(&bullets[i]);
    }
    for (int i = 0; i < spiderCount; i++) {
        drawSpider(&spiders[i]);
    }
    drawPlayer();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < bulletCount; i++) {
        updateBullet(&bullets[i]);
    }
    activateSpider();
    for (int i = 0; i < spiderCount; i++) {
        updateSpider(&spiders[i]);
        if (spiders[i].active != 0 && collision(spiders[i].col, spiders[i].row, spiders[i].width, spiders[i].height,
        player.col, player.row, player.width, player.height) != 0) {
            goToLose();
        }
    }
    if (frame != 0) {
        frame = 0;
    } else {
        frame = 1;
    }
    difficulty();
}

void difficulty() {
    switch (score) {
    case 0:
        spiderLimit = 2;
        spiderRand = 500;
        break;
    case 5:
        spiderLimit = 3;
        spiderRand = 400;
        break;
    case 10:
        spiderLimit = 4;
        spiderRand = 300;
        break;
    case 20:
        spiderLimit = 5;
        spiderRand = 200;
        break;
    case 30:
        spiderLimit = 6;
        spiderRand = 150;
        break;
    case 40:
        spiderLimit = 8;
        spiderRand = 100;
        break;
    case 50:
        spiderLimit = 10;
        spiderRand = 75;
        break;
    }
}

void initializePlayer() {
    player.row = SCREENHEIGHT / 2;
    player.col = SCREENWIDTH / 2;
    player.oldRow = player.row;
    player.oldCol = player.col;
    player.velocity = 1;
    player.height = PLAYERHEIGHT;
    player.width = PLAYERWIDTH;
    player.playerBitmap = playerBitmaps[0];
    player.index = 0;
}

void drawPlayer() {
    int row = player.row;
    int col = player.col;
    //mgba_printf("working?");
    //if ((~(BUTTONS) & BUTTON_A) || (~(BUTTONS) & BUTTON_LEFT) || (~(BUTTONS) & BUTTON_RIGHT)
    //    || (~(BUTTONS) & BUTTON_UP) || (~(BUTTONS) & BUTTON_DOWN) || state != GAME) {
    //    mgba_printf("Debugging Initialized");
        for (int i = 0; i < PLAYERWIDTH; i++) {
            for (int j = 0; j < PLAYERHEIGHT; j++) {
                int value = player.playerBitmap[OFFSET(i, j, PLAYERWIDTH)];
                switch(value) {
                    case 0:
                        break;
                    case 1:
                        setPixel(col + i, row + j, PLAYERHAIR);
                        break;
                    case 2:
                        setPixel(col + i, row + j, PLAYERSKIN);
                        break;
                    case 3:
                        setPixel(col + i, row + j, PLAYERSHIRT);
                        break;
                    case 4:
                        setPixel(col + i, row + j, PLAYERGUN);
                        break;
                    case 5:
                        setPixel(col + i, row + j, PLAYERPANTS);
                        break;
                }
            }
        }
    //}
}

void updatePlayer() {
    player.oldCol = player.col;
    player.oldRow = player.row;
    
        if (BUTTON_PRESSED(BUTTON_LEFT) || BUTTON_HELD(BUTTON_LEFT)) {
            player.playerBitmap = playerBitmaps[0];
            player.index = 0;
            if (player.col > 56) {
                player.col -= player.velocity;
            }
        }
        if (BUTTON_PRESSED(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_RIGHT)) {
            player.playerBitmap = playerBitmaps[1];
            player.index = 1;
            if (player.col < 179) {
                player.col += player.velocity;
            }
        }
        if (BUTTON_PRESSED(BUTTON_DOWN) || BUTTON_HELD(BUTTON_DOWN)) {
            player.playerBitmap = playerBitmaps[2];
            player.index = 2;
            if (player.row < 136) {
                player.row += player.velocity;
            }
        }
        if (BUTTON_PRESSED(BUTTON_UP) || BUTTON_HELD(BUTTON_UP)) {
            player.playerBitmap = playerBitmaps[3];
            player.index = 3;
            if (player.row > 5) {
                player.row -= player.velocity;
            }
        }
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireBullet();
    }
}

void initializeBullet() {
    for (int i = 0; i < 6; i++) {
        bullets[i].col = 0;
        bullets[i].row = 0;
        bullets[i].width = 1;
        bullets[i].height = 1;
        bullets[i].oldCol = bullets[i].col;
        bullets[i].oldRow = bullets[i].row;
        bullets[i].horVelocity = 0;
        bullets[i].verVelocity = 0;
        bullets[i].active = 0;
        bullets[i].erased = 0;
    }
}

void drawBullet(BULLET* bullet) {
    if (bullet->active != 0) {
        setPixel(bullet->col, bullet->row, WHITE);
    }
}

void updateBullet(BULLET* bullet) {
    if (bullet -> active != 0) {
        bullet->oldCol = bullet->col;
        bullet->oldRow = bullet->row;
        bullet->col += bullet->horVelocity;
        bullet->row += bullet->verVelocity;
        if (bullet->row <= 7 || bullet->row >= SCREENHEIGHT - 7 || bullet->col <= 49
            || bullet->col >= 188) {
                bullet->active = 0;
                bullet->horVelocity = 0;
                bullet->verVelocity = 0;
                bullet->erased = 1;
            }
    }
}

void fireBullet() {
    for (int i = 0; i < (bulletCount); i++) {
        if (bullets[i].active == 0) {
            switch (player.index){
            case 0:
                bullets[i].horVelocity = -BULLETVELOCITY;
                bullets[i].row = player.row + 3;
                bullets[i].col = player.col;
                break;
            case 1:
                bullets[i].horVelocity = BULLETVELOCITY;
                bullets[i].row = player.row + 3;
                bullets[i].col = player.col + 4;
                break;
            case 2:
                bullets[i].verVelocity = BULLETVELOCITY;
                bullets[i].row = player.row + 3;
                bullets[i].col = player.col + 2;
                break;
            case 3:
                bullets[i].verVelocity = -BULLETVELOCITY;
                bullets[i].row = player.row + 3;
                bullets[i].col = player.col + 2;
                break;
            }
            bullets[i].active = 1;
            break;
        }
    }
}

void initializeSpider() {
    for (int i = 0; i < spiderCount; i++) {
        spiders[i].row = 0;
        spiders[i].col = 0;
        spiders[i].oldRow = spiders[i].row;
        spiders[i].oldCol = spiders[i].col;
        spiders[i].verVelocity = 0;
        spiders[i].horVelocity = 0;
        spiders[i].height = SPIDERHEIGHT;
        spiders[i].width = SPIDERWIDTH;
        spiders[i].spiderBitmap = spiderBitmaps[0];
        spiders[i].active = 0;
        spiders[i].erased = 0;
    }
}

void drawSpider(SPIDER* spider) {
    if (spider->active != 0) {
        if ((spider->horVelocity == spiderVelocity && spider->verVelocity == spiderVelocity)
        || (spider->verVelocity == spiderVelocity && spider->horVelocity == 0)) { //FACING DOWNWARD OR DOWN AND RIGHT
            for (int i = 0; i < spider->width; i++) {
                for (int j = 0; j < spider->height; j++) {
                    int value = spider->spiderBitmap[OFFSET(i, j, spider->width)];
                    switch (value) {
                        case 1:
                            setPixel(spider->col + i, spider->row + j, BLACK);
                            break;
                        case 2:
                            setPixel(spider->col + i, spider->row + j, RED);
                            break;
                    }
                }
            }
        } else if ((spider->horVelocity == spiderVelocity && spider->verVelocity == -spiderVelocity)
        || (spider->horVelocity == spiderVelocity && spider->verVelocity == 0)) { //FACING RIGHT OR UP AND RIGHT
            for (int i = 0; i < spider->height; i++) {
                for (int j = spider->width - 1; j >= 0; j--) {
                    int value = spider->spiderBitmap[OFFSET((SPIDERWIDTH - 1) - j, i, spider->width)]; // COL, ROW, ROWLEN
                    switch (value) {
                        case 1:
                            setPixel(spider->col + i, spider->row + j, BLACK);
                            break;
                        case 2:
                            setPixel(spider->col + i, spider->row + j, RED);
                            break;
                    }
                }
            }
        } else if ((spider->horVelocity == -spiderVelocity && spider->verVelocity == -spiderVelocity)
        || (spider->verVelocity == -spiderVelocity && spider->horVelocity == 0)) { //FACING UP OR LEFT AND UP
            for (int i = spider->width - 1; i >= 0; i--) {
                for (int j = spider->height - 1; j >= 0; j--) {
                    int value = spider->spiderBitmap[OFFSET((SPIDERWIDTH - 1) - i, (SPIDERWIDTH - 1) - j, spider->width)]; // COL, ROW, ROWLEN
                    switch (value) {
                        case 1:
                            setPixel(spider->col + i, spider->row + j, BLACK);
                            break;
                        case 2:
                            setPixel(spider->col + i, spider->row + j, RED);
                            break;
                    }
                }
            }
        } else {
            for (int i = spider->height - 1; i >= 0; i--) {
                for (int j = 0; j < spider->width; j++) {
                    int value = spider->spiderBitmap[OFFSET(j, (SPIDERWIDTH - 1) - i, spider->width)]; // COL, ROW, ROWLEN
                    switch (value) {
                        case 1:
                            setPixel(spider->col + i, spider->row + j, BLACK);
                            break;
                        case 2:
                            setPixel(spider->col + i, spider->row + j, RED);
                            break;
                    }
                }
            }
        }
    }
}

void updateSpider(SPIDER* spider) {
    if (spider->active != 0) {
        if (player.col > spider->col) {
            spider->horVelocity = SPIDERVELOCITY;
        } else if (player.col + PLAYERWIDTH < spider->col) {
            spider->horVelocity = -SPIDERVELOCITY;
        } else {
            spider->horVelocity = 0;
        }
        if (player.row >= spider->row) {
            spider->verVelocity = SPIDERVELOCITY;
        } else if (player.row + PLAYERHEIGHT <= spider->row) {
            spider->verVelocity = -SPIDERVELOCITY;
        } else {
            spider->verVelocity = 0;
        }

        spider->oldCol = spider->col;
        spider->oldRow = spider->row;

        if (frame != 0) {
            spider->col += spider->horVelocity;
            spider->row += spider->verVelocity;
            if (spider->horVelocity != 0 && spider->verVelocity != 0) {
                if (spider->spiderBitmap == spiderBitmaps[2]) {
                    spider->spiderBitmap = spiderBitmaps[3];
                } else {
                    spider->spiderBitmap = spiderBitmaps[2];
                }
            } else {
                if (spider->spiderBitmap == spiderBitmaps[0]) {
                    spider->spiderBitmap = spiderBitmaps[1];
                } else {
                    spider->spiderBitmap = spiderBitmaps[0];
                }
            }
        }

        for (int i = 0; i < bulletCount; i++) {
            if (bullets[i].active != 0
                && collision(bullets[i].col, bullets[i].row, bullets[i].width, bullets[i].height, spider->col, spider->row, spider->width, spider->height)) {
                    bullets[i].active = 0;
                    bullets[i].erased = 1;
                    bullets[i].horVelocity = 0;
                    bullets[i].verVelocity = 0;
                    spider->active = 0;
                    spider->erased = 1;
                    spiderActive -= 1;
                    score++;
                }
        }
    }
}

void activateSpider() {
    if (rand() % spiderRand == 1 && spiderActive < spiderLimit) {
        for (int i = 0; i < spiderCount; i++) {
            if (spiders[i].active == 0) {
                spiders[i].active = 1;
                int side = 142;
                int spiderSpawn = rand() % (side * 4);
                if (spiderSpawn < side) { //Spawn at the top
                    spiders[i].row = 4;
                    spiders[i].col = (spiderSpawn % side) + 44;
                } else if (spiderSpawn < side * 2) { //Spawn at the right
                    spiders[i].row = 4 + (spiderSpawn % side);
                    spiders[i].col = 196 - spiders[i].width;
                } else if (spiderSpawn < side * 3) { //Spawn at the bottom
                    spiders[i].row = 154 - spiders[i].height;
                    spiders[i].col = (spiderSpawn % side) + 44;
                } else { //Spawn at the left
                    spiders[i].row = 4 + (spiderSpawn % side);
                    spiders[i].col = 44;
                }
                spiderActive++;
                i = spiderCount;
            }
        }
    }
}

void drawScore() {
    if (oldScore != score) {
        char str[10];
        itoa(score, str, 10);
        if (score < 10) {
            drawRect(16, (SCREENHEIGHT / 2), 6, 8, BLACK);
            drawString(16, (SCREENHEIGHT / 2), str, WHITE);
        } else if (score < 100) {
            drawRect(13, (SCREENHEIGHT / 2), 12, 8, BLACK);
            drawString(13, (SCREENHEIGHT / 2), str, WHITE);
        } else {
            drawRect(10, (SCREENHEIGHT / 2), 18, 8, BLACK);
            drawString(10, (SCREENHEIGHT / 2), str, WHITE);
        }
        oldScore = score;
    }
}

void drawErase() {
    if (player.oldCol != player.col || player.oldRow != player.row) {
        fillPartImage(player.oldCol, player.oldRow, player.oldCol - 42, player.oldRow - 2, PLAYERWIDTH, PLAYERHEIGHT, 156, backgroundBitmap);
    }
    for (int i = 0; i < bulletCount; i++) {
        if (bullets[i].active != 0 || bullets[i].erased != 0) {
            fillPartImage(bullets[i].oldCol, bullets[i].oldRow, bullets[i].oldCol - 42, bullets[i].oldRow - 2, 1, 1, 156, backgroundBitmap);
            bullets[i].erased = 0;
        }
    }
    for (int i = 0; i < spiderCount; i++) {
        if (spiders[i].active != 0 || spiders[i].erased != 0) {
            fillPartImage(spiders[i].oldCol, spiders[i].oldRow, spiders[i].oldCol - 42, spiders[i].oldRow - 2, spiders[i].width, spiders[i].height, 156, backgroundBitmap);
            spiders[i].erased = 0;
        }
    }
}