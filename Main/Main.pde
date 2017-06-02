Player player;
float speed = 10;

public void setup () {
  size(500, 500);
  background(0, 0, 0);
  player = new Player(width / 2, height / 2);
}

public void draw () {
  player.draw();
  //fill(255, 255, 255);
  //rect(50, 50, 100, 100);
}

public void keyPressed () {
  if (key == 'w') {
    player.yCor -= speed;
  }
  if (key == 'a') {
    player.xCor -= speed;
  }
  if (key == 's') {
    player.yCor += speed;
  }
  if (key == 'd') {
    player.xCor += speed;
  }
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