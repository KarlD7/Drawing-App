public class ControlFrame extends PApplet {

  int w, h;
  String name;
  PApplet parent;
  ControlP5 cp5;
  PFont font;
  Boolean adult;
  
  Button paintButton;
  Button rectButton;
  Button elliButton;
  Button triButton;
  Button arcButton;
  Button lnButton;
  
  Button undoButton;
  Button redoButton;
  Button ex;
  Button cl;
  Button imp;

  public ControlFrame(PApplet parentApplet, int wval, int hval, String nameOf,PFont fonts,Boolean isAdult) {
    super();   
    parent = parentApplet;
    w=wval;
    h=hval;
    name = nameOf;
    font = fonts;
    adult = isAdult;  //if this is false, hide the advanced features
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
  .plugTo(parent,"brush")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,20);
  paintButton = cp5.get(Button.class,"Brush");
  
  cp5.addButton("Rectangle")
  .plugTo(parent,"rectBrush")
  .setFont(font)
  .setSize(150,30)
  .setPosition(10,60);
  rectButton = cp5.get(Button.class,"Rectangle");
  
  cp5.addButton("Ellipse")
  .plugTo(parent,"ellipseBrush")
  .setFont(font)
  .setSize(120,30)
  .setPosition(10,100);
  elliButton = cp5.get(Button.class,"Ellipse");
  
  cp5.addButton("Triangle")
    .plugTo(parent,"triangleBrush")
    .setFont(font)
    .setSize(130,30)
    .setPosition(10,140);
  triButton = cp5.get(Button.class,"Triangle");
  
  cp5.addButton("Arc")
    .plugTo(parent,"arcBrush")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,180);
  arcButton = cp5.get(Button.class,"Arc");
  
  cp5.addButton("Line")
    .plugTo(parent,"lineBrush")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,220);
  lnButton = cp5.get(Button.class,"Line");
  
  /* Button template
  cp5.addButton("[name]")
    .plugTo(parent,[name])
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,[]);
  [abrv] = cp5.get(Button.class,"[name]");
  */
  
  cp5.addSlider("R")
    .setFont(font)
    .setSize(230,30)
    .setPosition(10,430)
    .setRange(0,255)
    .plugTo(parent,"cr")
    //.setColorForeground(16711680)
    //.setColorBackground()
    //.setColorActive(16711680)
    .setVisible(adult);
     
  cp5.addSlider("G")
    .setFont(font)
    .setSize(230,30)
    .setPosition(10,470)
    .setRange(0,255)
    .plugTo(parent,"cg")
    .setVisible(adult);
     
  cp5.addSlider("B")
    .setFont(font)
    .setSize(230,30)
    .setPosition(10,510)
    .setRange(0,255)
    .plugTo(parent,"cb")
    .setVisible(adult);
  
  cp5.addButton("Undo")
  .plugTo(parent, "undoButton")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,550);
  undoButton = cp5.get(Button.class,"Undo");
  
  cp5.addButton("Redo")
  .plugTo(parent,"redoButton")
  .setFont(font)
  .setSize(100,30)
  .setPosition(w-120,550);
  redoButton = cp5.get(Button.class,"Redo");
  
  cp5.addButton("Import")
   .setFont(font)
   .setSize(100,30)
   .setPosition(w-120,590);
  imp = cp5.get(Button.class,"Import");
  
  cp5.addButton("Clear")
    .plugTo(parent,"clearButton")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,590);
  cl = cp5.get(Button.class,"Clear");
  
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
    if(paintButton.isPressed()){
     paintButton.setValue(1.0);
     rectButton.setValue(0.0);
     elliButton.setValue(0.0);
     triButton.setValue(0.0);
     arcButton.setValue(0.0);
     lnButton.setValue(0.0);
    }
    if(rectButton.isPressed()){
     paintButton.setValue(0.0);
     rectButton.setValue(1.0);
     elliButton.setValue(0.0);
     triButton.setValue(0.0);
     arcButton.setValue(0.0);
     lnButton.setValue(0.0);
    }
    if(elliButton.isPressed()){
     paintButton.setValue(0.0);
     rectButton.setValue(0.0);
     elliButton.setValue(1.0);
     triButton.setValue(0.0);
     arcButton.setValue(0.0);
     lnButton.setValue(0.0);
    }
    if(triButton.isPressed()){
     paintButton.setValue(0.0);
     rectButton.setValue(0.0);
     elliButton.setValue(0.0);
     triButton.setValue(1.0);
     arcButton.setValue(0.0);
     lnButton.setValue(0.0);
    }
    if(arcButton.isPressed()){
     paintButton.setValue(0.0);
     rectButton.setValue(0.0);
     elliButton.setValue(0.0);
     triButton.setValue(0.0);
     arcButton.setValue(1.0);
     lnButton.setValue(0.0);
    }
    if(lnButton.isPressed()){
     paintButton.setValue(0.0);
     rectButton.setValue(0.0);
     elliButton.setValue(0.0);
     triButton.setValue(0.0);
     arcButton.setValue(0.0);
     lnButton.setValue(1.0);
    }
    
    if(undoButton.isPressed()){
      undoButton.setValue(1.0);
      redoButton.setValue(0.0);
      cl.setValue(0.0);
    }
    if(redoButton.isPressed()){
      undoButton.setValue(0.0);
      redoButton.setValue(1.0);
      cl.setValue(0.0);
    }
    if(cl.isPressed()){
      undoButton.setValue(0.0);
      redoButton.setValue(0.0);
      cl.setValue(1.0);
    }
  }
}
