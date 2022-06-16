class ManchasFondo {
  Fondo fondo;

  float x, y;
  float tam;
  color colorM;
  int frame;
  PImage imgManchas;

  ManchasFondo(Fondo fondo, PImage imgManchas, float x, float y, float tam) {
    this.fondo = fondo;
    this.imgManchas = imgManchas;
    this.x = x;
    this.y = y;
    this.tam = tam;
  }

  void dibujar() {
    push();
    imageMode(CENTER);
    image(imgManchas, x, y, tam, tam);
    pop();
  }

  void mover(float velocidad) {
    this.x = this.x + velocidad;
  }
}
