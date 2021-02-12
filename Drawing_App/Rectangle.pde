class Rectangle{
  private int startX;
  private int startY;
  private int endX;
  private int endY;
  private boolean start = true;
  private boolean drawing = true;
  
  public Rectangle(){
    try{
      drawncanvas = loadImage("drawncanvas.tif");
      background(drawncanvas);
    }
    catch(Exception e){
    saveFrame("drawncanvas");
    drawncanvas = loadImage("drawncanvas.tif");
    background(drawncanvas);
    }
  }
  
  public void paint(){
    noFill();
    if(start == true){
      if(mousePressed){
        startX = mouseX;
        startY = mouseY;
        start = false;
      }
    }
    if(mousePressed){
      if(drawing){
        background(drawncanvas);
        rect(startX,startY,mouseX-startX,mouseY-startY);
        endX = mouseX;
        endY = mouseY;
      }
    }
    if(!start && !mousePressed){
      saveFrame("drawncanvas");
      drawing = false;
      start = true;
    }
  }
}
