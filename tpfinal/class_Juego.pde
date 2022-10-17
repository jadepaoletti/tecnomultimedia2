class Juego {

  Protagonista naranja, lechuga;
  Antagonista pincho1, pincho2, pincho3;
  Plato plato1, plato2, plato3;

  PImage imgParticula, imgPersonaje, imgVictoria, imgDerrota1, imgDerrota2 ;

  Juego (Protagonista protagonista, PImage imgParticula, PImage imgVictoria, PImage imgDerrota1, PImage imgDerrota2) {
    naranja = protagonista;
    lechuga = protagonista;
    this.imgParticula = imgParticula;
    this.imgVictoria = imgVictoria;
    this.imgDerrota1 = imgDerrota1;
    this.imgDerrota2 = imgDerrota2;
    
    mundoJuego.setEdges();
    
  }

  void empezar() {
    mundoJuego.draw();
    image(imgGeneral[0], 0, 0);
  }

  void reiniciar() {
  }
  void victoria() {
  }
  void derrota1() {
  }
  void derrota2() {
  }
}
