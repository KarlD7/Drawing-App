/**
* Transformations use the index of shapes rather than the shapes themselves. Use the ShapeList getShapeIndex(Shape s) function to get the index of a shape.
*/

class Transformation{
  
  public Transformation(){
  }
  
  /**
  * i: index of shape
  * angle: angle to rotate the shape, in degrees. Positive is clockwise/ negative is counter-clockwise
  *
  * Note that this rotates a shape TO a specified angle, NOT by a specified angle i.e. If you want to rotate an object by 45 degrees, and then 45 more degrees, the second call to this function would have to be angle = 90.
  */
  //Need to add condition for lines
  public void rotateShape(int i, int angle){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        lastRemoved = temp.duplicateShape();
        shapes.removeShape(i);
        temp.setAngle(angle);
        println(temp.angle);
        //Making it easier to rotate about the center of the shape, the order of the following functions is important
        translate(temp.x,temp.y);
        rotate(radians(angle));
        if(temp.type.equals("rectangle")){
          rectMode(CENTER);
          temp.redrawShapeAtOrigin();
          shapes.addShape(temp);
          rectMode(CORNER);
        }
        else if (temp.type.equals("ellipse") || temp.type.equals("image") || temp.type.equals("text") || temp.type.equals("line")){
          temp.redrawShapeAtOrigin();
          shapes.addShape(temp);
        }
        //Putting the canvas back to where it was
        rotate(radians(angle*-1));
        translate(temp.x*-1,temp.y*-1);
        saveFrame("drawnCanvas");
        lastAction = "transformation";
      }
    }
  }
  
  /**
  * i: index of shape
  * wd: amount to increase shape width by
  * ht: amount to increase shape height by
  * If trying to shrink it beyond a width/height of 0, cancels the function.
  *
  * If the shape is a line:
  * wd: amount to increase the end x-coordinate of the line by
  * ht: amount to increase the end y-coordinate of the line by
  */
  
  public void resizeShape(int i, int wd, int ht){
    saveFrame("undoCanvas");
    Shape temp = shapes.getShape(i);
    if(temp != null){
     lastRemoved = temp.duplicateShape();
     shapes.removeShape(i);
     if(temp.wd + wd < 0 || temp.ht + ht < 0) return;
     temp.wd += wd;
     temp.ht += ht;
     temp.redrawShape();
     shapes.addShape(temp);
     saveFrame("drawnCanvas");
     lastAction = "transformation";
    }
  }
  
  /**
  * i: index of text shape
  * size: new font size
  * Only works on shapes of type text
  */
  
  public void resizeShape(int i, int size){
    saveFrame("undoCanvas");
    Shape temp = shapes.getShape(i);
    if(temp != null && temp.type.equals("text")){
      lastRemoved = temp.duplicateShape();
      shapes.removeShape(i);
      Shape t = new Shape(temp.x, temp.y, size, temp.type, temp.text);
      shapes.addShape(t);
      saveFrame("drawnCanvas");
      lastAction = "transformation";
    }
  }
  
  /**
  * i: index of shape
  * xPix : amount of pixels to translate horizontally. Positive values for right, negative for left.
  * yPix: amount of pixels to translate horizontally. Positive values for down, negative for up.
  */
  public void translateShape(int i, int xPix, int yPix){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
          lastRemoved = temp.duplicateShape();
          shapes.removeShape(i);
          Shape r;
          if(temp.type.equals("line")){
            r = new Shape(temp.x+xPix, temp.y+yPix, temp.wd+xPix, temp.ht+yPix, temp.type);
          }
          else{
            r = new Shape(temp.x+xPix, temp.y+yPix, temp.wd, temp.ht, temp.type);
          }
          shapes.addShape(r);
          saveFrame("drawnCanvas");
          lastAction = "transformation";
        }
      }
    }
    
  
  /**
  * Changes the stroke color of shapes (the outline)
  * If text, changes the font color
  */
  public void changeColor(int i, int[] rgb){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        temp.setColor(rgb);
      }
    }
    saveFrame("drawnCanvas");
    lastAction = "transformation";
  }
  
  /**
  * Changes the fill color of shapes. For text use changeColor(...)
  */
  public void changeFillColor(int i, int[] rgb){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        temp.setFillColor(rgb);
      }
    }
    saveFrame("drawnCanvas");
    lastAction = "transformation";
  }
  
  /**
  * Clears the fill color of a shape, making it noFill
  */
  public void clearFill(int i){
   saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        temp.clearFillColor();
      }
    }
    saveFrame("drawnCanvas");
    lastAction = "transformation";
  }
  
  /**
  * Changes the text of a text shape
  */
  public void changeText(int i, String text){
   saveFrame("undoCanvas");
   if(i < shapes.getSize() && i >= 0){
    Shape temp = shapes.getShape(i);
    if(temp != null){
      lastRemoved = temp.duplicateShape();
      shapes.removeShape(i);
      saveFrame("drawnCanvas");
      Shape t = new Shape(temp.x, temp.y, temp.size, temp.type, text);
      shapes.addShape(t);
      lastAction = "transformation";
    }
   }
  }
    
    
  
  //The old stupid way
  /*public void translateShape(int i, int pix, String dir){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      shapes.removeShape(i);
      if(temp != null){
        if(temp.type.equals("rectangle")){
          if(dir.equals("left")){
            rect((temp.x-temp.wd/2)-pix,temp.y-temp.ht/2,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape r = new Shape(temp.x-pix,temp.y,temp.wd,temp.ht, "rectangle");
            shapes.addShape(r);
          }
          else if(dir.equals("right")){
            rect((temp.x-temp.wd/2)+pix,temp.y-temp.ht/2,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape r = new Shape(temp.x+pix,temp.y,temp.wd,temp.ht, "rectangle");
            shapes.addShape(r);
          }
          else if(dir.equals("up")){
            rect(temp.x-temp.wd/2,(temp.y-temp.ht/2)-pix,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape r = new Shape(temp.x,temp.y-pix,temp.wd,temp.ht, "rectangle");
            shapes.addShape(r);
          }
          else if(dir.equals("down")){
            rect(temp.x-temp.wd/2,(temp.y-temp.ht/2)+pix,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape r = new Shape(temp.x,temp.y+pix,temp.wd,temp.ht, "rectangle");
            shapes.addShape(r);
          }
        }
        else if(temp.type.equals("ellipse")){
          if(dir.equals("left")){
            ellipse(temp.x-pix,temp.y,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape e = new Shape(temp.x-pix,temp.y,temp.wd,temp.ht, "ellipse");
            shapes.addShape(e);
          }
          if(dir.equals("right")){
            ellipse(temp.x+pix,temp.y,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape e = new Shape(temp.x+pix,temp.y,temp.wd,temp.ht, "ellipse");
            shapes.addShape(e);
          }
          if(dir.equals("up")){
            ellipse(temp.x,temp.y-pix,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape e = new Shape(temp.x,temp.y-pix,temp.wd,temp.ht, "ellipse");
            shapes.addShape(e);
          }
          if(dir.equals("down")){
            ellipse(temp.x,temp.y+pix,temp.wd,temp.ht);
            saveFrame("drawnCanvas");
            Shape e = new Shape(temp.x,temp.y+pix,temp.wd,temp.ht, "ellipse");
            shapes.addShape(e);
          }
        }
      }
    }
  }*/
}
