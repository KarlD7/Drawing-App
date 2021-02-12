class Pencil{
  private boolean start = true;

  public Pencil(){
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
    if(mousePressed){
      line(mouseX, mouseY, pmouseX, pmouseY);
      start = false;
    }
    if(!start && !mousePressed){
      saveFrame("drawncanvas");
      start = true;
    }
  }
}
