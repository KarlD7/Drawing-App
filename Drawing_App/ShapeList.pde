/**
* Contains an ArrayList of shapes to store all shapes drawn on the canvas
*/

class ShapeList{
  
  private ArrayList<Shape> shapeList; 
  private boolean start;
  
  public ShapeList(){
    shapeList = new ArrayList<Shape>();
  }
  
  //Adds a shape to the end of the list
  public void addShape(Shape sh){
   shapeList.add(sh); 
  }
  
  //Adds a shape to the desired index of the list
  public void addShape(int i, Shape sh){
   shapeList.add(i, sh); 
   if(sh.type.equals("image")) sh.redrawImage();
  }
  
  //Adds a list of shapes to the end of the list
  public void addShapeList(ArrayList<Shape> addList){
    for(Shape sh : addList){
     shapeList.add(sh); 
    }
  }
  
  //Removes a shape from the list
  public void removeShape(Shape shape){
   for(int i = 0; i < shapeList.size(); i++){
     if(shapeList.get(i) == shape){
       Shape temp = shapeList.get(i);
       shapeList.remove(i);
       if(shape != null) temp.eraseShape();
     }
   }
  }
  
  //Removes a shape at the specified index of the list
  public void removeShape(int i){
    if(i < shapeList.size() && i >= 0){
      Shape temp = shapeList.get(i);
      shapeList.remove(i);
      if(temp != null) temp.eraseShape();
    }
  }
  
  //Sets the currently active shape by index- Useful for transformations etc
  public void setActiveShape(int i){
   activeShape = shapeList.get(i);
   activeGroup.add(shapeList.get(i));
  }
  
  //Sets the currently active shape by specific shape
  public void setActiveShape(Shape sh){
   activeShape = sh;
   activeGroup.add(activeShape);
  }
  
  //Adds a shape to the current active group by index- This is going to be the more used function
  public void selectShape(int i){
    if(i < shapeList.size()-1)  activeGroup.add(shapeList.get(i)); 
  }
  
  //Adds a shape to the current active group
  public void selectShape(Shape sh){
   activeGroup.add(sh); 
  }
  
  //Deselect a specific shape from the current active group
  public void deselectShape(Shape shape){
    for(int i = 0; i < activeGroup.size(); i++){
     if(activeGroup.get(i) == shape){
       activeGroup.remove(i);
     }
   }
  }
  
  //Deselect a shape by index from the current active group
  public void deselectShape(int i){
    if(i < activeGroup.size() && i >= 0){
      activeGroup.remove(i);
    }
  }
  
  //Deselects all selections
  public void deselect(){
   activeShape = null;
   activeGroup = new ArrayList<Shape>();
  }
  
  public int getSize(){
    return shapeList.size();
  }
  
  public Shape last(){
    if(shapeList.size() > 0) return shapeList.get(shapeList.size()-1);
    else return null;
  }
  
  public boolean shapeInList(Shape sh){
    if(getShapeIndex(sh) >= 0) return true;
    else return false;
  }
  
  public Shape getShape(int i){
    if(i < shapeList.size() && i >= 0){
      Shape returnShape = shapeList.get(i);
      return returnShape;
    }
    else return null;
  }
  
  /**
  * Returns the index storing Shape sh, or -1 if not found
  */
  public int getShapeIndex(Shape sh){
   for(int i = 0; i < shapeList.size(); i++){
    if(shapeList.get(i) == sh){
      return i;
    }
   }
   return -1;
  }
  
  public ArrayList<Shape> duplicateList(ArrayList<Shape> copy){
    ArrayList<Shape> ret = new ArrayList<Shape>();
    for(int i = 0; i < copy.size(); i++){
       Shape temp = copy.get(i).duplicateShape();
       ret.add(temp);
       temp.x += 40;
       temp.y += 10;
    }
    addShapeList(ret);
    return ret;
  }
  
  public ArrayList<Shape> getList(){
    return shapeList; 
  }
  
  public void setList(ArrayList<Shape> sh){
   shapeList = sh;
  }
  
  public void clearList(){
    shapeList = new ArrayList<Shape>(); 
  }
  
  public void redrawShapes(){
   for(Shape s : shapeList){
    s.redrawShape(); 
   }
  }
  
  public void iterateShapes(){
    for(int i = 0; i < shapeList.size(); i++){
      if(i < shapeList.size() && i >= 0){
        println(shapeList.get(i).type);
      }
    }
  }
  
}
