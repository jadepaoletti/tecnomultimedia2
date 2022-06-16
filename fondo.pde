class Fondo {
  /*
    Sonidos bajos -> Las manchas se mueven lento
    Sonidos altos -> Las manchas se mueven rápido
  */
  
  GestorSenial gestorAmp, gestorPitch;
  ManchasFondo mAzu, mVio, mBla;
  
  float xorigenV, xtopeV;
  float xorigenC, xtopeC;

  float velInicial;
  float vel;
  
  int cantManchas = 5;
  PImage [] imgManchas = new PImage[cantManchas];
  
  Fondo () {
    // Límites mancha violeta ---------------------------------->
    xorigenV = 0;
    xtopeV = xorigenV + 100;
    
    // Límites mancha celeste ---------------------------------->
    xorigenC = width/2 + 300 ;
    xtopeC = xorigenC + 100;
    
    //Cargar imágenes ------------------------------------------>
    for (int i = 0; i < cantManchas; i++) {
      imgManchas[i] = loadImage("mancha"+i+".png");
    }
    
    //Inicializar manchas -------------------------------------->
    mAzu = new ManchasFondo(this, imgManchas[0], width/2, height/2, 1000);
    mVio = new ManchasFondo(this, imgManchas[4], xorigenV, random(height/2, height), 900);
    mBla = new ManchasFondo(this, imgManchas[3], xorigenC, random(0, height/2),  850);
  }

  void dibujar (float amp) {
    vel = amp;
    
    // Fondo Azul ---------------------------------------------->
    mAzu.dibujar();
    
    // Mancha Violeta ------------------------------------------>
    mVio.dibujar();
    if (mVio.x >= xtopeV){ velInicial =- vel; } 
    else if (mVio.x <= xorigenV){ velInicial =+ vel; }
    mVio.mover(velInicial);
    
    // Mancha Blanca ------------------------------------------>
    mBla.dibujar();
    if (mBla.x >= xtopeC){ velInicial =- vel; }
    else if (mBla.x <= xorigenC){ velInicial =+ vel; }
    mBla.mover(velInicial);
  }
}
