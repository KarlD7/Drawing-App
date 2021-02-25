public class ControlFrameMenu extends PApplet {
 int w,h;
 String name;
 PApplet parent;
 ControlP5 cp5;
 PImage logo;
 PFont font;
 
 PImage rectImg;
 PImage triImg;
 PImage elliImg;
 PImage arcImg;
 PImage lineImg;
 PImage rectImg2;
 PImage triImg2;
 PImage elliImg2;
 PImage arcImg2;
 PImage lineImg2;
 PImage rotL;
 PImage rotLP;
 PImage rotR;
 PImage rotRP;
 
 public ControlFrameMenu(PApplet parentApplet, int wval, int hval, String nameOf, PImage icon, PFont fonts,PImage shape1,PImage shape2,PImage shape3,PImage shape4,PImage shape5,PImage shape6,PImage shape7,PImage shape8,PImage shape9,PImage shape10,PImage shape11,PImage shape12,PImage shape13,PImage shape14) {
  super();
  parent = parentApplet;
  w = wval;
  h = hval;
  name = nameOf;
  logo = icon;
  font = fonts;
  rectImg = shape1;
  triImg = shape2;
  elliImg = shape3;
  arcImg = shape4;
  lineImg = shape5;
  rectImg2 = shape6;
  triImg2 = shape7;
  elliImg2 = shape8;
  arcImg2 = shape9;
  lineImg2 = shape10;
  rotL = shape11;
  rotLP = shape12;
  rotR = shape13;
  rotRP = shape14;
  PApplet.runSketch(new String[]{this.getClass().getName()},this);
 }
 
 public void settings(){
   size(w,h);
 }
 
 public void setup(){
  surface.setLocation(1090,350);
  main = #749399;
  highlight1 = #ffffff;
  highlight2 = #002D5A;
  
  background(main);
  surface.setTitle("NCPaint");
  
  cp5 = new ControlP5(this);
  openedWindow = false;
  
  image(logo,220,30);
  
  textFont(font);
  fill(highlight2);
  text("Welcome. Please select a mode.",160,200);
  text("by VACKintosh",0,345);
  
  cp5.addButton("Advanced Mode")
  .setFont(font)
  .setSize(200,40)
  .plugTo(parent,"isAdult")
  .setPosition(50,250);
  au = cp5.get(Button.class,"Advanced Mode");
  
  cp5.addButton("Kid Mode")
  .setFont(font)
  .setSize(200,40)
  .setPosition(350,250);
  su = cp5.get(Button.class,"Kid Mode");
   
 }
 
 public void draw(){
   if(au.isPressed()){
    if(!openedWindow){
      println("Opening Advanced window...");
      af = new ControlFrame(parent,700,750,"Advanced Drawing Window",font,true,rectImg,triImg,elliImg,arcImg,lineImg,rectImg2,triImg2,elliImg2,arcImg2,lineImg2,rotL,rotLP,rotR,rotRP);
      openedWindow = true;
      au.setValue(1.0);
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
  if(su.isPressed()){
    if(!openedWindow){
      println("hello");
      kf = new ControlFrame(parent,300,750,"Standard Drawing Window",font,false,rectImg,triImg,elliImg,arcImg,lineImg,rectImg2,triImg2,elliImg2,arcImg2,lineImg2,rotL,rotLP,rotR,rotRP);
      openedWindow = true;
      return;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
 }
}
