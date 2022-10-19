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
int s = 0, ms = 0; // Timer

PFont fuente;
PImage [] imgGeneral;
int cantImgGeneral = 5;
PImage [] imgNaranja;
int cantImgNaranja = 5;
PImage [] imgLechuga;
int cantImgLechuga = 5;
PImage [] imgPinchos;
int cantImgPinchos = 3;

// -------------------------> Audio
Minim minim;

AudioPlayer [] musica;
int cantMusica = 2;
AudioPlayer [] sonido;
int cantSonidos = 6;

//-------------------------->
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

  minim = new Minim(this);

  musica = new AudioPlayer[cantMusica];
  for (int i = 0; i < cantMusica; i++) {
    musica [i] = minim.loadFile("musica"+i+".wav");
  }
  sonido = new AudioPlayer[cantSonidos];
  for (int i = 0; i < cantSonidos; i++) {
    sonido [i] = minim.loadFile("sonido"+i+".wav");
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
    menu.reiniciar();
    juegoActivo.dibujar();
    juegoActivo.empezar();
  } else if (pantalla == 2) { //------------------------------------> VICTORIA
    juegoActivo.victoria();
  } else if (pantalla == 3) { //------------------------------------> DERROTA 1
    juegoActivo.derrota1();
  } else if (pantalla == 4) { //------------------------------------> DERROTA 2
    juegoActivo.derrota2();
  }
}

void keyPressed() {
  if (key == 'm') {
    if (pantalla == 2 || pantalla == 3 || pantalla == 4) {
      pantalla = 0;
      juegoActivo.finalizar();
    }
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

void contactStarted(FContact contacto) { //------------------------------------------> CONDICIONES VICTORIA-DERROTA
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();

  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  if (juegoActivo == juegoNaranja) { //----------------------------------------------> NARANJA
    if (nombre2 == "Pelota" && nombre1 == "canastaFruta") { //------------> Victoria
      pantalla = 2;
    } else if (nombre2 == "Pelota" && nombre1 == "canastaVerdura") { //---> Derrota 1
      pantalla = 3;
    } else if (nombre2 == "Pelota" && nombre1 == "pincho" || nombre1 == "Pelota" && nombre2 == "pincho" || nombre2 == "Pelota" && nombre1 == "Piso") {
      //juegoActivo.dividirPelota();
      pantalla = 4;
    }
  }
  if (juegoActivo == juegoLechuga) { //----------------------------------------------> LECHUGA
    if (nombre2 == "Pelota" && nombre1 == "canastaVerdura") { //----------> Victoria
      pantalla = 2;
    } else if (nombre2 == "Pelota" && nombre1 == "canastaFruta") { //-----> Derrota 1
      pantalla = 3;
    } else if (nombre2 == "Pelota" && nombre1 == "pincho" || nombre1 == "Pelota" && nombre2 == "pincho" || nombre2 == "Pelota" && nombre1 == "Piso") {
      //juegoActivo.dividirPelota();
      pantalla = 4;
    }
  }

  if (nombre1 == "Plato Menu" && nombre2 == "Naranja") {
    pantalla = 1;
    menu.activarJuegoNaranja();
  } else if (nombre1 == "Plato Menu" && nombre2 == "Lechuga") {
    pantalla = 1;
    menu.activarJuegoLechuga();
  }
}
