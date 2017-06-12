import java.util.*;

public abstract class Entity {

  public float xCor, yCor;
  public PImage sprite;
  //public List<Pokemon> pokemon;

  public abstract void draw ();
}

public class Player extends Entity {
  public ArrayList<Pokemon> party = new ArrayList<Pokemon>(6);
  public Player (float x, float y) {
    xCor = x;
    yCor = y;
    sprite = loadImage("Player.png");
    party.add(new Pokemon(0));
  }

  public void draw () {
    imageMode(CENTER);
    image(sprite, xCor, yCor, 50, 50);
  }
}

public class Enemy extends Entity {
  public Stack<Pokemon> party = new Stack<Pokemon>();

  public Enemy (float x, float y) {
    xCor = x;
    yCor = y;
    sprite = loadImage("Red.png");
    for (int i = 0; i < 6; i++) {
      party.push(new Pokemon(i));
    }
  }

  public Enemy (float num) {
    party.push(new Pokemon(floor(random(6))));
  }

  public void fight (Player p) {
    float d = dist(xCor, yCor, p.xCor, p.yCor);
    if (d <= 15) {
      battle = new Battle(p, this, true);
      state = "battle";
    }
  }

  public void draw () {
    imageMode(CENTER);
    image(sprite, xCor, yCor, 50, 50);
  }
}

public class Pokecenter extends Entity {

  public Pokecenter (float x, float y) {
    xCor = x;
    yCor = y;
    sprite = loadImage("Pokecenter.png");
  }

  private void heal (Player p) {
    float d = dist(xCor, yCor + 60, p.xCor, p.yCor);
    if (d <= 10) {
      for (Pokemon poke : p.party) {
        if (poke.hp != poke.maxHP) {
          poke.hp = poke.maxHP;
          System.out.println("Healed " + poke.name);
        }
      }
    }
  }

  public void draw () {
    imageMode(CENTER);
    image(sprite, xCor, yCor, 140, 112);
  }
}

public class LongGrass extends Entity {

  public LongGrass (float x, float y) {
    xCor = x;
    yCor = y;
    sprite = loadImage("Grass_long.png");
  }

  public void steppedOn (Player p) {
    float d = dist(xCor, yCor, p.xCor, p.yCor);
    if (d <= 6) {
      int rand = floor(random(20));
      if (rand == 13) {
        battle = new Battle(p, new Enemy(0), false);
        state = "battle";
      }
    }
  }

  public void draw () {
    imageMode(CENTER);
    image(sprite, xCor, yCor, 25, 25);
  }
}

public class Door extends Entity {

  String  target;
  float exitX, exitY;

  public Door (float x, float y, String str, float eX, float eY) {
    xCor = x;
    yCor = y;
    target = str;
    exitX = eX;
    exitY = eY;
  }

  private void transport (Player p) {
    float d = dist(xCor, yCor, p.xCor, p.yCor);
    if (d <= 40) {
      state = target;
      p.xCor = exitX;
      p.yCor = exitY;
    }
  }

  public void draw () {
    fill(0, 0, 0);
    rect(xCor, yCor, 10, 10);
  }
}