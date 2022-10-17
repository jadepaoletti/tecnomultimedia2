class Plato {
  FCircle plato = new FCircle(100);

  Plato (String name, float x, float y, PImage img) {
    plato.setStatic(true);
    plato.setPosition(x, y);
    plato.setGrabbable(true);
    plato.setName(name);
    plato.attachImage(img);
  }

  void añadir() {
    mundoJuego.add(plato);
  }
  
}
