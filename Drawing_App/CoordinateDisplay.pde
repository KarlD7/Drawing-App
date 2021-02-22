class CoordinateDisplay{
  
  private int x;
  private int y;
  
  String info;
 
  public CoordinateDisplay(){
    this.x = mouseX;
    this.y = mouseY;
  }
  
  public void display(){
    x = mouseX;
    y = mouseY;
    drawnCanvas = loadImage("drawnCanvas.tif");
    background(drawnCanvas);
    info = ("X: " + x + " Y: " + y);
    textSize(12);
    int tempFill = g.fillColor;
    fill(0);
    text(info, 5, 525);
    fill(tempFill);
  }
  
  public void cleanDisplay(){
    
  }
  
}
