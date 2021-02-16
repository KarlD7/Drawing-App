public class ColorCommand implements Command{
 
  private int[] newColor = new int[]{0,0,0};
  
  private int[] prevColor = new int[3];
  
  private int weight;
  
  public ColorCommand(int[] rgb){
    this.prevColor = newColor;
    this.newColor = rgb;
  }
  
  @Override
  public void execute(){
    stroke(newColor[0], newColor[1], newColor[2]);
  }
  
  @Override
  public void undo(){
    stroke(prevColor[0], prevColor[1], prevColor[2]);
  }

}
