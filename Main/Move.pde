import java.util.*;

public class Move{
  public String name;
  public String type;
  public float dmg, acc;
  public boolean phys;
  
  public Move(float id){
  Scanner scan = new Scanner("Moves.txt");
  while (id != 0){
   scan.nextLine();
   id--;
  }
  name = scan.next();
  type = scan.next();
  dmg = scan.nextInt();
  acc = scan.nextInt();
  phys = scan.next();
  
}