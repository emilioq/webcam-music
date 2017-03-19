import processing.video.*;
import processing.sound.*;

Capture video;
int width = 960;
int height = 720;

int vwidth = 320;
int vheight = 240;
int counter = 0;
boolean play = false;
int timer = 0;
int x = 0;



PImage frame, frame2, 
       frame3, frame4, 
       frame5, frame6, 
       frame7, frame8, frame9;
       
String     c1, c2, c3, c4, c5, c6, c7, c8, c9;
SoundFile  sA, sB, sC, sD, sE, sF, sG, sC2;

       


void setup() {
  size(1000,760);
  video = new Capture(this,vwidth,vheight,30);
  video.start();
  
  sA = new SoundFile(this, "pianoA.wav");
  sB = new SoundFile(this, "pianoB.wav");
  sC = new SoundFile(this, "pianoC.wav");
  sD = new SoundFile(this, "pianoD.wav");
  sE = new SoundFile(this, "pianoE.wav");
  sF = new SoundFile(this, "pianoF.wav");
  sG = new SoundFile(this, "pianoG.wav");
  sC2 = new SoundFile(this, "pianoC2.wav");
}

void mousePressed() {
  //image(video, 0, 0);
  //saveFrame("data/img1.jpg"); 

  switch(counter) {
    case 0: frame = video.get();
            frame.save("frame1.jpg");
            counter++;
            break;
            
    case 1: frame2 = video.get();            
            frame2.save("frame2.jpg");
            counter++;
            break;
            
    case 2: frame3 = video.get();
            frame3.save("frame3.jpg");
            counter++;
            break;
            
    case 3: frame4 = video.get();
            frame4.save("frame4.jpg");
            counter++;
            break;
            
    case 4: frame5 = video.get();
            frame5.save("frame5.jpg");
            counter++;
            break;
            
    case 5: frame6 = video.get();
            frame6.save("frame6.jpg");
            counter++;
            break;
            
    case 6: frame7 = video.get();
            frame7.save("frame7.jpg");
            counter++;
            break;
            
    case 7: frame8 = video.get();
            frame8.save("frame8.jpg");
            counter++;
            break;
            
    case 8: frame9 = video.get();
            frame9.save("frame9.jpg");
            counter++;
            break;
            
    default: counter++; break;
  }
}


void captureEvent(Capture video) {
  video.read();
}

String extractColor(PImage img) {
  int white = 0; 
  int black = 0;
  int red = 0;
  int green = 0;
  int blue = 0;
  int yellow = 0;
  int purple = 0;
  int cyan = 0;
  
  int currColor = 0;
  int max = 0;
  
  img.loadPixels();
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++) {
      int loc = x+y*img.width;
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      
      if(r >= 200 && g >= 200 && b >= 200) {
        white++;
      }
      
      if(r <= 10 && g <= 10 && b <= 10) {
        black++;
      }
      
      if(r >= 130 && g <= 125 && b <= 125) {
        red++;
      }
      
      if(r <= 125 && g >= 130 && b <= 125) {
        green++;
      }
      
      if(r <= 125 && g <= 125 && b >= 130) {
        blue++;
      }
      
      if(r >= 130 && g >= 130 && b <= 125) {
        yellow++;
      }
      
      if(r >= 130 && g <= 125 && b >= 130) {
        purple++;
      }
      
      if(r <= 125 && g >= 130 && b >= 130) {
        cyan++;
      }
    }
  }
  
  int arrOfColors[] = {white, black, 
                       red, green, 
                       blue, yellow, 
                       purple, cyan};
                       
  for(int i = 0; i < arrOfColors.length; i++){
    if(arrOfColors[i] > max) {
      max = arrOfColors[i];
      currColor = i;
    }
  }
  
  switch(currColor) {
    case 0: return "white"; 
    case 1: return "black";
    case 2: return "red";
    case 3: return "green";
    case 4: return "blue";
    case 5: return "yellow";
    case 6: return "purple";
    case 7: return "cyan";
    default: return "error 001";
  }
}


void playColors(String c) {
  switch(c) {
    case "white":    sC2.play(); break;
                    
    case "black":    sC.play(); break;
                  
    case "red":      sE.play(); break;
                  
    case "green":    sG.play(); break;
                  
    case "blue":     sF.play(); break;
                  
    case "yellow":   sA.play(); break;
                  
    case "purple":   sD.play(); break;
                  
    case "cyan":     sB.play(); break;
  }
}


