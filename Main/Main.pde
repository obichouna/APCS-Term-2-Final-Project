Player player;
float speed = 10;
String state = "map";
Battle battle;
Enemy e;

public void setup () {
  size(500, 500);
  background(0, 0, 0);
  player = new Player(width / 2, height / 2);
  //battle = new Battle(player, new Enemy(0, 0));
  e = new Enemy(50, 50);
  //System.out.println(battle.yourPoke.name);
}

public void draw () {
  if (state == "map") {
    background(0, 255, 0);
    player.draw();
    e.draw();
    e.xCor++;
    e.yCor++;
    //fill(255, 255, 255);
    //rect(50, 50, 100, 100);
  }
  if (state == "battle") {
    battle.draw();
  }
}

public void keyPressed () {
  if (key == 'w') {
    walk(0, -1 * speed);
  }
  if (key == 'a') {
    walk(-1 * speed, 0);
  }
  if (key == 's') {
    walk(0, speed);
  }
  if (key == 'd') {
    walk(speed, 0);
  }
}

public void walk (float deltaX, float deltaY) {
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