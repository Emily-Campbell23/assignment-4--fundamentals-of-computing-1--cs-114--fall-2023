void setup() {
  size(500, 500);
  println("Welcome to Tic Tac Toe! You will be playing circles");
  computerRandom();
  println("Please choose a number between 0 - 8: ");
}
void draw() {
  gameBoard();
}

