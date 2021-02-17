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
  
  Slider rSlider;
  Slider gSlider;
  Slider bSlider;
  
  Button rB;
  Button oB;
  Button yB;
  Button gB;
  Button buB;
  Button pB;
  Button wB;
  Button bkB;
  
  Button undoButton;
  Button redoButton;
  Button ex;
  Button cl;
  Button sv;
  Button imp;
  Button exp;

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
  
  cp5.addButton("Help*")
  .setFont(font)
  .setSize(60,30)
  .setPosition(w-120,20);
  
//Section for brushes  
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
  
  
//Section for colors  
  cp5.addSlider("R")
    .setFont(font)
    .setSize(230,30)
    .setPosition(10,390)
    .setRange(0,255)
    .plugTo(parent,"cr")
    .setColorForeground(color(255,70,70))
    .setColorBackground(color(255,0,0))
    .setColorActive(color(255,70,70))
    .setVisible(adult);
  rSlider = cp5.get(Slider.class,"R");
     
  cp5.addSlider("G")
    .setFont(font)
    .setSize(230,30)
    .setPosition(10,430)
    .setRange(0,255)
    .plugTo(parent,"cg")
    .setColorForeground(color(70,205,70))
    .setColorBackground(color(0,205,0))
    .setColorActive(color(70,205,70))
    .setVisible(adult);
  gSlider = cp5.get(Slider.class,"G");
     
  cp5.addSlider("B")
    .setFont(font)
    .setSize(230,30)
    .setPosition(10,470)
    .setRange(0,255)
    .plugTo(parent,"cb")
    .setColorForeground(color(70,70,255)) 
    .setColorBackground(color(0,0,255))
    .setColorActive(color(70,70,255)) 
    .setVisible(adult);
  bSlider = cp5.get(Slider.class,"B");
    
  cp5.addButton("Red")
    .setFont(font)
    .setSize(50,30)
    .setPosition(10,390)
    .setColorForeground(color(255,70,70))
    .setColorBackground(color(255,0,0))
    .setColorActive(color(255,70,70))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  rB = cp5.get(Button.class,"Red");
  
  cp5.addButton("Orange")
    .setFont(font)
    .setSize(90,30)
    .setPosition(75,390)
    .setColorForeground(color(235,155,0))
    .setColorBackground(color(255,155,0))
    .setColorActive(color(235,155,0))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  oB = cp5.get(Button.class,"Orange");
    
  cp5.addButton("Yellow")
    .setFont(font)
    .setSize(90,30)
    .setPosition(180,390)
    .setColorForeground(color(255,255,0))
    .setColorBackground(color(200,200,0))
    .setColorActive(color(255,255,0))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  yB = cp5.get(Button.class,"Yellow");
    
  cp5.addButton("Green")
    .setFont(font)
    .setSize(80,30)
    .setPosition(10,430)
    .setColorForeground(color(70,205,70))
    .setColorBackground(color(0,205,0))
    .setColorActive(color(70,205,70))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  gB = cp5.get(Button.class, "Green");
    
  cp5.addButton("Blue")
    .setFont(font)
    .setSize(60,30)
    .setPosition(105,430)
    .setColorForeground(color(70,70,255)) 
    .setColorBackground(color(0,0,255))
    .setColorActive(color(70,70,255)) 
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  buB = cp5.get(Button.class,"Blue");
    
  cp5.addButton("Purple")
    .setFont(font)
    .setSize(80,30)
    .setPosition(180,430)
    .setColorForeground(color(205,70,255))
    .setColorBackground(color(205,0,255))
    .setColorActive(color(205,70,255))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  pB = cp5.get(Button.class,"Purple");
    
  cp5.addButton("Black")
    .setFont(font)
    .setSize(70,30)
    .setPosition(10,470)
    .setColorForeground(color(70,70,70))
    .setColorBackground(color(0,0,0))
    .setColorActive(color(70,70,70))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  bkB = cp5.get(Button.class,"Black");
    
  cp5.addButton("White")
    .setFont(font)
    .setSize(70,30)
    .setPosition(95,470)
    .setColorForeground(color(190,190,190))
    .setColorBackground(color(200,200,200))
    .setColorActive(color(190,190,190))
    .plugTo(parent,"colorButton")
    .setVisible(!adult);
  wB = cp5.get(Button.class,"White");
  
    
    
//Section for other buttons  
  cp5.addButton("Undo")
  .plugTo(parent, "undoButton")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,510);
  undoButton = cp5.get(Button.class,"Undo");
  
  cp5.addButton("Redo")
  .plugTo(parent,"redoButton")
  .setFont(font)
  .setSize(100,30)
  .setPosition(w-120,510);
  redoButton = cp5.get(Button.class,"Redo");
  
  cp5.addButton("Import*")
   .setFont(font)
   .setSize(100,30)
   .setPosition(w-120,590);
  imp = cp5.get(Button.class,"Import*");
  
  cp5.addButton("Export*")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,590);
  exp = cp5.get(Button.class,"Export*");
  
  cp5.addButton("Save*")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,550);
  sv = cp5.get(Button.class,"Save*");
  
  cp5.addButton("Clear")
    .plugTo(parent,"clearButton")
    .setFont(font)
    .setSize(100,30)
    .setPosition(w-120,550);
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
    
    if(bkB.isPressed()) bkB.setValue(0.0);
    if(rB.isPressed()) rB.setValue(0.1);
    if(oB.isPressed()) oB.setValue(0.2);
    if(yB.isPressed()) yB.setValue(0.3);
    if(gB.isPressed()) gB.setValue(0.4);
    if(buB.isPressed()) buB.setValue(0.5);
    if(pB.isPressed()) pB.setValue(0.6);
    if(wB.isPressed()) wB.setValue(0.7);
    
    
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
    
    
    if(adult){
     textFont(font);
     fill(rSlider.getValue(),gSlider.getValue(),bSlider.getValue()); 
     text("CURRENT COLOR",10,380);
    }
  }
}
