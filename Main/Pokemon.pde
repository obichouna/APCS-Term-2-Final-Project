import java.util.*;
import java.io.File;

public class Pokemon {
  public String name;
  public int hp, att, def, sAtt, sDef, spd, lvl;
  public PImage picture;
  public ArrayList<Move> moves = new ArrayList<Move>(4);
  public String type;

  public Pokemon(int id) {
    try {
      Bufferedreader reader = createReader("Pokemon.txt");
      while (id != 0) {
        scan.nextLine();
        id--;
      }
      name = scan.next();
      //System.out.println(name);
      type = scan.next();
      //System.out.println(type);
      lvl = scan.nextInt();
      //System.out.println(lvl);
      hp = scan.nextInt();
      //System.out.println(hp);
      att = scan.nextInt();
      def = scan.nextInt();
      sAtt = scan.nextInt();
      sDef = scan.nextInt();
      spd = scan.nextInt();
      moves.add(new Move(scan.nextInt()));
      moves.add(new Move(scan.nextInt()));
      moves.add(new Move(scan.nextInt()));
      moves.add(new Move(scan.nextInt()));
    } 
    catch (Exception e) {
      System.out.println("File not found");
    }
  }
}