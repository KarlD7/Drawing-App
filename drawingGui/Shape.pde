/**
* Data structure containing all of a shape's information
*/

class Shape{
  
  //Center coordinates, or start coordinates for lines
  private int x;
  private int y;
  
  //Width and height, or end coordinates for lines
  private int wd;
  private int ht;
  
  //Stroke Color
  private int[] rgb;
  //Redraw color
  private int col;
  //Undo color
  private int tempCol;
  
  //Fill Color
  private int[] rgbFill;
  //Redraw fill color
  private int fillCol;
  //Undo fill color
  private int tempFill;
  //If fill should be empty
  private boolean noFill = true;
  
  //Angle of rotation
  private int angle;
  
  //Type of shape
  private String type;
  
  //Stored image, if the shape is an image.
  private PImage img;
  
  //Stored text and font size, if the shape is text.
  private String text = textSetter.getText();
  private int size = textSetter.getSize();
  
  
  public Shape(int x, int y, int wd, int ht, String type){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = 0;
    this.type = type;
    this.col = g.strokeColor;
    this.tempCol = g.strokeColor;
    this.fillCol = g.fillColor;
    this.tempFill = g.fillColor;
  }
  
  public Shape(int x, int y, int wd, int ht, int angle, String type){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = angle;
    this.type = type;
    this.col = g.strokeColor;
    this.tempCol = g.strokeColor;
    this.fillCol = g.fillColor;
    this.tempFill = g.fillColor;
  }
  
  //Constructor for images
  public Shape(int x, int y, int wd, int ht, String type, PImage img){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = 0;
    this.type = type;
    this.img = img;
  }
  
  //Constructor for text
  public Shape(int x, int y, int size, String type, String text){
    this.x = x;
    this.y = y;
    this.size = size;
    this.type = type;
    this.text = text;
    this.angle = 0;
    this.col = g.strokeColor;
    this.tempCol = g.strokeColor;
  }
  
  //Empty shape
  public Shape(){
  }
  
  public void eraseShape(){
      int tempStroke = g.strokeColor;
      stroke(255);
      strokeWeight(3);
      if(type.equals("rectangle")){
        rect(x-wd/2,y-ht/2,wd,ht);
      }
      else if(type.equals("ellipse")){
        ellipse(x,y,wd,ht);
      }
      else if(type.equals("image")){
        rectMode(CENTER);
        fill(255);
        rect(x, y, wd, ht);
        noFill();
        rectMode(CORNER);
      }
      else if(type.equals("text")){
        fill(255);
        rect(x, y, text.length()*(size*1.5), size*1.5);
        noFill();
      }
      stroke(tempStroke);
      strokeWeight(1);
  }
  
  public void redrawShape(){
    if(noFill){
     noFill(); 
    }
    else{
      if(!type.equals("text")){
        fill(fillCol);
      }
    }
      stroke(col);
      if(type.equals("rectangle")){
        rectMode(CENTER);
        if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0) rect(x,y,wd,ht);
        rectMode(CORNER);
      }
      else if(type.equals("ellipse")){
        if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0) ellipse(x,y,wd,ht);
      }
      else if(type.equals("line")){
         if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0) line(x,y,wd,ht);
      }
      else if(type.equals("image")){
        if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0) image(img, x, y, wd, ht);
      }
      //Text shapes use fill for font color
      else if(type.equals("text")){
        fill(col);
        textSize(size);
        if(angle != 0 ){
          textAlign(CENTER);
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
          textAlign(LEFT,TOP);
        }
        else if(angle == 0) text(text, x, y);
        fill(tempCol);
      }
      
      stroke(tempCol);

      if(!type.equals("text")){
        fill(tempFill);
      }
  }
  
  /**
  * Redraws the shape at the current origin (0,0)
  * Used by rotated shapes
  */
  public void redrawShapeAtOrigin(){
    if(type.equals("rectangle")){
        rect(0,0,wd,ht);
    }
    else if(type.equals("ellipse")){
        ellipse(0,0,wd,ht);
    }
    else if(type.equals("line")){
        line(0, 0, wd, ht); 
    }
    else if(type.equals("image")){
        image(img, 0, 0, wd, ht);
    }
    else if(type.equals("text")){
        text(text, 0, 0); 
    }
  }
  
  /**
  * Duplicates the selected shape
  * Useful for removing the current instance of a shape and replacing it with a new modified one
  */
  public Shape duplicateShape(){
    Shape ret = new Shape(this.x, this.y, this.wd, this.ht, this.angle, this.type);
    return ret;
  }
  
  //This function is not for rotating, it is accessed by the rotate function in Transformations.
  public void setAngle(int angle){
    this.angle = angle;
  }
  
  /**
  * Changes the stored text of a text shape
  */
  public void setText(String t){
    this.text = t;
  }
  
  //Used by changeColor function in Transformations
  public void setColor(int[] rgb){
   this.rgb = rgb; 
   tempCol = g.strokeColor;
   stroke(rgb[0], rgb[1], rgb[2]);
   col = g.strokeColor;
  }
  
  public int[] getColor(){
   return rgb; 
  }
  
  /**
  * Sets the fill color for shapes
  * For text shapes use setColor()
  */
  public void setFillColor(int[] rgbFill){
    this.rgbFill = rgbFill;
    tempFill = g.fillColor;
    fill(rgbFill[0], rgbFill[1], rgbFill[2]);
    fillCol = g.fillColor;
    noFill = false;
  }
  
  public int[] getFillColor(){
    return rgbFill;
  }
  
  /**
  * Clears the fill for this shape and changes it to noFill
  */
  public void clearFillColor(){
    tempFill = g.fillColor;
    noFill = true;
    eraseShape();
  }
  
  
}
