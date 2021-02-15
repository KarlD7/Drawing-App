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
      af = new ControlFrameAdult(parent,300,700,"Advanced Drawing Window",font);
      openedWindow = true;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
  if(su.isPressed()){
    if(!openedWindow){
      println("hello");
      kf = new ControlFrameKid(parent,300,700,"Standard Drawing Window",font);
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
  PFont font;
  
  Button paintButton;
  Button rectButton;
  Button elliButton;
  
  Button undoButton;
  Button redoButton;
  Button ex;
  Button sv;
  Button imp;

  public ControlFrameKid(PApplet parentApplet, int wval, int hval, String nameOf,PFont fonts) {
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
  
  cp5.addButton("Brush")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,20);
  paintButton = cp5.get(Button.class,"Brush");
  
  cp5.addButton("Rectangle")
  .setFont(font)
  .setSize(150,30)
  .setPosition(10,60);
  rectButton = cp5.get(Button.class,"Rectangle");
  
  cp5.addButton("Ellipse")
  .setFont(font)
  .setSize(120,30)
  .setPosition(10,100);
  elliButton = cp5.get(Button.class,"Ellipse");
  
  /* Button template
  cp5.addButton("[name]")
    .setFont(font)
    .setSize(100,30)
    .plugToParent(parent,[name]);
    .setPosition(10,[]);
  [abrv] = cp5.get(Button.class,"[name]");
  */
  
  cp5.addButton("Undo")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,550);
  undoButton = cp5.get(Button.class,"Undo");
  
  cp5.addButton("Redo")
  .setFont(font)
  .setSize(100,30)
  .setPosition(180,550);
  redoButton = cp5.get(Button.class,"Redo");
  
  cp5.addButton("Import")
   .setFont(font)
   .setSize(100,30)
   .setPosition(180,590);
  imp = cp5.get(Button.class,"Import");
  
  cp5.addButton("Save")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,590);
  sv = cp5.get(Button.class,"Save");
  
  cp5.addButton("Exit")
  .setFont(font)
  .setSize(200,30)
  .setPosition((w/2)-100,h-60);
  ex = cp5.get(Button.class,"Exit");
  
  }
  
  public void draw(){
    
    if(ex.isPressed()){
      exit();
    }
    
  }
}

class ControlFrameAdult extends PApplet {

  int w, h;
  String name;
  PApplet parent;
  ControlP5 cp5;
  PFont font;
  
  Button paintButton;
  Button rectButton;
  Button elliButton;
  
  Button undoButton;
  Button redoButton;
  Button ex;
  Button sv;
  Button imp;

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
  
  cp5.addButton("Brush")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,20);
  paintButton = cp5.get(Button.class,"Brush");
  
  cp5.addButton("Rectangle")
  .setFont(font)
  .setSize(150,30)
  .setPosition(10,60);
  rectButton = cp5.get(Button.class,"Rectangle");
  
  cp5.addButton("Ellipse")
  .setFont(font)
  .setSize(120,30)
  .setPosition(10,100);
  elliButton = cp5.get(Button.class,"Ellipse");
  
  cp5.addButton("Undo")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,550);
  undoButton = cp5.get(Button.class,"Undo");
  
  cp5.addButton("Redo")
  .setFont(font)
  .setSize(100,30)
  .setPosition(180,550);
  redoButton = cp5.get(Button.class,"Redo");
  
  cp5.addButton("Import")
   .setFont(font)
   .setSize(100,30)
   .setPosition(180,590);
  imp = cp5.get(Button.class,"Import");
  
  cp5.addButton("Save")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,590);
  sv = cp5.get(Button.class,"Save");
  
  cp5.addButton("Exit")
  .setFont(font)
  .setSize(200,30)
  .setPosition((w/2)-100,h-60);
  ex = cp5.get(Button.class,"Exit");
  }
  
  
  
  public void draw(){
    if(ex.isPressed()){
      exit();
    }
  }
}
