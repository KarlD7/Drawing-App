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
  //Need to add conditions for lines
  public void rotateShape(int i, int angle){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      if(temp != null){
        shapes.removeShape(i);
        lastRemoved = temp.duplicateShape();
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
        else if (temp.type.equals("ellipse") || temp.type.equals("image")){
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
  
  public void resizeShape(int i, int wd, int ht){
    saveFrame("undoCanvas");
    Shape temp = shapes.getShape(i);
    shapes.removeShape(i);
    if(temp != null){
     println("debug");
     temp.wd = wd;
     temp.ht = ht;
     temp.redrawShape();
     shapes.addShape(temp);
     saveFrame("drawnCanvas");
     lastAction = "transformation";
    }
  }
  
  /**
  * i: index of shape
  * pix : amount of pixels to translate
  * dir: direction to translate (left, right, up, down)
  * example: translateShape(0, 200, "left")
  * 
  * //I am going to make this simpler soon, so you won't have to specify direction and will act more like rotateShape().
  * 
  */
  public void translateShape(int i, int pix, String dir){
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
  }
}
