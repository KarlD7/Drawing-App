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
 
 public ControlFrameMenu(PApplet parentApplet, int wval, int hval, String nameOf, PImage icon, PFont fonts,PImage shape1,PImage shape2,PImage shape3,PImage shape4,PImage shape5) {
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
  PApplet.runSketch(new String[]{this.getClass().getName()},this);
 }
 
 public void settings(){
   size(w,h);
 }
 
 public void setup(){
  main = #749399;
  highlight1 = #ffffff;
  highlight2 = #002D5A;
  
  background(main);
  surface.setTitle("NCPaint");
  
  cp5 = new ControlP5(this);
  openedWindow = false;
  
  image(logo,150,30);
  
  textFont(font);
  fill(highlight2);
  text("Welcome. Please select a mode.",160,200);
  
  cp5.addButton("Advanced User")
  .setFont(font)
  .setSize(200,40)
  .plugTo(parent,"isAdult")
  .setPosition(50,250);
  au = cp5.get(Button.class,"Advanced User");
  
  cp5.addButton("Standard User")
  .setFont(font)
  .setSize(200,40)
  .setPosition(350,250);
  su = cp5.get(Button.class,"Standard User");
   
 }
 
 public void draw(){
   if(au.isPressed()){
    if(!openedWindow){
      println("Opening Advanced window...");
      af = new ControlFrame(parent,350,700,"Advanced Drawing Window",font,true,rectImg,triImg,elliImg,arcImg,lineImg);
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
      kf = new ControlFrame(parent,300,700,"Standard Drawing Window",font,false,rectImg,triImg,elliImg,arcImg,lineImg);
      openedWindow = true;
      return;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
 }
}
