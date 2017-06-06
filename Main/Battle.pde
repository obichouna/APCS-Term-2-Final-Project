public class Battle {

  public Player player;
  public Enemy enemy;
  public Pokemon yourPoke, enemyPoke;
  public boolean isYourTurn = true;
  public int maxHP, maxEHP;

  public Battle (Player p, Enemy e) {
    player = p;
    enemy = e;
    yourPoke = player.party.get(0);
    enemyPoke = enemy.party.pop();
    maxHP = yourPoke.hp;
    maxEHP = enemyPoke.hp;
    System.out.println(maxHP + " " + maxEHP);
  }

  public void draw () {
    background(255, 255, 255);
    top();
    bottom();
  }

  public void bottom () {
    fill(0, 0, 0);
    rect(0, 390, width, 110);
    fill(255, 255, 255);
    rect(7, 400, width / 2 - 10, 90, 10);
    rect(width / 2 + 7, 400, width / 2 - 15, 90, 10);
    fill(0, 0, 0);
    textSize(27);
    text("FIGHT", width / 2 + 20, 430);
    text("BAG", width - 75, 430);
    text("POKEMON", width / 2 + 20, 470);
    text("RUN", width - 75, 470);
    text("What will", 20, 430);
    text(yourPoke.name + " do?", 20, 470);
  }

  public void top () {
    fill(0, 0, 0);
    rect(10, 30, 200, 50, 10);
    rect(width / 2 + 40, 310, 200, 70, 10);
    fill(255, 255, 255);
    text("" + yourPoke.hp + "/" + maxHP, 250, 250);
    rect(15, 65, 190, 10, 90);
    rect(width / 2 + 45, 345, 190, 10, 90);
    fill(0, 255, 0);
    //rect(15, 65, enemyPoke.hp * (190 / maxEHP), 10, 90);
    //rect(width / 2 + 45, 345, yourPoke.hp * (190 / maxHP), 10, 90);
  }

  public void yourTurn () {
  }

  public void enemyTurn () {
  }
}