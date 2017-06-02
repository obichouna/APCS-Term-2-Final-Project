Player player;
float speed = 10;
String state = "battle";
Battle battle;

public void setup () {
  size(500, 500);
  background(0, 0, 0);
  player = new Player(width / 2, height / 2);
}

public void draw () {
  if (state == "map") {
    background(0, 0, 255);
    player.draw();
    //fill(255, 255, 255);
    //rect(50, 50, 100, 100);
  }
  if (state == "battle") {
    background(255, 255, 255);
  }
}

public void keyPressed () {
  if (key == 'w') {
    move(0, -1 * speed);
  }
  if (key == 'a') {
    move(-1 * speed, 0);
  }
  if (key == 's') {
    move(0, speed);
  }
  if (key == 'd') {
    move(speed, 0);
  }
}

public void move (float deltaX, float deltaY) {
  player.xCor += deltaX;
  player.yCor += deltaY;
}

/*
void keyReleased() {
 if (key == 'w') {
 player.direction =
 }
 if (key == 'a') {
 player.direction =
 }
 if (key == 's') {
 player.direction =
 }
 if (key == 'd') {
 player.direction =
 }
 }
 */