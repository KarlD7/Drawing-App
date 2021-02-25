class RectangleBrush extends ShapeBrush{
  
  public RectangleBrush(){
    super();
  }
  
  public void paint(){
    if(start){
      if(mousePressed){
        noFill();
        cleared = false;
      //  coords.cleanDisplay();
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
   //   coords.cleanDisplay();
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
      rectMode(CENTER); //Changes first two parameters to center coordinates
   //   coords.cleanDisplay();
      saveFrame("undoCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      rect(x, y, wd, ht);
      Shape r = new Shape(x, y, wd, ht, "rectangle");
      shapes.addShape(r);
      rectMode(CORNER); //Back to default (Manually drawing uses this mode) - Gonna change this
      lastAction = "draw";
  }
  
  public void paintOneClick(){
    if(start){
     if(mousePressed){
       cleared = false;
      // coords.cleanDisplay();
       saveFrame("undoCanvas");
       startX = mouseX;
       startY = mouseY;
       start = false;
     }
    }
    if(!start && !mousePressed){
      rectMode(CENTER);
       Shape r = new Shape(startX, startY, 81, 50, "rectangle");
       shapes.addShape(r);
       lastAction = "draw";
       rectMode(CORNER);
       start = true;
    }
  }
}
