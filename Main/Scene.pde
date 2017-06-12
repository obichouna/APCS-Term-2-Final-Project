public abstract class Scene { 

  public Player player;

  public abstract void draw ();
}

public class Map extends Scene {

  // Add enemies, roads, buildings, trees, etc
  Pokecenter pCenter = new Pokecenter(400, 75);

  public Map (Player p) {
    player = p;
  }

  public void draw () {
    imageMode(CENTER);
    image(loadImage("Grass.png"), width / 2, height / 2, 500, 500);
    for (int count = 25; count < width; count += 50) {
      image(loadImage("Tree.png"), count, height - 25, 50, 50);
      if (count != 225) {
        image(loadImage("Tree.png"), count, 25, 50, 50);
      }
    }
    for (int count = 25; count < height; count += 50) {
      image(loadImage("Tree.png"), width - 25, count, 50, 50);
      image(loadImage("Tree.png"), 25, count, 50, 50);
    }
    pCenter.draw();
    player.draw();
  }
}