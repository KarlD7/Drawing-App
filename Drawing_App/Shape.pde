class Shape{
  
  //Center coordinates
  int x;
  int y;
  
  //Width and height
  int wd;
  int ht;
  
  //Color
  int[] rgb;
  
  //Angle of rotation
  int angle;
  
  //Type of shape
  String type;
  
  //Stored image if the shape is an image.
  PImage img;
  
  //If it's a line then wd and ht are the (x,y) end coordinates
  public Shape(int x, int y, int wd, int ht, String type){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = 0;
    this.type = type;
  }
  
  public Shape(int x, int y, int wd, int ht, int angle, String type){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = angle;
    this.type = type;
  }
  
  public Shape(int x, int y, int wd, int ht, String type, PImage img){
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.angle = 0;
    this.type = type;
    this.img = img;
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
      stroke(tempStroke);
      strokeWeight(1);
  }
  
  public void redrawShape(){
    if(type.equals("rectangle")){
      rectMode(CENTER);
      if(angle > 0){
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
      if(angle > 0){
        translate(x,y);
        rotate(radians(angle));
        redrawShapeAtOrigin();
        rotate(radians(angle*-1));
        translate(x*-1,y*-1);
      }
      else if(angle == 0) ellipse(x,y,wd,ht);
    }
    else if(type.equals("image")){
      if(angle > 0){
        translate(x,y);
        rotate(radians(angle));
        redrawShapeAtOrigin();
        rotate(radians(angle*-1));
        translate(x*-1,y*-1);
      }
      else if(angle == 0) image(img, x, y, wd, ht);
    }
  }
  
  public void redrawShapeAtOrigin(){
    if(type.equals("rectangle")){
        rect(0,0,wd,ht);
    }
    else if(type.equals("ellipse")){
        ellipse(0,0,wd,ht);
    }
    else if(type.equals("image")){
        image(img, 0, 0, wd, ht);
    }
  }
  
  public Shape duplicateShape(){
    Shape ret = new Shape(this.x, this.y, this.wd, this.ht, this.angle, this.type);
    return ret;
  }
  
  //This function is not for rotating, it is accessed by the rotate function.
  public void setAngle(int angle){
    this.angle = angle;
  }
}
