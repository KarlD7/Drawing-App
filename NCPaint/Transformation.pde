/**
* Transformations use the index of shapes rather than the shapes themselves. Use the ShapeList getShapeIndex(Shape s) function to get the index of a shape.
*/

//Need to make transformations work on arrays of shapes rather than just one.
class Transformation{
  
  public Transformation(){
  }
  
  /**
  * i: index of shape
  * angle: angle to rotate the shape, in degrees. Positive is clockwise/ negative is counter-clockwise
  *
  * Note that this rotates a shape TO a specified angle, NOT by a specified angle i.e. If you want to rotate an object by 45 degrees, and then 45 more degrees, the second call to this function would have to be angle = 90.
  */
  //Need to add condition for lines and images and curves
  public void rotateShape(int i, int angle){
  //  coords.cleanDisplay();
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
        else if (temp.type.equals("ellipse") || temp.type.equals("image") || temp.type.equals("text") || temp.type.equals("line") || temp.type.equals("arc") || temp.type.equals("triangle")){
          temp.redrawShapeAtOrigin();
          shapes.addShape(temp);
        }
        //Putting the canvas back to where it was
        rotate(radians(angle*-1));
        translate(temp.x*-1,temp.y*-1);
     //   coords.cleanDisplay();
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
  //  coords.cleanDisplay();
    saveFrame("undoCanvas");
    Shape temp = shapes.getShape(i);
    if(temp != null){
     lastRemoved = temp.duplicateShape();
     shapes.removeShape(i);
     if(temp.wd + wd < 0 || temp.ht + ht < 0) return;
     temp.wd += wd;
     temp.ht += ht;
     temp.redrawShape();
     if(temp.type.equals("image")) temp.redrawImage();
     shapes.addShape(temp);
  //   coords.cleanDisplay();
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
   // coords.cleanDisplay();
    saveFrame("undoCanvas");
    Shape temp = shapes.getShape(i);
    if(temp != null && temp.type.equals("text")){
      lastRemoved = temp.duplicateShape();
      shapes.removeShape(i);
      Shape t = new Shape(temp.x, temp.y, size, temp.type, temp.text);
      shapes.addShape(t);
   //   coords.cleanDisplay();
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
  //  coords.cleanDisplay();
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
          if(temp.type.equals("line")){
            temp.x += xPix;
            temp.y += yPix;
            temp.wd += xPix;
            temp.ht += yPix;
          }
          else{
            if(temp.type.equals("image")){
             temp.eraseImage(); 
            }
            temp.x += xPix;
            temp.y += yPix;
          }
          if(temp.type.equals("image")){
            temp.redrawImage();
          }
     //     coords.cleanDisplay();
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
  //  coords.cleanDisplay();
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        temp.setColor(rgb);
      }
    }
   // coords.cleanDisplay();
    saveFrame("drawnCanvas");
    lastAction = "transformation";
  }
  
  /**
  * Changes the fill color of shapes. For text use changeColor(...)
  */
  public void changeFillColor(int i, int[] rgb){
  //  coords.cleanDisplay();
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        temp.setFillColor(rgb);
      }
    }
  //  coords.cleanDisplay();
    saveFrame("drawnCanvas");
    lastAction = "transformation";
  }
  
  /**
  * Clears the fill color of a shape, making it noFill
  */
  public void clearFill(int i){
//    coords.cleanDisplay();
   saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        temp.clearFillColor();
      }
    }
 //   coords.cleanDisplay();
    saveFrame("drawnCanvas");
    lastAction = "transformation";
  }
  
  /**
  * Changes the text of a text shape
  */
  public void changeText(int i, String text){
 //   coords.cleanDisplay();
   saveFrame("undoCanvas");
   if(i < shapes.getSize() && i >= 0){
    Shape temp = shapes.getShape(i);
    if(temp != null){
      lastRemoved = temp.duplicateShape();
      shapes.removeShape(i);
  //    coords.cleanDisplay();
      saveFrame("drawnCanvas");
      Shape t = new Shape(temp.x, temp.y, temp.size, temp.type, text);
      shapes.addShape(t);
      lastAction = "transformation";
    }
   }
  }
}
