class TriangleBrush extends ShapeBrush{
  
  //Width and Height
  private int wd;
  private int ht;
  
  //3rd point coordinates
  private int v3X;
  private int v3Y;
  
  //Center coordinates
  private int cy;
  private int cx;
  
  public TriangleBrush(){
    super();
  }
 
  public void paint(){
    if(start){
      if(mousePressed){
        noFill();
        cleared = false;
        //coords.cleanDisplay();
        saveFrame("undoCanvas");
        startX = mouseX;
        startY = mouseY;
        start = false;
      }
    }
    if(mousePressed){
        drawnCanvas = loadImage("drawnCanvas.tif");
        background(drawnCanvas);
        endX = mouseX;
        endY = mouseY;
        wd = abs(startX - endX);
        ht = abs(startY - endY);
        if(endX > startX){
          v3X = startX - wd;
        }
        else{
          v3X = startX + wd;
        }
        if(endY > startY){
          v3Y = startY + ht;
        }
        else{
          v3Y = startY - ht;
        }
        triangle(v3X, v3Y, startX, startY, endX, endY);
    }
    if(!start && !mousePressed){
        cx = startX;
        if(endY > startY){
          cy = startY + (ht/2);
        }
        else{
          cy = startY - (ht/2);
        }
        Shape t;
        if(endY > startY){
          t = new Shape(cx, cy, wd, ht, "triangle", false);
        }
        else{
          t = new Shape(cx, cy, wd, ht, "triangle", true);
        }
        shapes.addShape(t);
        //coords.cleanDisplay();
        saveFrame("drawnCanvas");
        start = true;
        lastAction = "draw";
    }
  }
  
  public void paintNumerically(int x, int y, int wd, int ht){
    //coords.cleanDisplay();
    saveFrame("undoCanvas");
    drawnCanvas = loadImage("drawnCanvas.tif");
    background(drawnCanvas);
    triangle(x-wd,y+(ht/2),x,y-(ht/2),x+wd,y+ht/2);
    Shape t = new Shape(x, y, wd, ht, "triangle");
    shapes.addShape(t);
    lastAction = "draw";
  }
  
  public void paintOneClick(){
    
  }
  
}
