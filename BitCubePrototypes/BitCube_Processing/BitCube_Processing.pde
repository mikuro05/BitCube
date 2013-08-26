import processing.opengl.*;

void setup() {
  size(800, 600, OPENGL);
}

void draw() {
  background(250);
  updateCamera();
  
}




// Camera

float camAng = 0;
float camAngH = 0;
float camDist = 500;
float gCamAng = 0;
float gCamAngH = 130;
float gCamDist = 500;
void updateCamera() {

  pushMatrix();    
  noFill();
  translate( width/2,height/2,0);
  stroke(255,0,0,100);
  line(0,0,0,100,0,0);
  stroke(0,255,0,100);
  line(0,0,0,0,-100,0);
  stroke(0,0,255,100);
  line(0,0,0,0,0,100);
  stroke(0,0,0,10);
  box(500);
  popMatrix();
  
  pushMatrix();    
  translate( width/2,height/2,0);
  for(int x=0; x<20; x++){
    for(int y=0; y<20; y++){
      for(int z=0; z<20; z++){
        pushMatrix();
        translate(x*10-100,y*10-100,z*10-100);
        rotateY(radians(camAng*-1+90));
        rotateX(radians(camAngH+90));

        noStroke();
        fill(200,0,0,100);
        rect(0,0,10,10);
        popMatrix();  
      }
    }
  }
  popMatrix();
  gCamAng++;
  if(keyPressed){
    if(keyCode==LEFT){gCamAng++;}
    if(keyCode==RIGHT){gCamAng--;}
    if( key=='['){ if(gCamDist>10)gCamDist-=10;}
    if( key==']'){ if(gCamDist<1000)gCamDist+=10;}
    if(keyCode==UP){ if(gCamAngH<180)gCamAngH++;}
    if(keyCode==DOWN){ if(gCamAngH>0)gCamAngH--;}
  }

  camAng += (gCamAng-camAng)/10;
  camAngH += (gCamAngH-camAngH)/10;
  camDist += (gCamDist-camDist)/10;
  
  float cx = sin( radians(camAngH) )*camDist;
  float cy = cos( radians(camAngH) )*camDist;
  float hdist = cx;
  float cz = sin( radians(camAng) )* hdist;
  cx = cos( radians(camAng) )* hdist;
  
  beginCamera();
  camera(cx+width/2, cy+height/2, cz, width/2, height/2, 0.0, 0.0, 1.0, 0.0);
  endCamera();
  
  println(frameRate);
}


// Mode

int mode = 0;
void keyPressed() {
  if(key=='0'){  mode = 0;   }
  if(key=='1'){  mode = 1;   }
  if(key=='2'){  mode = 2;   }
  if(key=='3'){  mode = 3;   }
  if(key=='4'){  mode = 4;   }
  if(key=='5'){  mode = 5;   }
  if(key=='6'){  mode = 6;   }
  if(key=='7'){  mode = 7;   }
  if(key=='8'){  mode = 8;   }
  if(key=='9'){  mode = 9;   }
}

