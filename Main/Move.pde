import java.util.*;

public class Move {
  public String name;
  public String type;
  public String effect;
  public float dmg, acc, pp;
  public boolean phys;

  public Move(float id) {
    Scanner scan = new Scanner("Moves.txt");
    while (id != 0) {
      scan.nextLine();
      id--;
    }
    name = scan.next();
    type = scan.next();
    effect = scan.next();
    dmg = scan.nextInt();
    pp = scan.nextInt();
    acc = scan.nextInt();
    phys = scan.nextBoolean();
  }
}