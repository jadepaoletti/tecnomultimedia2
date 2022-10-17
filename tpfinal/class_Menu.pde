class Menu {

  FBody nombrePlato;
  Protagonista naranja, lechuga;
  Plato plato;
  int plato_x, plato_y;

  PImage fondo, imgNaranja, imgLechuga, imgParticulas;
  float naranja_x, lechuga_x, y;

  Menu(PImage fondo, PImage imgNaranja, PImage imgLechuga) {
    this.fondo = fondo;
    this.imgNaranja = imgNaranja;
    this.imgLechuga = imgLechuga;
    naranja_x = width/2 - 450;
    lechuga_x = width/2 + 450;
    y = height/2;

    plato_x = width/2;
    plato_y = height/2;

    plato = new Plato("Plato Menu", plato_x, plato_y, imgGeneral[2]);
    naranja = new Protagonista("Naranja", imgNaranja, imgParticulas, naranja_x, y);
    lechuga = new Protagonista("Lechuga", imgNaranja, imgParticulas, naranja_x, y);
    
    plato.dibujarEnMenu();
    
    naranja.dibujarEnMenu(imgNaranja, naranja_x, y);
    lechuga.dibujarEnMenu(imgLechuga, lechuga_x, y);
  }

  void ejecutar() {
    image(fondo, 0, 0);
    mundoMenu.draw();
    texto("Verdutti-Frutti", width/2, height/4, 90, fuente);
    texto("Elegí tu personaje moviendo el plato", width/2, height/2+height/5, 30, fuente);
  }

  void reiniciar() {
    plato_x = width/2;
    plato_y = height/2;
    plato.reposicionar(plato_x, plato_y);
  }

 void ActivarNaranja(){
   juegoActivo = juegoNaranja;
   juegoActivo.inicializar();
 }
 
 void ActivarLechuga(){
   juegoActivo = juegoLechuga;
   juegoActivo.inicializar();
 }
}
