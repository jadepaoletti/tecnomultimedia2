/*
 Alumnos: Olavarría Santiago | Paoletti Jade | Piga Gamaliel.
 Comisión: Prof. Lisandro.
 Link video:
*/

Fondo fondo;
Figura figura;

void setup() {
  size(1000, 800);
  fondo = new Fondo();
}

void draw() {
  background(40);
  fondo.dibujar();
  //figura.dibujar();
}
