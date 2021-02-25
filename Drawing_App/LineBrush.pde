class LineBrush extends ShapeBrush{
 
  public LineBrush(){
    super();
  }
  
  public void paint(){
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
      line(startX, startY, endX, endY);
    }
    if(!start && !mousePressed){
      Shape l = new Shape(startX, startY, endX, endY, "line");
      shapes.addShape(l);
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
    }
  }
  
  /**
  * x, y: Start coordinates of line
  * a, b: End coordinates of line
  */
  public void paintNumerically(int x, int y, int a, int b){
      coords.cleanDisplay();
      saveFrame("undoCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      line(x, y, a, b);
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      Shape l = new Shape(x, y, a, b, "line");
      shapes.addShape(l);
      lastAction = "draw";
  }
  
  public void paintOneClick(){
    //Does nothing
  }
  
}
