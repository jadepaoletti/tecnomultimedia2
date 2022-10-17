class Antagonista {

  FBox pinchos = new FBox(100, 100);
  PImage img;
  float x, y;

  Antagonista(String name, PImage img, float x, float y) {
    this.img = img;
    this.x = x;
    this.y = y;

    pinchos.setStatic(true);
    pinchos.setPosition(x, y);
    if (x < 1000) {
      x= x+1;
    } else if (x>1000) {
      x= x-1;
    }
    pinchos.setGrabbable(false);
    pinchos.setName(name);
    pinchos.attachImage(img);
  }

  void dibujar() {
    mundoJuego.add(pinchos);
    
  }
}
