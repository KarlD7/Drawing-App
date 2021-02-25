class TextBrush extends ShapeBrush{
  
  private String text;
  
  private int size;
  
  public TextBrush(){
    super();
  }
  
  public void paint(){
    this.text = textSetter.getText();
    this.size = textSetter.getSize();
    if(start){
      if(mousePressed){
        println(textSetter.getText());
        cleared = false;
   //     coords.cleanDisplay();
        saveFrame("undoCanvas");
        startX = mouseX;
        startY = mouseY;
        start = false;
      }
    }
    else if(!start && !mousePressed){
      Shape t = new Shape(startX, startY, size, "text", text);
      shapes.addShape(t);
      t.redrawShape();
     // coords.cleanDisplay();
      saveFrame("drawnCanvas");
      start = true;
      lastAction = "draw";
    }
  }
 
  @Override
  public void paintNumerically(int x, int y, int wd, int ht){
    //
  }
  
  public void paintOneClick(){
    //Does nothing
  }
  
}
