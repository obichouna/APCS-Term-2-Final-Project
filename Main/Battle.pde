public class Battle extends Scene {

  public Enemy enemy;
  public Pokemon yourPoke, enemyPoke;
  public boolean isTrainer, isYourTurn = true, deathScreen = false;
  public String choice = "none", nextChoice;
  public Move moveUsed;
  private int delay = 0, pSize;

  public Battle (Player p, Enemy e, boolean bool) {
    isTrainer = bool;
    player = p;
    enemy = e;
    int count = 0;
    pSize = player.party.size();
    while (player.party.get(count).hp == 0) {
      count++;
    }
    yourPoke = player.party.get(count);
    enemyPoke = enemy.party.pop();
    //if (enemyPoke.spd > yourPoke.spd) {
    //isYourTurn = false;
    //}
  }

  public void draw () {
    update();
    background(255, 255, 255);
    if (choice == "pokemon") {
      pokemon();
      delay++;
    } else {
      top();
      if (choice == "fight") {
        moves();
        delay++;
      } else if (choice == "win") {
        if (isTrainer) {
          event("You defeated Red", "map", true);
        } else {
          event("The wild " + enemyPoke.name + " fainted", "map", true);
        }
      } else if (choice == "lose") {
        event("You blacked out", "map", true);
      } else if (choice == "cantRun") {
        event("Can't run from a trainer battle", "none", false);
      } else if (choice == "cantThrow") {
        event("Can't catch a trainer's pokemon", "none", false);
      } else if (choice == "badThrow") {
        event("Failed to catch " + enemyPoke.name, "none", false);
      } else  if (choice == "goodThrow") {
        event("Caught the wild " + enemyPoke.name, "map", true);
      } else if (choice == "run") {
        event("Successfully got away", "map", true);
      } else if (choice == "justAttacked") {
        if (isYourTurn) {
          event(enemyPoke.name + " used " + moveUsed.name, "none", false);
        } else {
          event(yourPoke.name + " used " + moveUsed.name, "none", false);
        }
      } else if (choice == "justSwitched") {
        event("Go " + yourPoke.name + "!", "none", false);
      } else if (choice == "bag") {
        delay++;
        bag();
      } else if (choice == "healed") {
        event ("You healed " + yourPoke.name, "none", false);
      } else if (choice == "threwBall") {
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

  public void bag () {
    // Base rectangle
    fill(0, 0, 0);
    rect(0, 390, width, 110);
    // White rectangles
    fill(255, 255, 255);
    rect(7, 400, width / 2 - 10, 90, 10);
    rect(width / 2 + 7, 400, width / 2 - 15, 90, 10);
    fill(0, 0, 0);
    textSize(40);
    textAlign(CENTER);
    text("Potion", width / 4, 455);
    text("Pokeball", 3 * width / 4, 455);
  }

  public void switchOut (int num) {
    if (num < player.party.size()) {
      Pokemon newPoke = player.party.get(num);
      yourPoke = newPoke;
      choice = "justSwitched";
      delay = 0;
    }
  }

  public void potion () {
    yourPoke.hp = min(yourPoke.hp += 20, yourPoke.maxHP);
    choice = "healed";
  }

  public void throwBall () {
    if (isTrainer) {
      choice = "cantThrow";
    } else {
      if (floor(random(1)) == 0) {
        if (pSize < 6) {
          player.party.add(enemyPoke);
        }
        choice = "goodThrow";
      } else {
        choice = "badThrow";
      }
    }
  }

  public void run () {
    if (isTrainer) {
      choice = "cantRun";
    } else {
      choice = "run";
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

  public void event (String str, String newState, boolean leavesBattle) {
    textScreen(str.replace("_", " "));
    if (leavesBattle) {
      nextState = newState;
    } else {
      nextChoice = newState;
    }
  }


  public void update () {
    if (yourPoke.hp <= 0) {
      if (pSize == 1) {
        choice = "lose";
      } else {
        pSize--;
        choice = "pokemon";
      }
    }
    if (enemyPoke.hp <= 0) {
      if (enemy.party.size() > 0) {
        enemyPoke = enemy.party.pop();
        //choice = "eFainted";
      } else {
      choice = "win";
      }
    }
    if (!isYourTurn && choice == "none") {
      enemyTurn();
    }
  }

  public void yourTurn () {
    delay = 0;
    Random r = new Random();
    Types moveT = new Types(moveUsed.type);
    float multiplier = 1;
    if (moveT.strength.indexOf(enemyPoke.type) > 0) {
      multiplier = 2;
    } else if (moveT.weakness.indexOf(enemyPoke.type) > 0) {
      multiplier = 0.5;
    }
    if (choice.equals("fight")) {
      if (moveUsed.phys) {
        enemyPoke.hp = max(0, enemyPoke.hp -(int)((((((((2 * yourPoke.lvl) / 5) * yourPoke.att * moveUsed.dmg)/ enemyPoke.def)/50) * multiplier) / 3) + r.nextInt(4)));
      } else {
        enemyPoke.hp = max(0, enemyPoke.hp -(int)((((((((2 * yourPoke.lvl) / 5) * yourPoke.sAtt * moveUsed.dmg)/ enemyPoke.sDef)/50) * multiplier) / 3) + r.nextInt(4)));
      }
      isYourTurn = false;
      choice = "justAttacked";
    }
  }

  public void enemyTurn () {
    Random r = new Random();
    moveUsed = enemyPoke.moves.get(r.nextInt(4));
    Types moveT = new Types(moveUsed.type);
    float multiplier = 1;
    if (moveT.strength.indexOf(yourPoke.type) > 0) {
      multiplier = 2;
    } else if (moveT.weakness.indexOf(yourPoke.type) > 0) {
      multiplier = 0.5;
    }
    if (moveUsed.phys) {

      yourPoke.hp = max(0, yourPoke.hp -(int)((((((((2 * enemyPoke.lvl) / 5) * enemyPoke.att * moveUsed.dmg)/ yourPoke.def)/50) * multiplier) / 3) + r.nextInt(4)));
    } else {
      yourPoke.hp = max(0, yourPoke.hp -(int)((((((((2 * enemyPoke.lvl) / 5) * enemyPoke.sAtt * moveUsed.dmg)/ yourPoke.sDef)/50) * multiplier) / 3) + r.nextInt(4)));
    }
    isYourTurn = true;
    choice = "justAttacked";
  }
}