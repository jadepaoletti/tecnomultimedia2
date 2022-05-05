class Fondo {
  
  Mancha mVio, mCel, mAzu, mNar;
  float xorigen, xtope, mover = 1;
  float xorigen2, xtope2;
  int cantManchas = 5;
  PImage [] imgManchas = new PImage[cantManchas];

  Fondo () {
    //Movimiento de las manchas
    xorigen = 0;
    xtope = xorigen + 100;
    xorigen2 = width/2 + 300 ;
    xtope2 = xorigen2 + 100;
    //Cargar imágenes
    for (int i = 0; i < cantManchas; i++) {
      imgManchas[i] = loadImage("mancha"+i+".png");
    }
    //Inicializar manchas
    mAzu = new Mancha(this, imgManchas[0], width/2, height/2, 1000, color(113, 49, 138));
    mVio = new Mancha(this, imgManchas[4], xorigen, random(height/2, height), 900, color(113, 49, 138));
    mCel = new Mancha(this, imgManchas[3], xorigen2, random(0, height/2),  850, color(209, 251, 244));
  }

  void dibujar () {
    // Fondo Azul
    mAzu.dibujar();
    
    // Mancha Violeta------------------------------------------->
    mVio.dibujar();
    mVio.mover(mover, 0);
    if (mVio.x == xtope) {
      mover = -1;
    } else if (mVio.x == xorigen) {
      mover = +1;
    }
    
    // Mancha Celeste------------------------------------------->
    mCel.dibujar();
    mCel.mover(mover, 0);
    if (mCel.x == xtope2) {
      mover = -1;
    } else if (mCel.x == xorigen2) {
      mover = +1;
    }
  }
}