void draw() {
  //if(video.available()){
  //  video.read();
  //}
  if (counter >= 0) {
    background(255);
  }
  
  if(counter == 0) {
    image(video, 10, 10);
  }
  if(counter >= 1){
    image(frame, 10, 10); 
    image(video, 340,10);
  }
  if(counter >= 2){
    image(frame2, 340,10);
    image(video, 670,10);
  }
  if(counter >= 3){
    image(frame3, 670, 10);
    image(video, 10,260);
  }
  if(counter >= 4){
    image(frame4, 10,260);
    image(video, 340,260);
  }
  if(counter >= 5){
    image(frame5, 340,260);
    image(video, 670,260);
  }
  if(counter >= 6){
    image(frame6, 670,260);
    image(video, 10,510);
  }
  if(counter >= 7){
    image(frame7, 10,510);
    image(video, 340,510);
  }
  if(counter >= 8){
    image(frame8, 340,510);
    image(video, 670,510);
  }
  if(counter >= 9){
    image(frame9, 670,510);
  }  
  
  if(counter == 10){
    frame = loadImage("frame1.jpg");
    c1 = extractColor(frame);
    
    frame2 = loadImage("frame2.jpg");
    c2 = extractColor(frame2);
    
    frame3 = loadImage("frame3.jpg");
    c3 = extractColor(frame3);
    
    frame4 = loadImage("frame4.jpg");
    c4 = extractColor(frame4);
    
    frame5 = loadImage("frame5.jpg");
    c5 = extractColor(frame5);
    
    frame6 = loadImage("frame6.jpg");
    c6 = extractColor(frame6);
    
    frame7 = loadImage("frame7.jpg");
    c7 = extractColor(frame7);
    
    frame8 = loadImage("frame8.jpg");
    c8 = extractColor(frame8);
    
    frame9 = loadImage("frame9.jpg");
    c9 = extractColor(frame9);
    counter++;
  }
  
  if(counter == 11) {
    System.out.println("Frame 1 is " + c1);
    System.out.println("Frame 2 is " + c2);
    System.out.println("Frame 3 is " + c3);
    System.out.println("Frame 4 is " + c4);
    System.out.println("Frame 5 is " + c5);
    System.out.println("Frame 6 is " + c6);
    System.out.println("Frame 7 is " + c7);
    System.out.println("Frame 8 is " + c8);
    System.out.println("Frame 9 is " + c9);
    counter++;
  }
  
  if(counter >= 12) {
    background(10); 
    timer++;
    

    if(timer > 100 && timer < 200)   {  image(frame, 10, 10);      filter(GRAY);}
    if(timer == 100)   {playColors(c1);}
    
    if(timer > 200 && timer < 300)  {  image(frame2, 340,10);    filter(GRAY);}
    if(timer == 200)  {playColors(c2);}
    
    if(timer > 300 && timer < 400)  {  image(frame3, 670,10);    filter(GRAY);}
    if(timer == 300)  {playColors(c3);}
    
    if(timer > 400 && timer < 500)  {  image(frame4, 10,260);    filter(GRAY);}
    if(timer == 400)  {playColors(c4);}
    
    if(timer > 500 && timer < 600)  {  image(frame5, 340,260);  filter(GRAY);}
    if(timer == 500)  {playColors(c5);}
    
    if(timer > 600 && timer < 700)  {  image(frame6, 670,260);  filter(GRAY);}
    if(timer == 600)  {playColors(c6);}
    
    if(timer > 700 && timer < 800)  {  image(frame7, 10,510);    filter(GRAY);}
    if(timer == 700)  {playColors(c7);}
    
    if(timer > 800 && timer < 900)  {  image(frame8, 340,510);  filter(GRAY);}
    if(timer == 800)  {playColors(c8);}
    
    if(timer > 900 && timer < 1000)  {  image(frame9, 670,510);  filter(GRAY);}
    if(timer == 900)  {playColors(c9);}
    
    if(timer >= 1200) {
      
      textSize(16);
      text("      a      n      C      l         s ", 50, 50+x*.01);
      text("   e    r      g              o        ", 50, 50+x*.02);
      text("H          i            o        r       ", 50, 50+x*.01);
      fill(250,250,250);
      fill(x++,2*x++,x+=.5);
      
      if(timer >= 1650) {
        counter = 0;
        timer = 0;
        x = 0;
      }
    }
  }
  
}