public class Types {

  public ArrayList<String> strength = new ArrayList<String>();
  public ArrayList<String> weakness = new ArrayList<String>();
  public String name;

  public Types(String x) {
    name = x;
    switch(x) {
    case "ELECTRIC":
      strength.add("WATER");
      weakness.add("GRASS");
      weakness.add("ROCK");
      break;
    case "FIRE":
      strength.add("GRASS");
      strength.add("ICE");
      weakness.add("WATER");
      weakness.add("ROCK");
      break;
    case "WATER":
      strength.add("FIRE");
      strength.add("ROCK");
      weakness.add("ICE");
      weakness.add("GRASS");
      weakness.add("ELECTRIC");
      break;
    case "GRASS":
      strength.add("ROCK");
      strength.add("WATER");
      weakness.add("FIRE");
      weakness.add("ICE");
      break;
    case "PSYCHIC":
      break;
    case "ROCK":
      strength.add("FIRE");
      strength.add("ELECTRIC");
      weakness.add("WATER");
      weakness.add("GRASS");
      weakness.add("ICE");
      break;
    case "ICE":
      strength.add("GRASS");
      strength.add("ROCK");
      weakness.add("FIRE");
      break;
    default: 
      break;
    }
  }
}