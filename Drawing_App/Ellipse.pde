class Ellipse extends Rectangle{
  
  public Ellipse(){
    super();
  }
  
  public void paint(){
    noFill();
    if(super.start == true){
      if(mousePressed){
        super.startX = mouseX;
        super.startY = mouseY;
        super.start = false;
      }
    }
    if(mousePressed){
      if(super.drawing){
        background(drawncanvas);
        ellipse(super.startX,super.startY,(mouseX-super.startX)*2,(mouseY-super.startY)*2);
        super.endX = mouseX;
        super.endY = mouseY;
        println(super.endX);
        println(super.endY);
      }
    }
    if(!super.start && !mousePressed){
      saveFrame("drawncanvas");
      super.drawing = false;
      super.start = true;
    }
  }
}
