class ShapeList{
  
  private ArrayList<Shape> shapeList; 
  private boolean start;
  
  public ShapeList(){
    shapeList = new ArrayList<Shape>();
  }
  
  public void addShape(Shape shape){
   shapeList.add(shape); 
  }
  
  public void addShape(int i, Shape shape){
   shapeList.add(i, shape); 
  }
  
  public void removeShape(int i){
    if(i < shapeList.size() && i >= 0){
      Shape temp = shapeList.get(i);
      shapeList.remove(i);
      if(temp != null) temp.eraseShape();
      /*int tempStroke = g.strokeColor;
      stroke(g.backgroundColor);
      if(temp.type.equals("rectangle")){
        rect(temp.x+temp.wd/2,temp.y+temp.ht/2,temp.wd,temp.ht);
      }
      else if(temp.type.equals("ellipse")){
        ellipse(temp.x,temp.y,temp.wd,temp.ht);
      }
      stroke(tempStroke);
      saveFrame("drawnCanvas");*/
    }
  }
  
  public int getSize(){
    return shapeList.size();
  }
  
  public Shape getShape(int i){
    if(i < shapeList.size() && i >= 0){
      Shape returnShape = shapeList.get(i);
      return returnShape;
    }
    else return null;
  }
  
  public ArrayList<Shape> getList(){
    return shapeList; 
  }
  
  public void setList(ArrayList<Shape> s){
   shapeList = s;
  }
  
  public void clearList(){
    shapeList = new ArrayList<Shape>(); 
  }
  
  public void iterateShapes(){
    for(int i = 0; i < shapeList.size(); i++){
      if(i < shapeList.size() && i >= 0){
        println(shapeList.get(i).type);
      }
    }
  }
  
  
}
