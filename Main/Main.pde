Player player;
Map map, boss;
int count = 0;
float speed = 15.0, wall = 60.0;
String state = "boss", nextState;
Battle battle;
Enemy e;
boolean showEnemy = true;

public void setup () {
  size(500, 500);
  background(0, 0, 0);

  player = new Player(width / 2, height / 2);
  map = new Map(player, false);
  boss = new Map(player, true);
  e = new Enemy(210, 210);
}

public void draw () {
  if (state == "start") {
    startScreen();
  }
  if (state == "controls") {
    controls();
  }
  if (state == "map") {
    map.draw();
  }
  if (state == "boss") {
    boss.draw();
  }
  if (state == "battle") {
    battle.draw();
  }
}

public void keyPressed () {

  if (state == "start" && keyCode == ENTER) {
    state = "controls";
  }
  if (state == "controls" && count >= 50 && keyCode == ENTER) {
    state = "map";
    count = 0;
  }
  // Movement
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
  // Battle
  if (state == "battle") {
    if ((battle.choice == "justAttacked" || battle.choice == "cantRun") && keyCode == ENTER) {
      battle.choice = battle.nextChoice;
    }
    if ((battle.choice == "win" || battle.choice == "run" || battle.choice == "lose") && keyCode == ENTER) {
      state = nextState;
    }
    if (!battle.choice.equals("none") && keyCode == BACKSPACE) {
      battle.choice = "none";
      battle.delay = 0;
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
        battle.run();
      }
    }
    if ((battle.choice == "justSwitched" || battle.choice == "healed") && keyCode == ENTER) {
      battle.choice = battle.nextChoice;
      battle.enemyTurn();
    }
    // Choices for the choices
    if (battle.delay > 40) {
      // Moves
      if (battle.choice.equals("fight")) {
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
      // Bag
      if (battle.choice.equals("bag")) {
        if (key == '1') {
          battle.potion();
        }
        if (key == '2') {
          battle.throwBall();
        }
      }
      // Pokemon
      if (battle.choice.equals("pokemon")) {
        if (key == '1') {
          battle.switchOut(0);
        }
        if (key == '2') {
          battle.switchOut(1);
        }
        if (key == '3') {
          battle.switchOut(2);
        }
        if (key == '4') {
          battle.switchOut(3);
        }
        if (key == '5') {
          battle.switchOut(4);
        }
        if (key == '6') {
          battle.switchOut(5);
        }
      }
    }
    // Cheats
    if (key == 'l') {
      battle.yourPoke.hp = 0;
    }
    if (key == 'w') {
      battle.enemyPoke.hp = 0;
    }
  }
}

public void walk (String direction) {
  switch (direction) {
  case "up" :
    float newY = player.yCor - (1 * speed);
    if (!(player.xCor > 335 && newY < 130)) {
      player.yCor = max(player.yCor - (1 * speed), wall);
    }
    break;
  case "down" :
    player.yCor = min(player.yCor + (1 * speed), height - wall);
    break;
  case "left" :
    player.xCor = max(player.xCor - (1 * speed), wall);
    break;
  case "right" : 
    float newX = player.xCor + (1 * speed);
    if (!(player.yCor < 130 && newX > 335)) {
      player.xCor = min(player.xCor + (1 * speed), width - wall);
    }
    break;
  default :
    break;
  }
  encounter();
}

private void encounter () {
  for (LongGrass g : map.grass) {
    g.steppedOn(player);
  }
}

private void startScreen () {
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(100);
  text("POKEMON", width / 2, 100);
  textSize(25);
  text("By Othman Bichouna", width / 2, 200);
  text("and Ahbab Ashraf", width / 2, 230);
  text("Press ENTER", width / 2, 450);
}

private void controls () {
  background(0, 0, 0);
  fill(255, 255, 255);
  textAlign(CENTER);
  textSize(75);
  text("CONTROLS", width / 2, 100);
  textSize(25);
  text("Use the arrow keys or WASD to move", width / 2, 200);
  text("Use ENTER to confirm or interact", width / 2, 230);
  text("Use BACKSPACE to cancel a choice", width / 2, 260);
  text("Press ENTER", width / 2, 450);
  count++;
}