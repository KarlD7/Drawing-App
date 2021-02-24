/**
* Displays the current coordinates of the cursor in the bottom-left corner
*/

class CoordinateDisplay{
  
  private int x;
  private int y;
  
  String info;
 
  public CoordinateDisplay(){
    this.x = mouseX;
    this.y = mouseY;
  }
  
  //Constantly called by the draw() function
  public void display(){
    x = mouseX;
    y = mouseY;
    drawnCanvas = loadImage("drawnCanvas.tif");
    background(drawnCanvas);
    info = ("X: " + x + " Y: " + y);
    textSize(11);
    int tempFill = g.fillColor;
    fill(0);
    text(info, 5, 525);
    fill(tempFill);
  }
  
  //Clears the coordinate display so that when the frame is saved the coordinate display is not on the canvas
  public void cleanDisplay(){
    int tempFill = g.fillColor;
    int tempStroke = g.strokeColor;
    fill(255);
    stroke(255);
    rect(4, 525, 100, 12);
    fill(tempFill);
    stroke(tempStroke);
  }
  
}
