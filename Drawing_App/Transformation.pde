class Transformation{
  
  public Transformation(){
  }
  
  /**
  * i: index of shape
  * angle: angle to rotate the shape, in degrees. Positive is clockwise/ negative is counter-clockwise
  */
  public void rotateShape(int i, int angle){
    saveFrame("undoCanvas");
    if(i < shapes.getSize() && i >= 0){
      Shape temp = shapes.getShape(i);
      shapes.removeShape(i);
      if(temp != null){
        //Making it easier to rotate about the center of the shape, the order of the following functions is important
        translate(temp.x,temp.y);
        rotate(radians(angle));
        if(temp.type.equals("rectangle")){
          rectMode(CENTER);
          temp.redrawShapeAtOrigin();
          shapes.addShape(i, temp);
          rectMode(CORNER);
        }
        else if (temp.type.equals("ellipse")){
          temp.redrawShapeAtOrigin();
          shapes.addShape(i, temp);
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
     temp.wd = wd;
     temp.ht = ht;
     temp.redrawShape();
     shapes.addShape(i, temp);
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
