public abstract class Scene {

  public Player player;

  public abstract void draw ();
}

public class Map extends Scene {

  // Add enemies, roads, buildings, trees, etc

  public void draw () {
    background(0, 255, 0);
  }
}

public class Battle extends Scene {

  public Enemy enemy;
  public Pokemon yourPoke, enemyPoke;
  public boolean isTrainer, isYourTurn = true, deathScreen = false, winScreen = false;
  public String choice = "none";
  private int delay = 0;

  public Battle (Player p, Enemy e, boolean bool) {
    isTrainer = bool;
    player = p;
    enemy = e;
    yourPoke = player.party.get(0);
    enemyPoke = enemy.party.pop();
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
    } else {
      top();
      if (choice == "fight") {
        moves();
      } else if (choice == "run") {
        run();
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
      } else {
        bottom();
      }
      // Sprites
      imageMode(CENTER);
      image(enemyPoke.front, width / 4 * 3, 150, 200, 200);
      image(yourPoke.back, width / 4, 297, 240, 240);
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
      {width / 4, 80}, 
      {3 * width / 4, 80}, 
      {width / 4, height / 2}, 
      {3 * width / 4, height / 2}, 
      {width / 4, 420}, 
      {3 * width / 4, 420}, 
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
    fill(0, 0, 0);
    rectMode(CENTER);
    rect(x, y, 210, 130, 10);
    if (filled) {
      imageMode(CENTER);
      image(poke.front, x - 63, y - 20, 75, 75);
      fill(255, 255, 255);
      textSize(25);
      text(poke.name, x - 20, y - 10);
      textSize(20);
      text("" + poke.hp + "/" + poke.maxHP, x - 100, y + 57);
      rect(x, y + 30, 200, 10, 90);
      fill(0, 255, 0);
      rect(x, y + 30, poke.hp * (200.0 / poke.maxHP), 10, 90);
      //rect(x + 5, y + 10, 50, 50, 10);
    }
  }

  public void textScreen (String str) {
    textAlign(CENTER);
    textSize(30);
    text(str, width /2, 455);
  }

  public void run () {
    fill(0, 0, 0);
    rect(0, 390, width, 110);
    fill(255, 255, 255);
    rect(7, 400, width - 14, 90, 10);
    fill(0, 0, 0);
    if (isTrainer) {
      textScreen("Can't run from a trainer battle");
    } else {
      textScreen("Successfully ran away");
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
  }

  public void enemyTurn () {
  }
}