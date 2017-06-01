public void setup () {
  size(500, 500);
  background(0, 0, 0);

  Player player = new Player();
}

public void draw () {
  fill(255, 255, 255);
}

public void keyPressed () {
  if (key == 'w') {
    player.direction = -1;
  }
  if (key == 'a') {
    player.direction = -1;
  }
  if (key == 's') {
    player.direction = 1;
  }
  if (key == 'd') {
    player.direction = 1;
  }
}


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