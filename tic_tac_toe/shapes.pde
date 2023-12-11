 void drawMove(int row, int col, int size) {
  float x = col * size + size / 2;
  float y = row * size + size / 2;

  if (board[row * 3 + col] == 1) {
    // Draws an 'X' for computer
    drawX(x, y, size);
  } else {
    // Draws an 'O' for user
    drawO(x, y, size);
  }
}

void circle(float x, float y, float diameter) {
  ellipse(x, y, diameter, diameter);
}

void cross(float x, float y, float size) {
  line(x, y, x + size, y + size);
  line(x, y + size, x + size, y);
}

void gameBoard() {
  line(0, height / 3, width, height / 3); // horizontal
  line(0, (height / 3) * 2, width, (height / 3) * 2); // horizontal
  line(width / 3, 0, width / 3, height); // vertical
  line((width / 3) * 2, 0, (width / 3) * 2, height); // vertical
}
