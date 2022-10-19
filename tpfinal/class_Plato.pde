class Plato {
  FCircle plato = new FCircle(100);

  Plato (String name, float x, float y, PImage img) {
    plato.setStatic(true);
    plato.setPosition(x, y);
    plato.setName(name);
    plato.attachImage(img);
  }
  
  void dibujar() {
    mundoJuego.add(plato);
  }
  void dibujarEnMenu() {
    mundoMenu.add(plato);
  }
  void reposicionar(float x, float y) {
    plato.setPosition(x, y);
  }
  void remover() {
    mundoJuego.remove(plato);
  }
  void grabbableTrue(){
    plato.setGrabbable(true);
  }
  void grabbableFalse(){
    plato.setGrabbable(false);
  }
}
