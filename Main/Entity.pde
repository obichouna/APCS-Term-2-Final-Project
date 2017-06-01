import java.util.*;

public abstract class Entity {

  public float xCor, yCor;
  //public PImage sprite;
  //public List<Pokemon> pokemon;

  public abstract void draw ();
}

public class Player extends Entity {
  //public ArrayList<Pokemon> party = new ArrayList<Pokemon>(6);
  

  public Player() {
    //party.add(new Pikachu(true));
  }

  public void draw () {
    
  }
}