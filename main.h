u16 oldButtons;
u16 buttons;

enum states {START, GAME, PAUSE, LOSE};
extern int state;

void draw();
void update();
void initialize();

void goToStart();
void goToGame();
void goToPause();
void goToLose();

void start();
void game();
void pause();
void lose();