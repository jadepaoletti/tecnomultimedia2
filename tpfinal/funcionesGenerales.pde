//void dividirCirculo(FCircle circulo, PImage img) {

//  float d = circulo.getSize()/4;
//  float x = circulo.getX();
//  float y = circulo.getY();
//  mundoJuego.remove(circulo);

//  for (int i = 0; i < 6; i++) {
//    FCircle hijo = new FCircle(d);
//    hijo.setPosition(x + random (-d, d), y+ random (-d, d));
//    hijo.setFill(200, 100, 0);
//    hijo.setNoStroke();
//    hijo.attachImage(img);
//    mundoJuego.add(hijo);
//  }
//}

void timer1() {
  push();
    ms1 = ms1+1;
  pop();
}

void timer2() {
  push();
  if (ms2<=59) {
    ms2 = ms2+1;
  } else {
    s2 = s2 + 1;
    ms2 = 0;
  }
  pop();
}
