public abstract class Scene { //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//

  public Player player;

  public abstract void draw ();
}

public class Map extends Scene {

  // Add enemies, roads, buildings, trees, etc

  public void draw () {
    background(0, 255, 0);
  }
}

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


public class Battle extends Scene {

  public Enemy enemy;
  public Pokemon yourPoke, enemyPoke;
  public boolean isTrainer, isYourTurn = true, deathScreen = false, winScreen = false;
  public String choice = "none";
  public Move moveUsed;
  private int delay = 0;

  public Battle (Player p, Enemy e, boolean bool) {
    isTrainer = bool;
    player = p;
    enemy = e;
    yourPoke = player.party.get(0);
    enemyPoke = enemy.party.pop();
    if (enemyPoke.spd > yourPoke.spd) {
      isYourTurn = false;
    }
  }

  public void draw () {
    update();
    background(255, 255, 255);
    if (deathScreen) {
      fill(0, 0, 0);
      textAlign(CENTER);
      text("YOU DIED :(", width / 2, height / 2, 300);
    } else if (winScreen) {
      fill(0, 0, 0);
      textAlign(CENTER);
      text("YOU WON :D", width / 2, height / 2, 300);
    } else if (choice == "pokemon") {
      pokemon();
      delay++;
    } else {
      top();
      if (choice == "fight") {
        moves();
        delay++;
      } else if (choice == "run") {
        run();
      } else {
        bottom();
      }
    }
  }

  public void bottom () {
    rectMode(CORNER);
    // Base rectangle
    fill(0, 0, 0);
    rect(0, 390, width, 110);
    // White rectangles
    fill(255, 255, 255);
    rect(7, 400, width / 2 - 10, 90, 10);
    rect(width / 2 + 7, 400, width / 2 - 15, 90, 10);
    // Choices
    fill(0, 0, 0);
    textSize(27);
    textAlign(LEFT);
    text("FIGHT", width / 2 + 20, 430);
    text("BAG", width - 75, 430);
    text("POKEMON", width / 2 + 20, 470);
    text("RUN", width - 75, 470);
    // Flavor text
    text("What will", 20, 430);
    text(yourPoke.name + " do?", 20, 470);
  }

  public void top () {
    // Sprites
    imageMode(CENTER);
    image(enemyPoke.front, width / 4 * 3, 150, 200, 200);
    image(yourPoke.back, width / 4, 297, 240, 240);
    rectMode(CORNER);
    // Base rectangles
    fill(0, 0, 0);
    rect(10, 30, 200, 50, 10);
    rect(width / 2 + 40, 310, 200, 70, 10);
    // Names
    fill(255, 255, 255);
    textAlign(LEFT);
    textSize(27);
    text(yourPoke.name, 295, 340);
    text(enemyPoke.name, 15, 60);
    // Health text
    textSize(20);
    text("" + yourPoke.hp + "/" + yourPoke.maxHP, 295, 375);
    // Health bar base
    rect(15, 65, 190, 10, 90);
    rect(width / 2 + 45, 345, 190, 10, 90);
    // Health bar top
    fill(0, 255, 0);
    rect(15, 65, enemyPoke.hp * (190.0 / enemyPoke.maxHP), 10, 90);
    rect(width / 2 + 45, 345, yourPoke.hp * (190.0 / yourPoke.maxHP), 10, 90);
  }

  public void moves () {
    // Base rectangle
    fill(0, 0, 0);
    rect(0, 390, width, 110);
    // White rectangles
    fill(255, 255, 255);
    rect(7, 400, width - 14, 90, 10);
    //rect(width / 2 + 70, 400, 100, 90, 10);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(27);
    text(yourPoke.moves.get(0).name.replace("_", " "), width / 4, 430);
    text(yourPoke.moves.get(1).name.replace("_", " "), 3 * width / 4, 430);
    text(yourPoke.moves.get(2).name.replace("_", " "), width / 4, 480);
    text(yourPoke.moves.get(3).name.replace("_", " "), 3 * width / 4, 480);
  }

  public void pokemon () {
    int[][] coords = { 
      {width / 4, 60}, 
      {3 * width / 4, 60}, 
      {width / 4, 190}, 
      {3 * width / 4, 190}, 
      {width / 4, 320}, 
      {3 * width / 4, 320}, 
    };
    int count = 0;
    while (count < player.party.size()) {
      pokemonHelper(coords[count][0], coords[count][1], player.party.get(count), true);
      count++;
    }
    while (count < 6) {
      pokemonHelper(coords[count][0], coords[count][1], null, false);
      count++;
    }
  }

