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
  battle.choice = "pokemon";
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
      walk("up");
    }
    if (key == 'a') {
      walk("left");
    }
    if (key == 's') {
      walk("down");
    }
    if (key == 'd') {
      walk("right");
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
        //battle.choice = "bag";
      }
      if (key == '3') {
        battle.choice = "pokemon";
      }
      if (key == '4') {
        battle.choice = "run";
      }
    }
    // Fight screen
    if (battle.choice.equals("fight") && battle.isYourTurn) {
      if (key == '1') {
        battle.moveUsed = battle.yourPoke.moves.get(0);
        battle.yourTurn();
      }
      if (key == '2') {
        battle.moveUsed = battle.yourPoke.moves.get(1);
        battle.yourTurn();
      }
      if (key == '3') {
        battle.moveUsed = battle.yourPoke.moves.get(2);
        battle.yourTurn();
      }
      if (key == '4') {
        battle.moveUsed = battle.yourPoke.moves.get(3);
        battle.yourTurn();
      }
    }
    // Pokemon choice screen
    if (battle.choice.equals("pokemon") && battle.delay > 50) {
      if (key == '1') {
        battle.switchOut(1);
      }
      if (key == '2') {
        battle.switchOut(2);
      }
      if (key == '3') {
        battle.switchOut(3);
      }
      if (key == '4') {
        battle.switchOut(4);
      }
      if (key == '5') {
        battle.switchOut(5);
      }
      if (key == '6') {
        battle.switchOut(6);
      }
    }
    
    if (key == 'l') {
      battle.yourPoke.hp -= 10;
    }
    if (key == 'w') {
      battle.enemyPoke.hp -= 10;
    }
    if (key == ENTER && battle.winScreen) {
      battle = null;
      state = "map";
    }
  }
}

public void walk (String direction) {
  float cons = 11.0;
  switch (direction) {
  case "up" :
    player.yCor = max(player.yCor - (1 * speed), cons);
    break;
  case "down" :
    player.yCor = min(player.yCor + (1 * speed), height - cons);
    break;
  case "left" :
    player.xCor = max(player.xCor - (1 * speed), cons);
    break;
  case "right" : 
    player.xCor = min(player.xCor + (1 * speed), width - cons);
  default :
    break;
  }
  //encounter();
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