void texto(String texto, float x, float y, int tam, PFont fuente) {
  push();
  fill(0);
  textFont(fuente);
  textSize(tam);
  textAlign(CENTER, CENTER);
  text(texto, x, y);
  pop();
}
void personaje (PImage img, float x, float y) {
  push();
  imageMode(CENTER);
  image(img, x, y);
  pop();
}

String conseguirNombre(FBody cuerpo) {
  String nombre = "nada";

  if (cuerpo != null ) {
    nombre = cuerpo.getName();
  }
  if (nombre == null) {
    nombre = "nada";
  }

  return nombre;
}

void vidas(PImage img, int x, int y, int tamImg, PFont fuente, int tamFuente) {
  push();

  imageMode(CENTER);
  image(img, x, y, tamImg, tamImg);
  textFont(fuente, tamFuente);
  textAlign(CENTER, CENTER);
  fill(0);
  text(vidas, x+tamImg, y);

  pop();
}

//void timer1 () {
//  push();
//    ms1 = ms1+1;
//  pop();
//}

//void timer2 () {
//  push();
//  if (ms<=59) {
//    ms = ms+1;
//  } else {
//    s = s + 1;
//    ms = 0;
//  }
//  pop();
//}
