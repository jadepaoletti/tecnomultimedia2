/*
 ======= VERDUTTI-FRUTTI =======
 Alumnos:
 - Moreira, Abril
 - Paoletti, Jade
 - Piga, Gamaliel
 Materia:
 - Tecnología Multimedial 2
 Comisión:
 - Prof. Lisandro Peralta
 ===============================
 */

import fisica.*;
import ddf.minim.*;

FWorld mundoMenu;
FWorld mundoJuego;

Menu menu;
Juego juegoNaranja, juegoLechuga;
Protagonista naranja, lechuga;
Antagonista pincho1, pincho2, pincho3;


int pantalla = 1;
int vidas = 3;
int bordeLimite = 100;

float prota_x, prota_y;
float plato_x, plato_y;

PFont fuente;
PImage [] imgGeneral;
int cantImgGeneral = 3;
PImage [] imgNaranja;
int cantImgNaranja = 5;
PImage [] imgLechuga;
int cantImgLechuga = 5;
PImage [] imgPinchos;
int cantImgPinchos = 3;

boolean juegaNaranja = true, juegaLechuga;

void setup () {
  size(1500, 1000);

  prota_x = random(bordeLimite, width-bordeLimite);
  prota_y = bordeLimite;

  fuente = createFont("fuente.ttf", 30);

  imgGeneral = new PImage [cantImgGeneral];
  for (int i = 0; i< cantImgGeneral; i++) {
    imgGeneral[i] = loadImage("imagen"+i+".png");
  }
  imgNaranja = new PImage[cantImgNaranja];
  for (int i = 0; i < cantImgNaranja; i++) {
    imgNaranja[i] = loadImage("naranja"+i+".png");
  }
  imgLechuga = new PImage[cantImgLechuga];
  for (int i = 0; i < cantImgLechuga; i++) {
    imgLechuga[i] = loadImage("lechuga"+i+".png");
  }
  imgPinchos = new PImage[cantImgPinchos];
  for (int i = 0; i < cantImgPinchos; i++) {
    imgPinchos[i] = loadImage("pincho"+i+".png");
  }

  //--------------------------------------------------------------------------------------- CLASES

  Fisica.init(this);

  mundoJuego = new FWorld();
  mundoMenu = new FWorld();

  menu = new Menu(imgGeneral[0], imgNaranja[0], imgLechuga[0]);

  juegoNaranja = new Juego (naranja, imgNaranja[4], imgNaranja[1], imgNaranja[2], imgNaranja[3]);
  juegoLechuga = new Juego (lechuga, imgLechuga[4], imgLechuga[1], imgLechuga[2], imgLechuga[3]);

  naranja = new Protagonista ("Naranja", imgNaranja[0]);
  lechuga = new Protagonista ("Lechuga", imgLechuga[0]);

  pincho1 = new Antagonista ("Pincho 1", imgPinchos[0], random (50, 400), random(250, 850));
  pincho2 = new Antagonista ("Pincho 2", imgPinchos[1], random (450, 700), random(250, 850));
  pincho3 = new Antagonista ("Pincho 3", imgPinchos[2], random (750, 1000), random(250, 850));

  pincho1.dibujar();
}

void draw() {

  if (pantalla == 0) { //-------------------------------------------> MENU
    menu.ejecutar();
  } else if (pantalla == 1) { //------------------------------------> JUEGO
    menu.reiniciar();
    if (juegaNaranja == true) {
      juegoNaranja.empezar();
    } else if (juegaLechuga == true) {
      juegoLechuga.empezar();
    }
  } else if (pantalla == 2) { //------------------------------------> VICTORIA

    if (juegaNaranja == true) {
      juegoNaranja.victoria();
    } else if (juegaLechuga == true) {
      juegoLechuga.victoria();
    }
  } else if (pantalla == 3) { //------------------------------------> DERROTA 1

    if (juegaNaranja == true) {
      juegoNaranja.derrota1();
    } else if (juegaLechuga == true) {
      juegoLechuga.derrota1();
    }
  } else if (pantalla == 4) { //------------------------------------> DERROTA 2

    if (juegaNaranja == true) {
      juegoNaranja.derrota2();
    } else if (juegaLechuga == true) {
      juegoLechuga.derrota2();
    }
  }
}
