import java.util.*;
import java.io.File;

public class Pokemon {
  public String name;
  public int hp, att, def, sAtt, sDef, spd, lvl;
  public PImage picture;
  public ArrayList<Move> moves = new ArrayList<Move>(4);
  public String type;

    public Pokemon(float id){
        Scanner scan = new Scanner("Pokemon.txt");
        while (id != 0){
          scan.nextLine();
          id--;
        }
        name = scan.next();
        type = scan.next();
        lvl = scan.nextInt();
        hp = scan.nextInt();
        att = scan.nextInt();
        def = scan.nextInt();
        sAtt = scan.nextInt();
        sDef = scan.nextInt();
        spd = scan.nextInt();
        moves.add(move(scan.nextInt()));
        moves.add(move(scan.nextInt()));
        moves.add(move(scan.nextInt()));
        moves.add(move(scan.nextInt()));
    }
  }
}