  private void pokemonHelper (int x, int y, Pokemon poke, boolean filled) {
    textAlign(LEFT);
    rectMode(CENTER);
    fill(0, 0, 0);
    rect(x, y, 210, 110, 10);
    if (filled) {
      imageMode(CENTER);
      image(poke.front, x - 63, y - 15, 65, 65);
      fill(255, 255, 255);
      textSize(25);
      text(poke.name, x - 20, y - 10);
      textSize(20);
      text("" + poke.hp + "/" + poke.maxHP, x - 100, y + 50);
      rect(x, y + 25, 200, 10, 90);
      rectMode(CORNER);
      fill(0, 255, 0);
      rect(x - 100, y + 20, poke.hp * (200.0 / poke.maxHP), 10, 90);
      //rect(x + 5, y + 10, 50, 50, 10);
    }
    textScreen ("Choose a Pokemon");
  }

  public void switchOut (int num) {
    if (num - 1 < player.party.size()) {
      Pokemon newPoke = player.party.get(num - 1);
      yourPoke = newPoke;
      choice = "none";
      delay = 0;
    }
  }

  public void textScreen (String str) {
    rectMode(CORNER);
    fill(0, 0, 0);
    rect(0, 390, width, 110);
    fill(255, 255, 255);
    rect(7, 400, width - 14, 90, 10);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(30);
    text(str, width /2, 455);
  }

  public void run () {
    if (isTrainer) {
      textScreen("Can't run from a trainer battle");
    } else {
      textScreen("Successfully got away");
    }
    if (delay == 50) {
      if (isTrainer) {
        choice = "none";
      } else {
        state = "map";
      }
      delay = 0;
    } else {
      delay++;
    }
  }

  /*
  public void run () {
   fill(0, 0, 0);
   if (isTrainer) {
   textScreen("Can't run away from a battle");
   delay(1000);
   } else {
   textScreen("Successfully ran away");
   delay(1000);
   state = "map";
   }
   choice = "none";
   }
   
   */

  public void update () {
    if ((player.party.size() == 1) && yourPoke.hp == 0) {
      deathScreen = true;
    }
    if ((enemy.party.size() == 0) && (enemyPoke.hp == 0)) {
      e = null;
      showEnemy = false;
      winScreen = true;
    }
  }

  public void yourTurn () {
    if (choice.equals("fight")) {
      if (moveUsed.phys) {
        Types moveT = new Types(moveUsed.type);
        float multiplier = 1;
        if (moveT.strength.indexOf(enemyPoke.type) > 0) {
          multiplier = 2;
        } else if (moveT.weakness.indexOf(enemyPoke.type) > 0) {
          multiplier = 0.5;
        }
        //enemyPoke.hp = enemyPoke.hp - 10;
        enemyPoke.hp = enemyPoke.hp -(int)(((((((2 * yourPoke.lvl) / 5) * yourPoke.att * moveUsed.dmg)/ enemyPoke.def)/50) * multiplier) / 3);
        isYourTurn = false;
        enemyTurn();
      } else {
        Types moveT = new Types(moveUsed.type);
        float multiplier = 1;
        if (moveT.strength.indexOf(enemyPoke.type) > 0) {
          multiplier = 2;
        } else if (moveT.weakness.indexOf(enemyPoke.type) > 0) {
          multiplier = 0.5;
        }
        //enemyPoke.hp = enemyPoke.hp - 10;
        enemyPoke.hp = enemyPoke.hp -(int)(((((((2 * yourPoke.lvl) / 5) * yourPoke.sAtt * moveUsed.dmg)/ enemyPoke.sDef)/50) * multiplier) / 3);
        isYourTurn = false;
        enemyTurn();
      }
    }
  }

  public void enemyTurn () {
    Random r = new Random();
    Move enemyMove = enemyPoke.moves.get(r.nextInt(4));
    //Move enemyMove = enemyPoke.moves.get(0);
    if (enemyMove.phys) {
        Types moveT = new Types(enemyMove.type);
        float multiplier = 1;
        if (moveT.strength.indexOf(yourPoke.type) > 0) {
          multiplier = 2;
        } else if (moveT.weakness.indexOf(yourPoke.type) > 0) {
          multiplier = 0.5;
        }
        //enemyPoke.hp = enemyPoke.hp - 10;
        yourPoke.hp = yourPoke.hp -(int)(((((((2 * enemyPoke.lvl) / 5) * enemyPoke.att * enemyMove.dmg)/ yourPoke.def)/50) * multiplier) / 3);
        isYourTurn = true;
      } else {
        Types moveT = new Types(enemyMove.type);
        float multiplier = 1;
        if (moveT.strength.indexOf(yourPoke.type) > 0) {
          multiplier = 2;
        } else if (moveT.weakness.indexOf(yourPoke.type) > 0) {
          multiplier = 0.5;
        }
        //enemyPoke.hp = enemyPoke.hp - 10;
        yourPoke.hp = yourPoke.hp -(int)(((((((2 * enemyPoke.lvl) / 5) * enemyPoke.sAtt * enemyMove.dmg)/ yourPoke.sDef)/50) * multiplier) / 3);
        isYourTurn = true;
      }
  }
}