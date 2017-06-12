public abstract class Scene { 

  public Player player;

  public abstract void draw ();
}

public class Map extends Scene {

  // Add enemies, roads, buildings, trees, etc
  Pokecenter pCenter;
  ArrayList<LongGrass> grass;
  boolean isBoss;
  Door d;

  public Map (Player p, boolean bool) {
    player = p;
    grass = new ArrayList<LongGrass>();
    isBoss = bool;
    d = new Door(225, 475, "map", 225, 75);
    if (!isBoss) {
      d = new Door(225, 25, "boss", 225, 425);
      pCenter = new Pokecenter(400, 75);
      for (int count = 65; count < width - 50; count += 25) {
        grass.add(new LongGrass(count, 350));
        grass.add(new LongGrass(count, 375));
        grass.add(new LongGrass(count, 400));
        grass.add(new LongGrass(count, 425));
        grass.add(new LongGrass(count, 450));
      }
    }
  }

  public void draw () {
    imageMode(CENTER);
    image(loadImage("Grass.png"), width / 2, height / 2, 500, 500);
    for (int count = 25; count < width; count += 50) {
      if (isBoss) {
        if (count != 225) {
          image(loadImage("Tree.png"), count, height - 25, 50, 50);
        }
        image(loadImage("Tree.png"), count, 25, 50, 50);
      } else {
        image(loadImage("Tree.png"), count, height - 25, 50, 50);
        if (count != 225) {
          image(loadImage("Tree.png"), count, 25, 50, 50);
        }
      }
    }
    for (int count = 25; count < height; count += 50) {
      image(loadImage("Tree.png"), width - 25, count, 50, 50);
      image(loadImage("Tree.png"), 25, count, 50, 50);
    }
    for (LongGrass g : grass) {
      g.draw(); 
      //g.steppedOn(player);
    }
    if (!isBoss) {
      pCenter.draw();
    }
    player.draw();
    d.transport(player);
  }
}