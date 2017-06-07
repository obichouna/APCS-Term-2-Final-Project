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
      BufferedReader reader = createReader("Moves.txt");
      String line = "";
      while (id != 0) {
        reader.readLine();
        id--;
      }
      line = reader.readLine();
      String[] data = line.split("\\s+");
      name = data[0];
      type = data[1];
      effect = data[2];
      dmg = Integer.parseInt(data[3]);
      pp = Integer.parseInt(data[4]);
      acc = Integer.parseInt(data[5]);
      phys = Boolean.parseBoolean(data[6]);
    }
    catch (Exception e) {
    }
  }
}