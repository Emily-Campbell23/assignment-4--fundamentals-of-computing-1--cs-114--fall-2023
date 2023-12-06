import java.util.Scanner;
public class board{
  private int inputNumber;
  public void playGame() {
    Scanner input = new Scanner(System.in);
    System.out.println("Please choose a number between 0 and 8: ");
    inputNumber = input.nextInt();
    if (inputNumber == 0) {
      circle();
    }
    input.close();
  }
}
