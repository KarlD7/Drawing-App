import controlP5.*;

ControlP5 cp5;
PImage logo;
String font;
ControlFrameKid kf;
ControlFrameAdult af;
boolean openedWindow;

color main;
color highlight1;
color highlight2;

Button au;
Button su;

void settings(){
    size(600,350);
}

void setup(){
  main = #749399;
  highlight1 = #ffffff;
  highlight2 = #002D5A;
  
  background(main);
  surface.setTitle("Name of Drawing App");//placeholder title
  
  logo = loadImage("ihoc.png"); //placeholder image, should be replaced
  font = "DejaVuSans.ttf";
  cp5 = new ControlP5(this);
  openedWindow = false;
  
  image(logo,150,30);
  
  textFont(createFont(font,20));
  fill(highlight2);
  text("Welcome. Please select a mode.",160,200);
  
  cp5.addButton("Advanced User")
  .setFont(createFont(font,20))
  .setSize(200,40)
  .setPosition(50,250);
  au = cp5.get(Button.class,"Advanced User");
  
  cp5.addButton("Standard User")
  .setFont(createFont(font,20))
  .setSize(200,40)
  .setPosition(350,250);
  su = cp5.get(Button.class,"Standard User");
  
}

void draw(){
  if(au.isPressed()){
    if(!openedWindow){
      println("Opening Advanced window...");
      af = new ControlFrameAdult(this,1000,700,"Advanced Drawing Window");
      openedWindow = true;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
  if(su.isPressed()){
    if(!openedWindow){
      println("hello");
      kf = new ControlFrameKid(this,1000,700,"Standard Drawing Window");
      openedWindow = true;
    }
    else {
      println("Drawing window has already been opened. Please restart program in order to open another.");
    };
  };
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
  
  
  }
  
  public void draw(){
  }
}

class ControlFrameAdult extends PApplet {

  int w, h;
  String name;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrameAdult(PApplet parentApplet, int wval, int hval, String nameOf) {
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
  
  cp5.addButton("Save")
  //.setFont(createFont(font,20))
  .setSize(100,20)
  .setPosition(0,0);
  }
  
  public void draw(){
  }
}
