// =============================================================
// Alumnos: Olavarría Santiago | Paoletti Jade | Piga Gamaliel.
// Comisión: Prof. Lisandro.
// Link video:
// =============================================================

import oscP5.*;

// Objetos ---------------------------------------------------->
OscP5 osc;
GestorSenial gestorAmp, gestorPitch;
Fondo fondo;
Figura figura;

// Variables de calibración ----------------------------------->
float minAmp = 50;  // Elimina el ruido de fondo.
float maxAmp = 70; // Sonidos más fuertes.

float minPitch = 65; // Sonidos graves
float maxPitch = 85; // Sonidos agudos

float amort = 0.7; // Factor de amortiguación.
boolean verGestores = false;

// Valores por defecto (NO tocar) ----------------------------->
float amp = 0.0;  // Volumen (Altos - bajos)
float pitch = 0.0;// Altura  (Graves - agudos)

PGraphics grafico1; // Figura

void setup() {
  size(1000, 800);
  gestorAmp = new GestorSenial(minAmp, maxAmp, amort);
  gestorPitch = new GestorSenial(minPitch, maxPitch, amort);
  osc = new OscP5(this, 12345);
  grafico1 = createGraphics( 1000, 800 );

  fondo = new Fondo();
  figura = new Figura();
}

void draw() {
  gestorAmp.actualizar(amp);
  gestorPitch.actualizar(pitch);

  // Partes de la obra ---------------------------------------->

  fondo.dibujar(amp - 25);

  grafico1.beginDraw();
  figura.dibujar(pitch);
  image(grafico1, 0, 0);
  grafico1.endDraw();

  // Gestores --------------------------------------------------->
  if (verGestores) {
    gestorAmp.imprimir(0, 0);
    gestorPitch.imprimir(0, 100);
  }
}

void oscEvent(OscMessage m) {
  if (m.addrPattern().equals("/amp")) {
    amp = m.get(0).floatValue();
    println("amp: "+ amp);
  }
  if (m.addrPattern().equals("/pitch")) {
    pitch = m.get(0).floatValue();
    println("pitch:"+ pitch);
  }
}
