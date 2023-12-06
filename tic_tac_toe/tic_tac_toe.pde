public class ticTacToe {
    Board gameBoard;

    public static void main(String[] args) {
        ticTacToe main = new ticTacToe();
        main.setup();
    }

    public void setup() {
      size(500,500);
        gameBoard = new Board();
        System.out.println("Welcome to Tic Tac Toe! You as the user will be playing circles");
