Player player;
float speed = 15;
String state = "battle";
Battle battle;
Enemy e;
boolean showEnemy = true;

public void setup () {
  size(500, 500);
  background(0, 0, 0);
  player = new Player(width / 2, height / 2);
  battle = new Battle(player, new Enemy(0, 0), false);
  //battle.choice = "fight";
  e = new Enemy(210, 210);
}

public void draw () {
  if (state == "map") {
    background(0, 255, 0);
    player.draw();
    if (showEnemy) {
      e.draw();
      e.fight(player);
    }
  }
  if (state == "battle") {
    battle.draw();
  }
}

public void keyPressed () {

  // Movement
  if (state == "map") {
    if (key == 'w') {
      walk(0, -1 * speed);
    }
    if (key == 'a') {
      walk(-1 * speed, 0);
    }
    if (key == 's') {
      walk(0, speed);
    }
    if (key == 'd') {
      walk(speed, 0);
    }
  }

  if (state == "battle") {
    if (!battle.choice.equals("none") && key == 'b') {
      battle.choice = "none";
    }
    // Main battle screen
    if (battle.choice.equals("none")) {
      if (key == '1') {
        battle.choice = "fight";
      }
      if (key == '2') {
        battle.choice = "bag";
      }
      if (key == '3') {
        battle.choice = "pokemon";
      }
      if (key == '4') {
        battle.choice = "run";
      }
    }
    // Fight screen
    if (battle.choice.equals("fight")) {
      if (key == '1') {
        battle.choice = "fight";
      }
      if (key == '2') {
        battle.choice = "bag";
      }
      if (key == '3') {
        battle.choice = "pokemon";
      }
      if (key == '4') {
        battle.choice = "run";
      }
    }
    if (key == 'l') {
      battle.yourPoke.hp--;
    }
    if (key == 'w') {
      battle.enemyPoke.hp--;
    }
    if (key == ENTER && battle.winScreen) {
      battle = null;
      state = "map";
    }
  }
}

public void walk (float deltaX, float deltaY) {
  player.xCor += deltaX;
  player.yCor += deltaY;
  encounter();
}

// For demo purposes
public void encounter () {
  int rand = floor(random(40));
  if (rand == 13) {
    battle = new Battle(player, new Enemy(0, 0), false);
    state = "battle";
  }
}

/*
void keyReleased() {
 if (key == 'w') {
 player.direction =
 }
 if (key == 'a') {
 player.direction =
 }
 if (key == 's') {
 player.direction =
 }
 if (key == 'd') {
 player.direction =
 }
 }
 */