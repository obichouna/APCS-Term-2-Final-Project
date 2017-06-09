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
  public boolean isYourTurn = true, deathScreen = false, winScreen = false;
  public int maxHP, maxEHP;
  public String choice = "none";

  public Battle (Player p, Enemy e) {
    player = p;
    enemy = e;
    yourPoke = player.party.get(0);
    enemyPoke = enemy.party.pop();
    maxHP = yourPoke.maxHP;
    maxEHP = enemyPoke.maxHP;
    System.out.println(yourPoke.hp * (190.0 / maxHP));
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
    } else {
      top();
      if (choice == "fight") {
        moves();
      } else {
        bottom();
      }
      // Sprites
      imageMode(CENTER);
      image(enemyPoke.front, width / 4 * 3, 150, 200, 200);
      image(yourPoke.back, width / 4, 290, 200, 200);
    }
  }

  public void bottom () {
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
    // Base rectangles
    fill(0, 0, 0);
    rect(10, 30, 200, 50, 10);
    rect(width / 2 + 40, 310, 200, 70, 10);
    // Names
    fill(255, 255, 255);
    textAlign(LEFT);
    text(yourPoke.name, 295, 340);
    text(enemyPoke.name, 15, 60);
    // Health text
    textSize(20);
    text("" + yourPoke.hp + "/" + maxHP, 295, 375);
    // Health bar base
    rect(15, 65, 190, 10, 90);
    rect(width / 2 + 45, 345, 190, 10, 90);
    // Health bar top
    fill(0, 255, 0);
    rect(15, 65, enemyPoke.hp * (190.0 / maxEHP), 10, 90);
    rect(width / 2 + 45, 345, yourPoke.hp * (190.0 / maxHP), 10, 90);
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
    textSize(27);
    text(yourPoke.moves.get(0).name, 15, 430);
    text(yourPoke.moves.get(1).name, 15, 430);
    text(yourPoke.moves.get(2).name, 15, 430);
    text(yourPoke.moves.get(3).name, 15, 430);
  }

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