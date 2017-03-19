import processing.video.*;
Capture video;
int width = 960;
int height = 720;

int vwidth = 320;
int vheight = 240;
int counter = 0;


PImage frame, frame2, 
       frame3, frame4, 
       frame5, frame6, 
       frame7, frame8;
       
String c1, c2, c3, c4, c5, c6, c7, c8;
       


void setup() {
  size(960,720);
  video = new Capture(this,vwidth,vheight,30);
  video.start();
 
}

void mousePressed() {
  //image(video, 0, 0);
  //saveFrame("data/img1.jpg"); 

  switch(counter) {
    case 0: frame = video.get();
            counter++;
            break;
    case 1: frame2 = video.get();
            counter++;
            break;
    case 2: frame3 = video.get();
            counter++;
            break;
    case 3: frame4 = video.get();
            counter++;
            break;
    case 4: frame5 = video.get();
            counter++;
            break;
    case 5: frame6 = video.get();
            counter++;
            break;
    case 6: frame7 = video.get();
            counter++;
            break;
    case 7: frame8 = video.get();
            counter++;
            break;
            
    default: counter++; break;
  }
}


void captureEvent(Capture video) {
  video.read();
}

void extractColor(PImage img) {
  int white = 0; 
  int black = 0;
  int red = 0;
  int green = 0;
  int blue = 0;
  int yellow = 0;
  int purple = 0;
  int cyan = 0;

  img.loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++) {
      int loc = x+y*width;
      float r = red(pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue(pixels[loc]);
      
      if(r >= 130 && g >= 130 && b >= 130) {
        white++;
      }
      
      if(r <= 130 && g <= 130 && b <= 130) {
        black++;
      }
      
      if(r >= 130 && g <= 130 && b <= 130) {
        red++;
      }
      
      if(r <= 130 && g >= 130 && b <= 130) {
        green++;
      }
      
      if(r <= 130 && g <= 130 && b >= 130) {
        blue++;
      }
      
      if(r >= 130 && g >= 130 && b <= 130) {
        yellow++;
      }
      
      if(r >= 130 && g <= 130 && b >= 130) {
        purple++;
      }
      
      if(r <= 130 && g >= 130 && b >= 130) {
        cyan++;
      }
    }
  }
  
  
  
}

void draw() {
  //if(video.available()){
  //  video.read();
  //}
  
  background(255);
  
  if(counter == 0) {
    image(video, 0, 0);
  }
  if(counter >= 1){
    image(frame, 0, 0); 
    image(video, 320,0);
  }
  if(counter >= 2){
    image(frame2, 320,0);
    image(video, 640,0);
  }
  if(counter >= 3){
    image(frame3, 640,0);
    image(video, 0,240);
  }
  if(counter >= 4){
    image(frame4, 0,240);
    image(video, 320,240);
  }
  if(counter >= 5){
    image(frame5, 320,240);
    image(video, 640,240);
  }
  if(counter >= 6){
    image(frame6, 640,240);
    image(video, 0,480);
  }
  if(counter >= 7){
    image(frame7, 0,480);
    image(video, 320,480);
  }
  if(counter >= 8){
    image(frame8, 320,480);
    image(video, 640,480);
  }
  
  if(counter >= 9){
    
    /*
    loadPixels();
    for(int x = 0; x < width; x++){
      for(int y = 0; y < height; y++) {
        int loc = x+y*width;
        
        float r = red(pixels[loc]);
        float g = green(pixels[loc]);
        float b = blue(pixels[loc]);
        
        //pixels[loc] = color(g,r,b);
      }
    }
    updatePixels();
    */
    
    
    
    
  }
  
  
  
}