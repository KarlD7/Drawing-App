class Ellipse extends Shape{
  
  public Ellipse(){
    super();
  }
  
  public void paint(){
    noFill();
    if(start){
      if(mousePressed){
        saveFrame("undoCanvas");
        startX = mouseX;
        startY = mouseY;
        start = false;
      }
    }
    if(mousePressed){
        drawnCanvas = loadImage("drawnCanvas.tif");
        background(drawnCanvas);
        ellipse(startX,startY,(mouseX-startX)*2,(mouseY-startY)*2);
        endX = mouseX;
        endY = mouseY;
    }
    if(!start && !mousePressed){
      start = true;
      saveFrame("drawnCanvas");
    }
  }
  
  /**
  * x, y: Center coordinates of shape
  * wd, ht: Width and height, respectively
  */
  public void paintNumerically(int x, int y, int wd, int ht){
    if(drawing){
      saveFrame("undoCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      noFill();
      ellipse(x,y,wd,ht);
      saveFrame("drawnCanvas");
      drawing = false;
    }
  }
}
