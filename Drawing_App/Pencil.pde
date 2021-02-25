/**
* Freehand drawing tool
*
* Pencil strokes are not considered shapes
*/

class Pencil{
  private boolean start = true;
  
  private int tempCol;
  private float tempWeight;

  public Pencil(){
    try{
      drawnCanvas = loadImage("drawnCanvas.tif");
      coords.cleanDisplay();
      background(drawnCanvas);
    }
    catch(Exception e){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
    }
  }
  
  public void paint(){
    if(start){
      if(mousePressed){
        cleared = false;
        coords.cleanDisplay();
        saveFrame("undoCanvas");
        start = false;
      }
    }
    if(mousePressed){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      line(mouseX, mouseY, pmouseX, pmouseY);
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
    }
    if(!start && !mousePressed){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
    }
  }
  
  public void eraser(){
    if(start){
      if(mousePressed){
        cleared = false;
        coords.cleanDisplay();
        saveFrame("undoCanvas");
        tempCol = g.strokeColor;
        tempWeight = g.strokeWeight;
        start = false;
      }
    }
    if(mousePressed){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      drawnCanvas = loadImage("drawnCanvas.tif");
      background(drawnCanvas);
      stroke(255);
      strokeWeight(tempWeight+7);
      line(mouseX, mouseY, pmouseX, pmouseY);
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
    }
    if(!start && !mousePressed){
      coords.cleanDisplay();
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
      stroke(tempCol);
      strokeWeight(tempWeight);
    }
  }
}
