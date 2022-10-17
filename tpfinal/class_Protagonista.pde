class Protagonista {
  FCircle protagonista = new FCircle(50);

  Protagonista(String name, PImage img) {
    protagonista.setStatic(false);

    protagonista.setStrokeWeight(5);
    protagonista.setRestitution(1);
    protagonista.setGrabbable(true);
    protagonista.setName(name);
    protagonista.attachImage(img);
  }

  void dibujar() {
    mundo.add(protagonista);
  }

  void remover () {
    mundo.remove(protagonista);
  }
  void removerEnMenu() {
    mundoMenu.remove(protagonista);
  }

  void posicionar(float x, float y) {
    protagonista.setPosition(x, y);
  }
}
