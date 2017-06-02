Player player;

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