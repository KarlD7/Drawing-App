import controlP5.*;

ControlP5 cp5;
PImage logo;
String font;
ControlFrameMenu menu;
ControlFrameKid kf;
ControlFrameAdult af;
boolean openedWindow;

color main;
color highlight1;
color highlight2;

Button au;
Button su;

Pencil pencil;
Shape rect;
Shape ellipse;
PImage drawnCanvas;
PImage undoCanvas;

CommandInvoker cvk;
Command strokeColor;
Command undo;
Command clear;

void settings(){
 size(1250,750);
}

void setup(){
  background(255);
 //frameRate(120);
 
 pencil = new Pencil();
 rect = new Rectangle();
 ellipse = new Ellipse();
 int[] rgb = new int[]{0,0,255};
 
 cvk = new CommandInvoker();
 strokeColor = new ColorCommand(rgb);
 undo = new UndoCommand();
 clear = new ClearCommand();
 
 logo = loadImage("ihoc.png");
 font = "DejaVuSans.ttf";
 menu = new ControlFrameMenu(this,600,350,"Name of Drawing App",logo,createFont(font,20));
 
}

//This is just how I am manually testing commands
void keyPressed(){
 if(key == CODED){
   if(keyCode == CONTROL){
     undo.execute();
   }
   if(keyCode == SHIFT){
     undo.undo(); 
   }
   if(keyCode == UP){
     clear.execute(); 
   }
   if(keyCode == DOWN){
     clear.undo(); 
   }
 } 
}

//Currently, just comment and uncomment the methods here to test the classes.
void draw(){
  //background(255);
  //strokeColor.execute();
  //strokeColor.undo();
  
  //cvk.addCommand(strokeColor);
  //cvk.executeCommand();
  //cvk.undoCommand();
  
  pencil.paint();
  //rect.paintNumerically(600,200,100,300);
  //ellipse.paintNumerically(600,200,100,300);
  //rect.paint();
  //ellipse.paint(); 
  
}

class ControlFrameMenu extends PApplet {
 int w,h;
 String name;
 PApplet parent;
 ControlP5 cp5;
 PImage logo;
 PFont font;
 
 public ControlFrameMenu(PApplet parentApplet, int wval, int hval, String nameOf, PImage icon, PFont fonts) {
  super();
  parent = parentApplet;
  w = wval;
  h = hval;
  name = nameOf;
  logo = icon;
  font = fonts;
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
  surface.setTitle("Name of Drawing App");//placeholder title
  
  cp5 = new ControlP5(this);
  openedWindow = false;
  
  image(logo,150,30);
  
  textFont(font);
  fill(highlight2);
  text("Welcome. Please select a mode.",160,200);
  
  cp5.addButton("Advanced User")
  .setFont(font)
  .setSize(200,40)
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
      af = new ControlFrameAdult(this,300,700,"Advanced Drawing Window",font);
      openedWindow = true;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
  if(su.isPressed()){
    if(!openedWindow){
      println("hello");
      kf = new ControlFrameKid(this,300,700,"Standard Drawing Window");
      openedWindow = true;
      return;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
 }
}

class ControlFrameKid extends PApplet {

  int w, h;
  String name;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrameKid(PApplet parentApplet, int wval, int hval, String nameOf) {
    super();   
    parent = parentApplet;
    w=wval;
    h=hval;
    name = nameOf;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);

  }
  
  public void setup(){
  main = #749399;
  highlight1 = #ffffff;
  highlight2 = #002D5A;
  background(main);
  surface.setTitle(name);
  font = "DejaVuSans.ttf";
  cp5 = new ControlP5(this);
  surface.setLocation(10,10);
  
  }
  
  public void draw(){
  }
}

class ControlFrameAdult extends PApplet {

  int w, h;
  String name;
  PApplet parent;
  ControlP5 cp5;
  PFont font;
  
  Button sv;

  public ControlFrameAdult(PApplet parentApplet, int wval, int hval, String nameOf,PFont fonts) {
    super();   
    parent = parentApplet;
    w=wval;
    h=hval;
    name = nameOf;
    font = fonts;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }
  
  public void setup(){
  main = #749399;
  highlight1 = #ffffff;
  highlight2 = #002D5A;
  background(main);
  surface.setTitle(name);
  cp5 = new ControlP5(this);
  surface.setLocation(10,10);
  
  cp5.addButton("Save")
  .setFont(font)
  .setSize(100,20)
  .setPosition(0,0);
  
  sv = cp5.get(Button.class,"Save");
  }
  
  
  
  public void draw(){
    if(sv.isPressed()){
      exit();
    }
  }
}
