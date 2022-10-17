class PlatoMenu {
  FCircle platoMenu = new FCircle(100);

  PlatoMenu(String name, float x, float y, PImage img) {
    platoMenu.setStatic(true);
    platoMenu.setPosition(x, y);
    platoMenu.setGrabbable(true);
    platoMenu.setName(name);
    platoMenu.attachImage(img);
  }

  void posicionar(float x, float y) {
    platoMenu.setPosition(x, y);
  }

  void dibujar() {
    //mundoMenu.add(platos);
    mundoMenu.add(platoMenu);
  }
  void remover () {
    mundoMenu.remove(platoMenu);
  }
}
