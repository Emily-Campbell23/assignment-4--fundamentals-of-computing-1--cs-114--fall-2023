 import java.util.Random;

int[] board = new int[9];
int currentPlayer = 1;
int userInput;
int randomNumber;
int userChoice;
boolean gameActive = true;

void keyPressed() {
  if (key >= '0' && key <= '8') {
    userChoice = key - '0';
    println("Space chosen: " + userChoice);

    if (board[userChoice] == 0) {
      board[userChoice] = currentPlayer;
      drawMove(userChoice / 3, userChoice % 3, width / 3);

      if (checkWin()) {
        if (currentPlayer == 1) {
          println("Computer wins!");
        } else {
          println("You win!");
        }
        println("Now exiting the game...");
        gameActive = false; // Stop further user input
      } else if (isBoardFull()) {
        println("It's a tie!");
        println("Now exiting the game...");
        gameActive = false; // Stop further user input
      } else {
        currentPlayer = 3 - currentPlayer;
        println("Game is still playing."); // Print here after user move
        computerRandom();
      }
    } else {
      println("Cell already chosen. Please choose a different one.");
    }
  } else {
    println("Invalid input. Please enter a number between 0 and 8.");
  }
}


void computerRandom() {
  if (!gameActive) {
    return; // Stop the computer's turn if the game is already stopped
  }

 Random rand = new Random();
  do {
   randomNumber = rand.nextInt(MAX - MIN + 1) + MIN;
  } while (board[randomNumber] != 0);

  int row = randomNumber / 3;
  int col = randomNumber % 3;

  println("The computer chose: " + randomNumber);
  board[randomNumber] = currentPlayer;
  drawMove(row, col, width / 3);

  if (checkWin()) {
    if (currentPlayer == 1) {
      println("Computer wins!");
    } else {
      println("You win!");
    }
    println("Now stopping the game.");
    gameActive = false; // Stop further user input
  } else if (isBoardFull()) {
    println("It's a tie!");
    println("Now stopping the game.");
    gameActive = false; // Stop further user input
  } else {
    currentPlayer = 3 - currentPlayer;
    println("Game is still continuing."); // Print here after computer move
  }
}

void drawMove(int row, int col, float cellSize) {
  float x = col * cellSize + cellSize / 2;
  float y = row * cellSize + cellSize / 2;

  if (currentPlayer == 1) {
    drawX(x, y, cellSize);
  } else {
    drawO(x, y, cellSize);
  }
}

void drawX(float x, float y, float size) {
  float halfSize = size / 2;
  line(x - halfSize, y - halfSize, x + halfSize, y + halfSize);
  line(x + halfSize, y - halfSize, x - halfSize, y + halfSize);
}

void drawO(float x, float y, float size) {
  ellipse(x, y, size, size);
}

boolean checkWin() {
  // Check rows, columns, and diagonals for a win
  for (int i = 0; i < 3; i++) {
    if (checkLine(i, 0, i, 2) || checkLine(0, i, 2, i)) {
      return true;
    }
  }

  if (checkLine(0, 0, 2, 2) || checkLine(0, 2, 2, 0)) {
    return true;
  }

  return false;
}

boolean checkLine(int x1, int y1, int x2, int y2) {
  int player = board[x1 * 3 + y1];
  return player != 0 && player == board[x2 * 3 + y2] && player == board[(x1 + x2) / 2 * 3 + (y1 + y2) / 2];
}

boolean isBoardFull() {
  for (int i = 0; i < board.length; i++) {
    if (board[i] == 0) {
      return false;
    }
  }
  return true;
}

