class EllipseBrush extends ShapeBrush{
  
  public EllipseBrush(){
    super();
  }
  
  public void paint(){
    noFill();
    if(start){
      if(mousePressed){
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
        ellipse(startX,startY,(endX-startX)*2,(endY-startY)*2);
    }
    if(!start && !mousePressed){
      int wd = (endX-startX)*2;
      int ht = (endY-startY)*2;
      Shape e = new Shape(startX, startY, wd, ht, "ellipse");
      shapes.addShape(e);
      coords.cleanDisplay();
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
      coords.cleanDisplay();
      saveFrame("undoCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      noFill();
      ellipse(x,y,wd,ht);
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      Shape e = new Shape(x,y,wd,ht, "ellipse");
      shapes.addShape(e);
      drawing = false;
      lastAction = "draw";
    }
  }
  
  public void paintOneClick(){
    noFill();
    if(start){
     if(mousePressed){
       cleared = false;
       coords.cleanDisplay();
       saveFrame("undoCanvas");
       startX = mouseX;
       startY = mouseY;
       start = false;
     }
    }
    if(!start && !mousePressed){
       Shape r = new Shape(startX, startY, 75, 75, "ellipse");
       shapes.addShape(r);
       lastAction = "draw";
       start = true;
    }
  }
  
}
