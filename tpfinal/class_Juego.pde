class Juego {

  Protagonista pelota;
  Antagonista pincho1, pincho2, pincho3;
  Plato plato1, plato2, plato3;
  Canasta canastaFruta, canastaVerdura;

  int maxVidas = 3;
  int vidas = maxVidas;

  float plato1_x, plato1_y;
  float plato2_x, plato2_y;
  float plato3_x, plato3_y;
  int yCanastas = 900;

  boolean iniciado = false;
  PImage imgProtagonista, imgPersonaje, imgVictoria, imgDerrota1, imgDerrota2, imgParticula;

  Juego (PImage imgProtagonista, PImage imgVictoria, PImage imgDerrota1, PImage imgDerrota2, PImage imgParticula) {

    this.imgProtagonista = imgProtagonista;
    this.imgVictoria = imgVictoria;
    this.imgDerrota1 = imgDerrota1;
    this.imgDerrota2 = imgDerrota2;
    this.imgParticula = imgParticula;

    plato1_x = width/2;
    plato1_y = 900;
    plato2_x = width/2 + width/6;
    plato2_y = 900;
    plato3_x = width/2 - width/6;
    plato3_y = 900;

    mundoJuego.setEdges();

    pelota = new Protagonista ("Pelota", imgProtagonista, imgParticula, random(400, 1100), 100);
    pincho1 = new Antagonista ("pincho", imgPinchos[0], random (100, 500), 300);
    pincho2 = new Antagonista ("pincho", imgPinchos[1], random (500, 900), 450);
    pincho3 = new Antagonista ("pincho", imgPinchos[2], random (900, 1400), 600);
    plato1 = new Plato("Plato 1", plato1_x, plato1_y, imgGeneral[2]);
    plato2 = new Plato("Plato 2", plato2_x, plato2_y, imgGeneral[2]);
    plato3 = new Plato("Plato 3", plato3_x, plato3_y, imgGeneral[2]);
    canastaVerdura = new Canasta("canastaVerdura", width/2 + width/3, yCanastas, imgGeneral[3]);
    canastaFruta = new Canasta("canastaFruta", width/2 - width/3, yCanastas, imgGeneral[4]);
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
  void dibujar() { //-----------------------------------------------------------------------------> Juego
    image(imgGeneral[0], 0, 0);
    vidas(imgGeneral[1], width/10, height/10, 45, fuente, 50);
    mundoJuego.draw();
  }
  void inicializar() { //-------------------------------------------------------------------------> Dibujar Objetos
    if (!iniciado) {
      pelota.dibujar();
      pincho1.dibujar();
      pincho2.dibujar();
      pincho3.dibujar();
      plato1.dibujar();
      plato2.dibujar();
      plato3.dibujar();
      canastaFruta.dibujar();
      canastaVerdura.dibujar();
      iniciado = true;
    }
  }
  void empezar() { //-----------------------------------------------------------------------------> Juego Step
    mundoJuego.step();
  }
  void reiniciar() { //---------------------------------------------------------------------------> Reiniciar Juego
    vidas = maxVidas;
    pelota.remover();
    pelota.dibujar();
    pelota.reposicionar(random(400, 1100), 100);
    plato1.remover();
    plato1.dibujar();
    plato1.reposicionar(plato1_x, plato1_y);
    plato2.remover();
    plato2.dibujar();
    plato2.reposicionar(plato2_x, plato2_y);
    plato3.remover();
    plato3.dibujar();
    plato3.reposicionar(plato3_x, plato3_y);
  }
  void victoria() {
    image(imgVictoria, 0, 0 );
    texto("¡Ganaste!", width/4, height/5, 100, fuente);
    texto("Presiona M para volver al menú", width/4, height/2+height/4, 30, fuente);
  }
  void derrota1() {
    image(imgDerrota1, 0, 0 );
    texto("Perdiste...", width/4, height/5, 100, fuente);
    texto("Presiona M para volver al menú", width/2, height/2+height/3, 30, fuente);
  }
  void derrota2() {
    image(imgDerrota2, 0, 0 );
    texto("Perdiste...", width/4, height/5, 100, fuente);
    texto("Presiona M para volver al menú", width/2, height/2+height/3, 30, fuente);
  }
  void dividirPelota() {
    pelota.dividir();
  }
}
