class Rectangle extends Shape{
 /* private int startX;
  private int startY;
  private int endX;
  private int endY;
  private boolean start = true;
  private boolean drawing = true;*/
  
  public Rectangle(){
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
        rect(startX,startY,mouseX-startX,mouseY-startY);
        endX = mouseX;
        endY = mouseY;
    }
    if(!start && !mousePressed){
      saveFrame("drawnCanvas");
      start = true;
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
      rect(x-wd/2,y-ht/2,wd,ht);  //First two parameters default to upper-left corner coordinates, this changes it to the center.
      saveFrame("drawnCanvas");
      drawing = false;
    }
  }
}
