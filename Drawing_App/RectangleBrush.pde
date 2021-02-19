class RectangleBrush extends ShapeBrush{
 /* private int startX;
  private int startY;
  private int endX;
  private int endY;
  private boolean start = true;
  private boolean drawing = true;*/
  
  public RectangleBrush(){
    super();
  }
  
  public void paint(){
    noFill();
    if(start){
      if(mousePressed){
        cleared = false;
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
        rect(startX,startY,endX-startX,endY-startY);
    }
    if(!start && !mousePressed){
      int tempStroke = g.strokeColor;
      stroke(255);
      rect(startX,startY,endX-startX,endY-startY);
      stroke(tempStroke);
      int wd = endX - startX;
      int ht = endY - startY;
      Shape r = new Shape(startX+wd/2, startY+ht/2, wd, ht, "rectangle");
      shapes.addShape(r);
      r.redrawShape();
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
    }
  }
  
  /**
  * x, y: Center coordinates of shape
  * wd, ht: Width and height, respectively
  */
  public void paintNumerically(int x, int y, int wd, int ht){
    if(drawing){
      rectMode(CENTER); //Changes first two parameters to center coordinates
      saveFrame("undoCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      noFill();
      rect(x, y, wd, ht);
      Shape r = new Shape(x, y, wd, ht, "rectangle");
      shapes.addShape(r);
      drawing = false;
      rectMode(CORNER); //Back to default (Manually drawing uses this mode)
      lastAction = "draw";
    }
  }
}
