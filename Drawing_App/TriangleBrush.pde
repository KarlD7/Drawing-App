class TriangleBrush extends ShapeBrush{
  
  private int wd;
  private int ht;
  
  private int v3X;
  private int v3Y;
  
  public TriangleBrush(){
    super();
  }
 
  public void paint(){
    if(start){
      if(mousePressed){
        noFill();
        cleared = false;
        coords.cleanDisplay();
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
        int cx = startX;
        int cy = startY + (ht/2);
        println( cx, cy );
        Shape t = new Shape(cx, cy, wd, ht, "triangle");
        shapes.addShape(t);
        coords.cleanDisplay();
        saveFrame("drawnCanvas");
        start = true;
        lastAction = "draw";
    }
  }
  
  public void paintNumerically(int x, int y, int wd, int ht){
    
  }
  
  public void paintOneClick(){
    
  }
  
}
