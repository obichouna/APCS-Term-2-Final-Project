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
    party.add(new Pokemon(0));
  }

  public void draw () {
    //imageMode(CENTER);
    //image(img, xCor, yCor, 10, 10);
    fill(255, 0, 0);
    rect(xCor, yCor, 10, 10);
  }
}

public class Enemy extends Entity {
  public Stack<Pokemon> party = new Stack<Pokemon>();

  public Enemy (float x, float y) {
    xCor = x;
    yCor = y;
    party.push(new Pokemon(0));
  }

  public void draw () {
  }
}