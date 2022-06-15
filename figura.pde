class Figura {
  /*
    Sonidos bajos -> *accion*
    Sonidos altos -> *accion*
   */
  GestorSenial gestorAmp, gestorPitch;
  
  int imageIndex=0;
  
  PImage[] mNeg= new PImage[5];
  PImage[] mNar= new PImage[5];
  
  float x1=width/2, y1 = height/2;
  float x2=width/2, y2 = height/2;
  float tamInicialNeg = 100, tamInicialNar = 100;
  float tamMin = 50;
  float tamMax = 100;
  
  float r1 = radians(360), r2;
  float n = 0, m =0;
  float t1, t2, vel;

  

  Figura () {
    for (int i=0; i < mNeg.length; i++) {
      mNeg[i]= loadImage("mNeg_" + i + ".png");
    }
    for (int i=0; i < mNar.length; i++) {
      mNar[i]= loadImage("mNar_" + i + ".png");
    }
  }

  void dibujar(float pitch) {
    vel = pitch;

    //Mancha negra --------------------------------------------->
    //if (pitch > minPitch){x1 = width/2;}
    //if (pitch < minPitch){y1 = height/2;}
    
    if (pitch > maxPitch) {tamInicialNeg =+ 5;}
    if (pitch < maxPitch) {tamInicialNeg =- 5;}
    if (tamInicialNeg >= 650) {tamInicialNeg = 250;}
    if (tamInicialNeg <= tamMin) {tamInicialNeg = 250;}
    
    // Límite mancha negra ------------------------------------->
    if (x1 > width){x1 = width/2;}
    if (y1 > height){y1 = height/2;}
    if (x1 < 0){x1 = width/2;}
    if (y1 < 0){y1 = height/2;}

    // Mancha naranja ------------------------------------------>
    //if (pitch < minAmp){x2 = width/2;}
    //if (pitch > minPitch){y2 = height/2;}
    
    if (pitch < maxPitch){tamInicialNar =+ 5;}
    if (pitch > maxPitch){tamInicialNar =- 5;}
    if (tamInicialNar >= 650){tamInicialNar = 250;}
    if (tamInicialNar <= tamMin){tamInicialNar = 250;}
    
    // Límite mancha negra ------------------------------------->
    if (x2 > width){x2 = width/2;}
    if (y2 > height){y2 = height/2;}
    if (x2 < 0){x2 = width/2;}
    if (y2 < 0){y2 = height/2;}

    n = n + 0.05;
    m = m - 0.05;

    grafico1.background(0, 10);
    grafico1.image(mNeg[imageIndex], x1+ cos(m) * random(100, 200), y1 + sin(m) * random(100, 200), tamInicialNeg, tamInicialNeg);
    //imageIndex=(imageIndex+1)% mNeg.length;
    grafico1.image(mNar[imageIndex], x2+ cos(n) * random(100, 200), y2 + sin(n) * random(100, 200), tamInicialNar, tamInicialNar);
    //imageIndex=(imageIndex+1)% mNar.length;
  }
}
