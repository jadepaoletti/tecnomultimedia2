class Figura {
  
  /*
    Sonidos agudos -> Mancha negra se agranda / mancha naranja achica
    Sonidos graves -> Mancha naranja se agranda / mancha negra achica
  */

  GestorSenial gestorAmp, gestorPitch;

  int imageIndex=0;
  PImage[] mNeg= new PImage[5];
  PImage[] mNar= new PImage[5];

  float xNeg = width/2 + 100, yNeg = height/2 + 100;
  float xNar = width/2 + 100, yNar = height/2 + 100;
  
  // Tamaños ------------------------------------------------->
  float tamInicialNeg = 100, tamMinNeg = 50, tamMaxNeg = 350;
  float tamInicialNar = 100, tamMinNar = 50, tamMaxNar = 350;
  boolean tamStopNeg = false, tamStopNar = false;

  float r1 = radians(360), r2;
  float n = 0, m =0;
  float t1, t2, vel, dir;



  Figura () {
    for (int i=0; i < mNeg.length; i++) {
      mNeg[i]= loadImage("mNeg_" + i + ".png");
    }
    for (int i=0; i < mNar.length; i++) {
      mNar[i]= loadImage("mNar_" + i + ".png");
    }
    dir = 0;
    vel = 30;
  }


  void dibujar() {
    float propiedad = pitch;
    float maxPropiedad = maxPitch;

    //Mancha negra --------------------------------------->
    if (propiedad > maxPropiedad & tamStopNeg == false) {
      tamInicialNeg = tamInicialNeg + 1;
    }
    if (propiedad < maxPropiedad & tamStopNeg == false) {
      tamInicialNeg = tamInicialNeg - 1;
    }
    if (tamStopNeg == false & tamInicialNeg >= tamMaxNeg) {
      tamInicialNeg = 350;
      tamStopNeg = true;
    }
    if (tamStopNeg == false & tamInicialNeg <= tamMinNeg) {
      tamInicialNeg = 50;
      tamStopNeg = true;
    }
    if (tamStopNeg == true & tamInicialNeg >= 350 & propiedad < maxPropiedad) {
      tamInicialNeg = tamInicialNeg - 1;
      tamStopNeg = false;
    }
    if (tamStopNeg == true & tamInicialNeg <= 50 & propiedad > maxPropiedad) {
      tamInicialNeg = tamInicialNeg + 1;
      tamStopNeg = false;
    }

    // Limite de la mancha -------------------------------->
    if (xNeg > width) {
      xNeg = width/2;
    } else if (yNeg > height) {
      yNeg = height/2;
    } else if (xNeg < 0) {
      xNeg = width/2;
    } else if (yNeg < 0) {
      yNeg = height/2;
    }


    // Mancha Naranja

    if (propiedad < maxPropiedad & tamStopNar == false) {
      tamInicialNar = tamInicialNar+5;
    }
    if (propiedad > maxPropiedad & tamStopNar == false) {
      tamInicialNar = tamInicialNar-5;
    }
    if (tamStopNar == false & tamInicialNar >= tamMaxNar) {
      tamInicialNar = 350;
      tamStopNar = true;
    }
    if (tamStopNar == false & tamInicialNar <= tamMinNar) {
      tamInicialNar = 50;
      tamStopNar = true;
    }
    if (tamStopNar == true & tamInicialNar >= 350 & propiedad > maxPropiedad) {
      tamInicialNar = tamInicialNar - 5;
      tamStopNar = false;
    }
    if (tamStopNar == true & tamInicialNar <= 50 & propiedad < maxPropiedad) {
      tamInicialNar = tamInicialNar + 5;
      tamStopNar = false;
    }
    
    // Limite de la mancha -------------------------------->
    if (xNar > width) {
      xNar = width/2;
    } else if (yNar > height) {
      yNar = height/2;
    } else if (xNar < 0) {
      xNar = width/2;
    } else if (yNar < 0) {
      yNar = height/2;
    }
  }
  void mover() {
    dir = random(0, 360);
    dir += 1 ;
    xNeg = xNeg + vel * cos(radians(dir));
    yNeg = yNeg + vel * sin(radians(dir));

    float xNar = lerp(width/2, xNeg, 0.5);
    float yNar = lerp(height/2, yNeg, 0.5);

    n = n + 0.05;
    m = m - 0.05;

    /*grafico1.fill(255, 10);
    grafico1.rect(0, 0, width, height);*/
    grafico1.image(mNar[imageIndex], xNar, yNar, tamInicialNar, tamInicialNar);
    imageIndex=(imageIndex+1)% mNar.length;
    grafico1.image(mNeg[imageIndex], xNeg, yNeg, tamInicialNeg, tamInicialNeg);
    imageIndex=(imageIndex+1)% mNeg.length;
  }
}
