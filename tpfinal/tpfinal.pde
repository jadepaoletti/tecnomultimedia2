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

Menu menu;
Juego juegoNaranja, juegoLechuga;
Protagonista naranja, lechuga;


int pantalla = 1;
int vidas = 3;
int bordeLimite = 100;

float prota_x, prota_y, prota_tam;
float plato_x, plato_y, plato_tam;
float antag_x, antag_y, antag_tam;

PFont fuente;
PImage fondo;
PImage imgPersonaje, imgVictoria, imgDerrota1, imgDerrota2;

PImage [] imgNaranja;
int cantImgNaranja = 5;
PImage [] imgLechuga;
int cantImgLechuga = 5;

boolean juegaNaranja, juegaLechuga;

FWorld mundo;
FWorld mundoMenu;


void setup () {
  size(1500, 1000);

  prota_x = random(bordeLimite, width-bordeLimite);
  prota_y = bordeLimite;

  fuente = createFont("fuente.ttf", 30);
  fondo = loadImage("fondo.png");

  imgNaranja = new PImage[cantImgNaranja];
  for (int i = 0; i < cantImgNaranja; i++) {
    imgNaranja[i] = loadImage("naranja"+i+".png");
  }
  imgLechuga = new PImage[cantImgLechuga];
  for (int i = 0; i < cantImgLechuga; i++) {
    imgLechuga[i] = loadImage("lechuga"+i+".png");
  }



  //--------------------------------------------------------------------------------------- CLASES

  Fisica.init(this);

  mundo = new FWorld();
  mundoMenu = new FWorld();

  juegoNaranja = new Juego (naranja, imgNaranja[4], imgNaranja[1], imgNaranja[2], imgNaranja[3]);
  juegoLechuga = new Juego (lechuga, imgLechuga[4], imgLechuga[1], imgLechuga[2], imgLechuga[3]);

  naranja = new Protagonista ("Naranja", imgNaranja[0]);
  lechuga = new Protagonista ("Lechuga", imgLechuga[0]);

  menu = new Menu(fondo, imgNaranja[0], imgLechuga[0]);
}

void draw() {

  if (pantalla == 0) { //-------------------------------------------> MENU
    mundoMenu.draw();
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
