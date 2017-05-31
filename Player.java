import java.util.*;

public class Player extends Entity{
    public ArrayList<Pokemon> party = new ArrayList<Pokemon>(6);

    public Player(){
	party.add(new Pikachu(true));
    }

}
