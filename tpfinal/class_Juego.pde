class Juego {

  Protagonista naranja, lechuga;
  Antagonista a1, a2, a3, a4;
  Menu menu;

  PImage imgParticula, imgPersonaje, imgVictoria, imgDerrota1, imgDerrota2 ;

  Juego (Protagonista protagonista, PImage imgParticula, PImage imgVictoria, PImage imgDerrota1, PImage imgDerrota2) {
    naranja = protagonista;
    lechuga = protagonista;
    this.imgParticula = imgParticula;
    this.imgVictoria = imgVictoria;
    this.imgDerrota1 = imgDerrota1;
    this.imgDerrota2 = imgDerrota2;
  }
  
  void empezar() {
    mundo.draw();
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
