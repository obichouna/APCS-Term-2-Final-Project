Player player;
Map map;
float speed = 15;
String state = "map";
Battle battle;
Enemy e;
boolean showEnemy = true;

public void setup () {
  size(500, 500);
  background(0, 0, 0);

  player = new Player(width / 2, height / 2);
  map = new Map(player);
  //battle = new Battle(player, new Enemy(0, 0), false);
  //battle.choice = "pokemon";
  e = new Enemy(210, 210);
}

public void draw () {
  if (state == "map") {
    //background(0, 255, 0);
    //player.draw();
    map.draw();
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
    if (key == 'w' || keyCode == UP) {
      walk("up");
    }
    if (key == 'a' || keyCode == LEFT) {
      walk("left");
    }
    if (key == 's' || keyCode == DOWN) {
      walk("down");
    }
    if (key == 'd' || keyCode == RIGHT) {
      walk("right");
    }
  }

  if (state == "battle") {
    if (!battle.choice.equals("none") && key == 'z') {
      battle.choice = "none";
      battle.delay = 0;
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
    if (battle.choice.equals("fight") && battle.isYourTurn && battle.delay > 40) {
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
    //bag screen
    /*
      if (battle.choice.equals("bag") && battle.delay > 40){
     if (key == '1') {
     player.party.add(battle.enemyPoke);
     battle = null;
     state = "map"; 
     }
     }
     */

    // Pokemon choice screen
    if (battle.choice.equals("pokemon") && battle.delay > 40) {
      if (key == '1') {
        battle.switchOut(1);
        battle.enemyTurn();
      }
      if (key == '2') {
        battle.switchOut(2);
        battle.enemyTurn();
      }
      if (key == '3') {
        battle.switchOut(3);
        battle.enemyTurn();
      }
      if (key == '4') {
        battle.switchOut(4);
        battle.enemyTurn();
      }
      if (key == '5') {
        battle.switchOut(5);
        battle.enemyTurn();
      }
      if (key == '6') {
        battle.switchOut(6);
        battle.enemyTurn();
      }
    }

    if (key == 'l') {
      battle.yourPoke.hp = 0;
    }
    if (key == 'w') {
      battle.enemyPoke.hp = 0;
    }
    if (key == 'x' && battle.winScreen) {
      battle = null;
      state = "map";
    }
  }
}

public void walk (String direction) {
  float cons = 60.0;
  switch (direction) {
  case "up" :
    float newY = player.yCor - (1 * speed);
    if (!(player.xCor > 335 && newY < 130 && state == "map")) {
      player.yCor = max(player.yCor - (1 * speed), cons);
    }
    break;
  case "down" :
    player.yCor = min(player.yCor + (1 * speed), height - cons);
    break;
  case "left" :
    player.xCor = max(player.xCor - (1 * speed), cons);
    break;
  case "right" : 
    float newX = player.xCor + (1 * speed);
    if (!(player.yCor < 130 && newX > 335) && state == "map") {
      player.xCor = min(player.xCor + (1 * speed), width - cons);
    }
    break;
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