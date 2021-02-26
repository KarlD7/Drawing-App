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
  
  //Stroke size
  private float strokeWeight;
  private float tempWeight;
  
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
  
  //Values for arcs
  private int endX;
  private int endY;
  private int cp1X;
  private int cp1Y;
  private int cp2X;
  private int cp2Y;
  
  //If the shape is an upside-down triangle
  private boolean triUpsideDown;
  
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
    this.strokeWeight = g.strokeWeight;
    this.tempWeight = g.strokeWeight;
  }
  
  //Rotated shapes
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
    this.strokeWeight = g.strokeWeight;
    this.tempWeight = g.strokeWeight;
  }
  
  //Constructor for triangles - Gotta have a different one because triangles aren't horizontally symmetrical so it will redraw it wrong
  public Shape(int x, int y, int wd, int ht, String type, boolean upsideDown){
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
    this.strokeWeight = g.strokeWeight;
    this.tempWeight = g.strokeWeight;
    this.triUpsideDown = upsideDown;
  }
  
  //Constructor for images - For some reason the color fields need to be included here I don't know why but this is what makes it work
  public Shape(int x, int y, int wd, int ht, String type, PImage img){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = 0;
    this.type = type;
    this.img = img;
    this.col = g.strokeColor;
    this.tempCol = g.strokeColor;
    this.fillCol = g.fillColor;
    this.tempFill = g.fillColor;
    this.strokeWeight = g.strokeWeight;
    this.tempWeight = g.strokeWeight;
  }
  
  //Rotated images - This is so sloppy but we're rolling with it for now
  public Shape(int x, int y, int wd, int ht, int angle, String type, PImage img){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = angle;
    this.type = type;
    this.img = img;
    this.col = g.strokeColor;
    this.tempCol = g.strokeColor;
    this.fillCol = g.fillColor;
    this.tempFill = g.fillColor;
    this.strokeWeight = g.strokeWeight;
    this.tempWeight = g.strokeWeight;
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
  
  //Constructor for curves
  public Shape(int x, int y, int endX, int endY, int cp1X, int cp1Y, int cp2X, int cp2Y, String type){
    this.x = x;
    this.y = y;
    this.endX = endX;
    this.endY = endY;
    this.cp1X = cp1X;
    this.cp1Y = cp1Y;
    this.cp2X = cp2X;
    this.cp2Y = cp2Y;
    this.type = type;
    this.angle = 0;
    this.col = g.strokeColor;
    this.tempCol = g.strokeColor;
    this.strokeWeight = g.strokeWeight;
    this.tempWeight = g.strokeWeight;
  }
  
  //Empty shape
  public Shape(){
  }
  
  public void eraseShape(){
      int tempStroke = g.strokeColor;
      int tempFill = g.fillColor;
      stroke(255);
      fill(255);
      strokeWeight(100);
      if(type.equals("rectangle")){
        rect(x-wd/2,y-ht/2,wd,ht);
      }
      else if(type.equals("ellipse")){
        ellipse(x,y,wd,ht);
      }
      else if(type.equals("triangle")){
        triangle(x-wd,y+(ht/2),x,y-(ht/2),x+wd,y+ht/2);
      }
      else if(type.equals("image")){
        eraseImage();
      }
      else if(type.equals("text")){
        fill(255);
        rect(x, y, text.length()*(size*1.5), size*1.5);
        noFill();
      }
      else if(type.equals("line")){
        line(x,y,wd,ht);
      }
      stroke(tempStroke);
      fill(tempFill);
      strokeWeight(strokeWeight);
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
      strokeWeight(strokeWeight);
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
      else if(type.equals("triangle")){
        if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0){
          if(triUpsideDown)  triangle(x-wd,y-(ht/2),x,y+(ht/2),x+wd,y-ht/2);
          else if(!triUpsideDown)  triangle(x-wd,y+(ht/2),x,y-(ht/2),x+wd,y+ht/2);
        }
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
      else if(type.equals("arc")){
        if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0) curve(cp1X, cp1Y, x, y, endX, endY, cp2X, cp2Y);
      }
      else if(type.equals("image")){
        redrawImage();
      }
        /*if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
        }
        else if(angle == 0) image(img, x, y, wd, ht);
      }*/
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
      strokeWeight(tempWeight);

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
    else if(type.equals("triangle")){
        triangle(0-wd,0+(ht/2),0,0-(ht/2),0+wd,0+ht/2);
    }
    else if(type.equals("line")){
        line(0, 0, wd, ht); 
    }
    else if(type.equals("arc")){
        //
    }
    else if(type.equals("image")){
        image(img, 0, 0, wd, ht);
    }
    else if(type.equals("text")){
        text(text, 0, 0); 
    }
  }
  
  /**
  * Special functions for images
  */
  public void redrawImage(){
   if(type.equals("image")){
     eraseImage();
     if(angle != 0){
          translate(x,y);
          rotate(radians(angle));
          redrawShapeAtOrigin();
          rotate(radians(angle*-1));
          translate(x*-1,y*-1);
     }
     else if(angle == 0){
       //println(shapes.getSize(), shapes.last().type);
       image(img, x, y, wd, ht);
     }
   }
  }
  
  public void eraseImage(){
   if(type.equals("image")){
     int tempStroke = g.strokeColor;
     stroke(255);
     rectMode(CENTER);
     fill(255);
     if(angle == 0){
        rect(x, y, wd, ht);
     }
     else if(angle != 0){
        translate(x,y);
        rotate(radians(angle));
        redrawShapeAtOrigin();
        rotate(radians(angle*-1));
        translate(x*-1,y*-1);
     }
     noFill();
     rectMode(CORNER);
     stroke(tempStroke);
     strokeWeight(1);
   }
  }
  
  /**
  * Duplicates the selected shape
  * Useful for removing the current instance of a shape and replacing it with a new modified one
  */
  public Shape duplicateShape(){
    if(type.equals("image")){
      Shape ret = new Shape(this.x, this.y, this.wd, this.ht, this.angle, this.type, this.img);
      return ret;
    }
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
