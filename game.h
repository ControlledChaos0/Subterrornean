#define PLAYERHEIGHT 7
#define PLAYERWIDTH 5

#define PLAYERHAIR COLOR(0, 0, 20)
#define PLAYERSKIN COLOR(28, 23, 16)
#define PLAYERSHIRT COLOR(20, 12, 9)
#define PLAYERGUN COLOR(0, 0, 0)
#define PLAYERPANTS COLOR(2, 3, 10)

#define BULLETVELOCITY 2

#define SPIDERVELOCITY 1
#define SPIDERHEIGHT 8
#define SPIDERWIDTH 8

extern int score;

typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int velocity;
    int height;
    int width;
    unsigned char* playerBitmap;
    int index;
} PLAYER;

extern PLAYER player;

typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int width;
    int height;
    int horVelocity;
    int verVelocity;
    int active;
    int erased;
} BULLET;

typedef struct {
    int row;
    int col;
    int oldRow;
    int oldCol;
    int horVelocity;
    int verVelocity;
    int height;
    int width;
    unsigned char* spiderBitmap;
    int active;
    int erased;
} SPIDER;

//function prototypes
    //GAME
void initializeGame();
void drawGame();
void drawErase();
void updateGame();
    //PLAYER
void initializePlayer();
void drawPlayer();
void updatePlayer();
    //BULLET
void initializeBullet();
void drawBullet(BULLET*);
void updateBullet(BULLET*);
void fireBullet();
    //SPIDER
void initializeSpider();
void drawSpider(SPIDER*);
void updateSpider(SPIDER*);
void activateSpider();
    //SCORE
void drawScore();
void difficulty();