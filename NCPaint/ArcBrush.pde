class ArcBrush extends ShapeBrush{

  //Coordinates for control points
  private int cp1X;
  private int cp1Y;
  private int cp2X;
  private int cp2Y;
  
  private Shape tempLine;
  
  public ArcBrush(){
   super(); 
  }
  
  public void paint(){
    if(start && !curve){
      if(mousePressed){
        cleared = false;
        //coords.cleanDisplay();
        saveFrame("undoCanvas");
        startX = mouseX;
        startY = mouseY;
        start = false;
      }
    }
    if(mousePressed && !curve){
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      endX = mouseX;
      endY = mouseY;
      line(startX, startY, endX, endY);
    }
    if(!start && !mousePressed && !curve){
      tempLine = new Shape(startX, startY, endX, endY, "line");
      shapes.addShape(tempLine);
      //line(startX, startY, endX, endY);
      //coords.cleanDisplay();
      saveFrame("drawnCanvas");
      curve = true;
      start = true;
    }
      if(curve){
        if(mousePressed){
          shapes.removeShape(tempLine);
          arcX = mouseX;
          arcY = mouseY;
          drawnCanvas = loadImage("drawnCanvas.tif");
          background(drawnCanvas);
          if(arcX > startX){
            cp1X = startX - abs(arcX - startX)*2;
          }
          else{
            cp1X = startX + abs(arcX - startX)*2;
          }
          if(arcY > startY){
            cp1Y = startY - abs(arcY - startY)*2;
          }
          else{
            cp1Y = startY + abs(arcY - startY)*2;
          }
          if(arcX > endX){
            cp2X = endX - abs(arcX - endX)*2;
          }
          else{
            cp2X = endX + abs(arcX - endX)*2;
          }
          if(arcY > endY){
            cp2Y = endY - abs(arcY - startY)*2;
          }
          else{
            cp2Y = endY + abs(arcY - startY)*2;
          }
          curve(cp1X, cp1Y, startX, startY, endX, endY, cp2X, cp2Y);
          start = false;
        }
      }
      if(!start && !mousePressed){
        float currWeight = g.strokeWeight;
        float tempWeight = currWeight + 7;
        curve = false;
        int tempStroke = g.strokeColor;
        stroke(255);
        strokeWeight(tempWeight);
        line(startX, startY, endX, endY);
        stroke(tempStroke);
        strokeWeight(currWeight);
        curve(cp1X, cp1Y, startX, startY, endX, endY, cp2X, cp2Y);
        Shape a = new Shape(startX, startY, endX, endY, cp1X, cp1Y, cp2X, cp2Y, "arc");
        shapes.addShape(a);
        //coords.cleanDisplay();
        saveFrame("drawnCanvas");
        start = true;
        lastAction = "draw";
      }
  }
  
  public void paintNumerically(int x, int y, int ht, int wd){
    //
  }
  
  public void paintOneClick(){
   //Does nothing 
  }

}
