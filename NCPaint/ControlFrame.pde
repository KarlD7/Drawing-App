public class ControlFrame extends PApplet {

  int w, h;
  String name;
  PApplet parent;
  ControlP5 cp5;
  PFont font;
  Boolean adult;
  
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
  PImage rotLB;
  PImage rotLP;
  PImage rotRB;
  PImage rotRP;
  
  Button paintButton;
  Button rectButton;
  Button elliButton;
  Button triButton;
  Button arcButton;
  Button lnButton;
  Button textButton;
  Button numRect;
  Button numElli;
  Button numTri;
  Button numLine;
  Button erase;
  
  Textfield textFieldArea;
  Textfield textX;
  Textfield textY;
  Textfield textW;
  Textfield textH;
  
  Button rotL;
  Button rotR;
  
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
  Button fillButton;
  Button helpButton;
  
  void reset(Button b){
   b.setValue(0.0); 
  }

  public ControlFrame(PApplet parentApplet, int wval, int hval, String nameOf,PFont fonts,Boolean isAdult,PImage shape1,PImage shape2,PImage shape3,PImage shape4,PImage shape5,PImage shape6,PImage shape7,PImage shape8,PImage shape9,PImage shape10,PImage shape11,PImage shape12,PImage shape13,PImage shape14) {
    super();   
    parent = parentApplet;
    w=wval;
    h=hval;
    name = nameOf;
    font = fonts;
    adult = isAdult;  //if this is false, hide the advanced features
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
    rotLB = shape11;
    rotLP = shape12;
    rotRB = shape13;
    rotRP = shape14;
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
  surface.setLocation(1090,10);
  
  cp5.addButton("Help")
   .setFont(font)
   .setSize(100,30)
   .setPosition(10,550)
   .setValue(0.0)
   .plugTo(parent,"helpButton");
   helpButton = cp5.get(Button.class,"Help");
  
//Section for brushes  
  cp5.addButton("Brush")
  .plugTo(parent,"drawButton")
  .setFont(font)
  .setSize(100,30)
  .setPosition(10,20);
  paintButton = cp5.get(Button.class,"Brush");
  
  cp5.addButton("Rectangle")
  .plugTo(parent,"drawButton")
  .setFont(font)
  .setSize(150,30)
  .setPosition(10,60);
  rectButton = cp5.get(Button.class,"Rectangle");
  if(!adult) rectButton.setImages(rectImg,rectImg2,rectImg2);
  
  cp5.addButton("Ellipse")
  .plugTo(parent,"drawButton")
  .setFont(font)
  .setSize(120,30)
  .setPosition(10,100);
  elliButton = cp5.get(Button.class,"Ellipse");
  if(!adult) elliButton.setImages(elliImg,elliImg2,elliImg2);
  
  cp5.addButton("Triangle")
    .plugTo(parent,"drawButton")
    .setFont(font)
    .setSize(130,30)
    .setPosition(10,140);
  triButton = cp5.get(Button.class,"Triangle");
  if(!adult) triButton.setImages(triImg,triImg2,triImg2);
  
  cp5.addButton("Arc")
    .plugTo(parent,"drawButton")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,180);
  arcButton = cp5.get(Button.class,"Arc");
  if(!adult) arcButton.setImages(arcImg,arcImg2,arcImg2);
  
  cp5.addButton("Line")
    .plugTo(parent,"drawButton")
    .setFont(font)
    .setSize(100,30)
    .setPosition(10,220);
  lnButton = cp5.get(Button.class,"Line");
  if(!adult) lnButton.setImages(lineImg,lineImg2,lineImg2);
  
  cp5.addButton("Eraser")
  .setPosition(10,260)
  .setSize(100,30)
  .setFont(font)
  .plugTo(parent,"drawButton");
  erase = cp5.get(Button.class,"Eraser");
    
  cp5.addButton("Fill Shape")
  .plugTo(parent,"drawButton")
  .setPosition(10,300)
  .setSize(150,30)
  .setFont(font)
  .setVisible(adult);
  fillButton = cp5.get(Button.class,"Fill Shape");
  
  cp5.addButton("Place Text")
  .plugTo(parent,"drawButton")
  .setFont(font)
  .setSize(150,30)
  .setPosition(220,100)
  .setVisible(adult);
  textButton = cp5.get(Button.class,"Place Text");
  
  
//Section for colors  
  cp5.addSlider("R")
    .setFont(font)
    .setSize(230,30)
    .setPosition((w/2)-115,390)
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
    .setPosition((w/2)-115,430)
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
    .setPosition((w/2)-115,470)
    .setRange(0,255)
    .plugTo(parent,"cb")
    .setColorForeground(color(70,70,255)) 
    .setColorBackground(color(0,0,255))
    .setColorActive(color(70,70,255)) 
    .setVisible(adult);
  bSlider = cp5.get(Slider.class,"B");
  
  cp5.addSlider("Brush Size")
  .setFont(font)
  .setSize(180,20)
  .setRange(1,70)
  .setPosition(220,300)
  .setVisible(adult)
  .plugTo(parent,"stk");
    
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
    .setValue(0.0)
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
  cp5.addTextfield("Enter Text Above")
  .setFont(font)
  .setSize(150,30)
  .setPosition(220,20)
  .setVisible(adult);
  textFieldArea = cp5.get(Textfield.class,"Enter Text Above");
  
  cp5.addTextfield("X")
  .setFont(font)
  .setSize(40,30)
  .setPosition(440,20)
  .setInputFilter(Controller.INTEGER)
  .setVisible(adult);
  textX = cp5.get(Textfield.class,"X");
  
  cp5.addTextfield("Y")
  .setFont(font)
  .setSize(40,30)
  .setPosition(490,20)
  .setInputFilter(Controller.INTEGER)
  .setVisible(adult);
  textY = cp5.get(Textfield.class,"Y");
  
  cp5.addTextfield("W")
  .setFont(font)
  .setSize(40,30)
  .setPosition(540,20)
  .setInputFilter(Controller.INTEGER)
  .setVisible(adult);
  textW = cp5.get(Textfield.class,"W");
  
  cp5.addTextfield("H")
  .setFont(font)
  .setSize(40,30)
  .setPosition(590,20)
  .setInputFilter(Controller.INTEGER)
  .setVisible(adult);
  textH = cp5.get(Textfield.class,"H");
  
  cp5.addButton("Draw Rectangle")
  .setPosition(440,100)
  .setSize(200,30)
  .setFont(font)
  .plugTo(parent,"drawButton")
  .setVisible(adult);
  numRect = cp5.get(Button.class,"Draw Rectangle");
  
  cp5.addButton("Draw Ellipse")
  .setPosition(440,140)
  .setSize(170,30)
  .setFont(font)
  .plugTo(parent,"drawButton")
  .setVisible(adult);
  numElli = cp5.get(Button.class,"Draw Ellipse");
  
  cp5.addButton("Draw Triangle")
  .setPosition(440,180)
  .setSize(180,30)
  .setFont(font)
  .plugTo(parent,"drawButton")
  .setVisible(adult);
  numTri = cp5.get(Button.class,"Draw Triangle");
  
  cp5.addButton("Draw Line")
  .setPosition(440,220)
  .setSize(130,30)
  .setFont(font)
  .plugTo(parent,"drawButton")
  .setVisible(adult);
  numLine = cp5.get(Button.class,"Draw Line");
  
  cp5.addButton("RotL")
  .setPosition(10,340)
  .plugTo(parent,"rot")
  .setImages(rotLB,rotLP,rotLP)
  .setSize(45,30)
  .setVisible(adult);
  rotL = cp5.get(Button.class,"RotL");
  
  cp5.addButton("RotR")
  .setPosition(70,340)
  .plugTo(parent,"rot")
  .setSize(45,30)
  .setImages(rotRB,rotRP,rotRP)
  .setVisible(adult);
  rotR = cp5.get(Button.class,"RotR");

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
  
  cp5.addButton("Load")
   .setFont(font)
   .setSize(100,30)
   .plugTo(parent,"loadButton")
   .setPosition(w-120,590);
  imp = cp5.get(Button.class,"Load");
  
  cp5.addButton("Save")
    .setFont(font)
    .setSize(100,30)
    .plugTo(parent,"saveButton")
    .setPosition(10,590);
  sv = cp5.get(Button.class,"Save");
  
  cp5.addButton("Clear")
    .plugTo(parent,"clearButton")
    .setFont(font)
    .setSize(100,30)
    .setPosition(w-120,550);
  cl = cp5.get(Button.class,"Clear");
  
  cp5.addButton("Exit")
  .setFont(font)
  .setSize(200,30)
  .setPosition((w/2)-100,h-100);
  ex = cp5.get(Button.class,"Exit");
  }
  
  public void draw(){
    setText(textFieldArea.getText()); 
    setInt('x',int(textX.getText()));
    setInt('y',int(textY.getText()));
    setInt('w',int(textW.getText()));
    setInt('h',int(textH.getText()));
    
    if(ex.isPressed()){
      exit();
    }
    if(paintButton.isPressed()){
     paintButton.setValue(0.0);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(erase);
     reset(lnButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(numElli);
     reset(numLine);
     reset(numTri);
     reset(rotL);
     reset(rotR);
    }
    if(rectButton.isPressed()){
     rectButton.setValue(0.1);
     reset(paintButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(lnButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(numElli);
     reset(numLine);
     reset(numTri);
     reset(erase);
     reset(rotL);
     reset(rotR);
    }
    if(elliButton.isPressed()){
     elliButton.setValue(0.2);
     reset(paintButton);
     reset(rectButton);
     reset(triButton);
     reset(arcButton);
     reset(lnButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(erase);
     reset(numElli);
     reset(numLine);
     reset(numTri);
     reset(rotL);
     reset(rotR);
    }
    if(triButton.isPressed()){
     triButton.setValue(0.3);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(arcButton);
     reset(lnButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(erase);
     reset(numElli);
     reset(numLine);
     reset(rotL);
     reset(rotR);
     reset(numTri);
    }
    if(arcButton.isPressed()){
     arcButton.setValue(0.4);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(lnButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(erase);
     reset(numElli);
     reset(rotL);
     reset(rotR);
     reset(numLine);
     reset(numTri);
    }
    if(lnButton.isPressed()){
     lnButton.setValue(0.5);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(rotL);
     reset(rotR);
     reset(numElli);
     reset(erase);
     reset(numLine);
     reset(numTri);
    }
    if(textButton.isPressed()){
     textButton.setValue(0.6);
     reset(undoButton);
     reset(paintButton);
     reset(erase);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(lnButton);
     reset(fillButton);
     reset(rotL);
     reset(rotR);
     reset(cl);
     reset(numRect);
     reset(numElli);
     reset(numLine);
     reset(numTri);
    }
    if(fillButton.isPressed()){
     fillButton.setValue(0.7);
     reset(undoButton);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(textButton);
     reset(lnButton);
     reset(rotL);
     reset(rotR);
     reset(cl);
     reset(numRect);
     reset(erase);
     reset(numElli);
     reset(numLine);
     reset(numTri);
    }
    if(numRect.isPressed()){
     numRect.setValue(0.8);
     reset(undoButton);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(textButton);
     reset(rotL);
     reset(rotR);
     reset(erase);
     reset(lnButton);
     reset(cl);
     reset(fillButton);
     reset(numElli);
     reset(numLine);
     reset(numTri);
    }
    if(numElli.isPressed()){
     numElli.setValue(0.9);
     reset(undoButton);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(rotL);
     reset(rotR);
     reset(triButton);
     reset(arcButton);
     reset(textButton);
     reset(lnButton);
     reset(cl);
     reset(erase);
     reset(fillButton);
     reset(numRect);
     reset(numLine);
     reset(numTri);
    }
    if(numLine.isPressed()){
     numLine.setValue(1.0);
     reset(undoButton);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(textButton);
     reset(lnButton);
     reset(cl);
     reset(fillButton);
     reset(numElli);
     reset(rotL);
     reset(rotR);
     reset(erase);
     reset(numRect);
     reset(numTri);
    }
    if(numTri.isPressed()){
     numTri.setValue(1.1);
     reset(undoButton);
     reset(paintButton);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(textButton);
     reset(lnButton);
     reset(cl);
     reset(fillButton);
     reset(numElli);
     reset(rotL);
     reset(rotR);
     reset(numRect);
     reset(erase);
     reset(numLine);
    }
    if(erase.isPressed()){
     erase.setValue(1.2);
     reset(rectButton);
     reset(elliButton);
     reset(triButton);
     reset(arcButton);
     reset(paintButton);
     reset(lnButton);
     reset(textButton);
     reset(fillButton);
     reset(undoButton);
     reset(cl);
     reset(numRect);
     reset(numElli);
     reset(numLine);
     reset(numTri);
     reset(rotL);
     reset(rotR);
    }
    
    if(bkB.isPressed()){
     bkB.setValue(0.0);
     reset(rB);
     reset(oB);
     reset(yB);
     reset(gB);
     reset(buB);
     reset(pB);
     reset(wB);
     reset(rotL);
     reset(helpButton);
     reset(rotR);
     reset(undoButton);
     reset(cl);
    }
    if(rB.isPressed()){
     rB.setValue(0.1);
     reset(bkB);
     reset(oB);
     reset(yB);
     reset(gB);
     reset(buB);
     reset(pB);
     reset(rotL);
     reset(rotR);
     reset(wB);
     reset(helpButton);
     reset(undoButton);
     reset(cl);
    }
    if(oB.isPressed()) {
    oB.setValue(0.2);
    reset(bkB);
     reset(rB);
     reset(yB);
     reset(gB);
     reset(buB);
     reset(pB);
     reset(rotL);
     reset(rotR);
     reset(wB);
     reset(undoButton);
     reset(helpButton);
     reset(cl);
    }
    if(yB.isPressed()){
      yB.setValue(0.3);
      reset(bkB);
     reset(oB);
     reset(rB);
     reset(gB);
     reset(buB);
     reset(rotL);
     reset(rotR);
     reset(pB);
     reset(helpButton);
     reset(wB);
     reset(undoButton);
     reset(cl);
    }
    if(gB.isPressed()){
      gB.setValue(0.4);
      reset(bkB);
     reset(oB);
     reset(yB);
     reset(rB);
     reset(rotL);
     reset(rotR);
     reset(buB);
     reset(pB);
     reset(wB);
     reset(helpButton);
     reset(undoButton);
     reset(cl);
    }
    if(buB.isPressed()){
      buB.setValue(0.5);
      reset(bkB);
     reset(oB);
     reset(yB);
     reset(gB);
     reset(rB);
     reset(rotL);
     reset(rotR);
     reset(helpButton);
     reset(pB);
     reset(wB);
     reset(undoButton);
     reset(cl);
    }
    if(pB.isPressed()){
      pB.setValue(0.6);
      reset(bkB);
     reset(oB);
     reset(yB);
     reset(gB);
     reset(buB);
     reset(helpButton);
     reset(rB);
     reset(rotL);
     reset(rotR);
     reset(wB);
     reset(undoButton);
     reset(cl);
    }
    if(wB.isPressed()){
      wB.setValue(0.7);
      reset(bkB);
     reset(oB);
     reset(yB);
     reset(gB);
     reset(rotL);
     reset(rotR);
     reset(helpButton);
     reset(buB);
     reset(pB);
     reset(rB);
     reset(undoButton);
     reset(cl);
    }
    
    if(rotL.isPressed()) rotL.setValue(0.1);
    if(rotR.isPressed()) rotR.setValue(0.2);
    
    if(undoButton.isPressed()){
      undoButton.setValue(1.0);
      reset(sv);
      reset(redoButton);
      reset(cl);
      reset(helpButton);
      reset(imp);
      reset(rotL);
      reset(rotR);
    }
    if(redoButton.isPressed()){
      redoButton.setValue(1.0);
      reset(undoButton);
      reset(sv);
      reset(cl);
      reset(imp);
      reset(rotL);
      reset(helpButton);
      reset(rotR);
    }
    if(cl.isPressed()){
      reset(undoButton);
      reset(imp);
      reset(sv);
      reset(helpButton);
      cl.setValue(1.0);
    }
    if(imp.isPressed()){
      reset(undoButton);
      reset(redoButton);
      reset(cl);
      reset(helpButton);
      reset(sv);
      imp.setValue(1.0);
    }
    if(sv.isPressed()){
      reset(undoButton);
      reset(redoButton);
      reset(cl);
      reset(imp);
      reset(helpButton);
      sv.setValue(1.0);
    }
    if(helpButton.isPressed()){
      helpButton.setValue(1.0);
      reset(undoButton);
      reset(redoButton);
      reset(cl);
      reset(imp);
      reset(sv);
    }
    
    if(!adult){
      textFont(font);
      if(bkB.getValue() == 0.0) fill(0,0,0);
      if(rB.getValue() == 0.1) fill(255,70,70);
      if(oB.getValue() == 0.2) fill(235,155,0);
      if(yB.getValue() == 0.3) fill(255,255,0);
      if(gB.getValue() == 0.4) fill(70,205,70);
      if(buB.getValue() == 0.5) fill(70,70,255);
      if(pB.getValue() == 0.6) fill(205,70,255);
      if(wB.getValue() == 0.7) fill(255,255,255);
      
      text("CURRENT COLOR",10,375);
    }
    
    if(adult){
     textFont(font);
     fill(rSlider.getValue(),gSlider.getValue(),bSlider.getValue()); 
     text("CURRENT COLOR",(w/2)-115,380);
    }
  }
}
