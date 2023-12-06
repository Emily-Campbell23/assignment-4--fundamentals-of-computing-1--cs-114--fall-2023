void circle(){
  ellipse(82, 82, 166, 166);
}

void cross(){
  line(0, 0, 166, 166);
  line(166, 0, 0, 166);
}

void gameBoard(){
  line(0, 166, 500, 166); // horizontal
  line(0, 332, 500, 332); // horizontal
  line(166, 0, 166, 500); // vertical
  line(332, 0, 332, 500); // vertical
}
