class Menu {
  FWorld mundoMenu;
  FBody nombrePlato;
  Protagonista naranja, lechuga;
  PImage fondo, imgNaranja, imgLechuga;
  float naranja_x, lechuga_x, y;

  Menu(PImage fondo, PImage imgNaranja, PImage imgLechuga) {
    this.fondo = fondo;
    this.imgNaranja = imgNaranja;
    this.imgLechuga = imgLechuga;
    naranja_x = width/2 - 450;
    lechuga_x = width/2 + 450;
    y = height/2;
  }

  void ejecutar() {

    image(fondo, 0, 0);
    texto("Verdutti-Frutti", width/2, height/4, 90, fuente);
    texto("Elegí tu personaje moviendo el plato", width/2, height/2+height/5, 30, fuente);

    personaje(imgNaranja, naranja_x, y);
    personaje(imgLechuga, lechuga_x, y);
    
  }

  void reiniciar() {
    
  }
}
