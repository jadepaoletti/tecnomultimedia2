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
Juego juegoNaranja, juegoLechuga, juegoActivo;

int pantalla = 0;
int vidas = 3;

int s1 = 0, ms1 = 0; // Timer1
int s2 = 0, ms2 = 0; // Timer2

PFont fuente;
PImage [] imgGeneral;
int cantImgGeneral = 5;
PImage [] imgNaranja;
int cantImgNaranja = 5;
PImage [] imgLechuga;
int cantImgLechuga = 5;
PImage [] imgPinchos;
int cantImgPinchos = 3;

boolean juegaNaranja, juegaLechuga;

void setup () {
  size(1500, 1000);

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
  juegoNaranja = new Juego (imgNaranja[0], imgNaranja[1], imgNaranja[2], imgNaranja[3], imgNaranja[4]);
  juegoLechuga = new Juego (imgLechuga[0], imgLechuga[1], imgLechuga[2], imgLechuga[3], imgLechuga[4]);
}

void texto(String texto, float x, float y, int tam, PFont fuente) {
  push();
  fill(0);
  textFont(fuente);
  textSize(tam);
  textAlign(CENTER, CENTER);
  text(texto, x, y);
  pop();
}

void draw() {

  if (pantalla == 0) { //-------------------------------------------> MENU
    menu.ejecutar();
  } else if (pantalla == 1) { //------------------------------------> JUEGO

    juegoActivo = juegoNaranja;

    juegoActivo.inicializar();
    juegoActivo.dibujar();

    juegoActivo.empezar();
  } else if (pantalla == 2) { //------------------------------------> VICTORIA

    juegoActivo.victoria();
    juegoActivo.reiniciar();
  } else if (pantalla == 3) { //------------------------------------> DERROTA 1

    juegoActivo.derrota1();
    juegoActivo.reiniciar();
  } else if (pantalla == 4) { //------------------------------------> DERROTA 2

    juegoActivo.derrota2();
    juegoActivo.reiniciar();
  }
}

void keyPressed() {
  if (pantalla == 0 && keyCode == ENTER) {
    pantalla = 1;
  }
  if (pantalla == 2 || pantalla == 3 || pantalla == 4 && keyCode == 'm') {
    pantalla = 0;
    menu.reiniciar();
    juegoActivo.reiniciar();
  }
}

String conseguirNombre(FBody cuerpo) {
  String nombre = "nada";
  if (cuerpo != null ) {
    nombre = cuerpo.getName();
  }
  if (nombre == null) {
    nombre = "nada";
  }
  return nombre;
}

void contactStarted(FContact contactoJuego) { //------------------------------------------> CONDICIONES VICTORIA-DERROTA

  FBody cuerpo1 = contactoJuego.getBody1();
  FBody cuerpo2 = contactoJuego.getBody2();

  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);


  if (juegoActivo == juegoNaranja) { //----------------------------------------------> NARANJA
    if (nombre2 == "Pelota" && nombre1 == "canastaFruta") { //------------> Victoria
      pantalla = 2;
    } else if (nombre2 == "Pelota" && nombre1 == "canastaVerdura") { //---> Derrota 1
      pantalla = 3;
    } else if (nombre2 == "Pelota" && nombre1 == "Pinchos") {
      pantalla = 4;
      juegoActivo.dividirPelota();
    }
  }

  if (juegoActivo == juegoLechuga) { //----------------------------------------------> LECHUGA
    if (nombre2 == "Pelota" && nombre1 == "canastaVerdura") { //----------> Victoria
      pantalla = 2;
    } else if (nombre2 == "Pelota" && nombre1 == "canastaFruta") { //-----> Derrota 1
      pantalla = 3;
    }
  }
}
