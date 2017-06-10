import java.util.*;

public abstract class Entity {

  public float xCor, yCor;
  public PImage sprite;
  public List<Pokemon> pokemon;

  public abstract void draw ();
}

public class Player extends Entity {
  public ArrayList<Pokemon> party = new ArrayList<Pokemon>(6);


  public Player (float x, float y) {
    xCor = x;
    yCor = y;
    sprite = loadImage("Player.png");
    party.add(new Pokemon(0));
    party.add(new Pokemon(1));
  }

  public void draw () {
    //imageMode(CENTER);
    image(sprite, xCor, yCor, 25, 25);
    fill(0, 0, 255);
    //rect(xCor, yCor, 10, 10);
  }
}

public class Enemy extends Entity {
  public Stack<Pokemon> party = new Stack<Pokemon>();

  public Enemy (float x, float y) {
    xCor = x;
    yCor = y;
    party.push(new Pokemon(0));
  }
  
  public void fight (Player p) {
    float d = dist(xCor, yCor, p.xCor, p.yCor);
    if (d <= 15) {
       battle = new Battle(p, this, true);
       state = "battle";
    }
  }

  public void draw () {
    fill(255, 0, 0);
    rect(xCor, yCor, 10, 10);
  }
}