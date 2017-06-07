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
      BufferedReader reader = createReader("Pokemon.txt");
      String line = "";
      while (id != 0) {
        reader.readLine();
        id--;
      }
      line = reader.readLine();
      String[] data = line.split("\\s+");
      name = data[0];
      type = data[1];
      lvl = Integer.parseInt(data[2]);
      hp = Integer.parseInt(data[3]);
      att = Integer.parseInt(data[4]);
      def = Integer.parseInt(data[5]);
      sAtt = Integer.parseInt(data[6]);
      sDef = Integer.parseInt(data[7]);
      spd = Integer.parseInt(data[8]);
      moves.add(new Move(Integer.parseInt(data[9])));
      moves.add(new Move(Integer.parseInt(data[10])));
      moves.add(new Move(Integer.parseInt(data[11])));
      moves.add(new Move(Integer.parseInt(data[12])));
    } 
    catch (Exception e) {
      System.out.println("File not found");
    }
  }
}