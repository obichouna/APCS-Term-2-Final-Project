import java.util.*;

public class Move {
  public String name;
  public String type;
  public String effect;
  public int dmg, acc, pp;
  public boolean phys;
  //public File data = new File("Moves.txt");

  public Move(int id) {
    try {
      Scanner scan = new Scanner(new File("Moves.txt"));
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
    catch (Exception e) {
    }
  }
}