Pencil pencil;
Rectangle rect;
Ellipse ellipse;
PImage drawncanvas;

void setup(){
 size(1250,750); 
 background(255);
 
 pencil = new Pencil();
 rect = new Rectangle();
 ellipse = new Ellipse();
}

//Currently, just comment and uncomment the methods here to test the classes.
void draw(){
  setColor(255,0,0);
  
  pencil.paint();
  
  //rect.paint();
  ellipse.paint(); 
}

void setColor(int r, int g, int b){
  stroke(r,g,b);
}
