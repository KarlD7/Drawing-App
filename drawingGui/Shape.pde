class Shape{
  
  //Center coordinates
  int x;
  int y;
  
  //Width and height
  int wd;
  int ht;
  
  //Color
  int[] rgb;
  
  //Type of shape
  String type;
  
  public Shape(int x, int y, int wd, int ht, String type){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.type = type;
  }
  
  public void eraseShape(){
      int tempStroke = g.strokeColor;
      stroke(255);
      if(type.equals("rectangle")){
        rect(x-wd/2,y-ht/2,wd,ht);
      }
      else if(type.equals("ellipse")){
        strokeWeight(2);
        ellipse(x,y,wd,ht);
        strokeWeight(1);
      }
      stroke(tempStroke);
  }
  
  public void redrawShape(){
    strokeWeight(1);
    if(type.equals("rectangle")){
        rectMode(CENTER);
        rect(x,y,wd,ht);
        rectMode(CORNER);
    }
    else if(type.equals("ellipse")){
        ellipse(x,y,wd,ht);
    }
  }
  
  public void redrawShapeAtOrigin(){
    strokeWeight(1);
    if(type.equals("rectangle")){
        rect(0,0,wd,ht);
    }
    else if(type.equals("ellipse")){
        ellipse(0,0,wd,ht);
    }
  }
}
