/**
* Changes current stroke weight
*/

public class WeightCommand implements Command{
  
  private int newWeight = 1;
  private int prevWeight;
 
  public WeightCommand(int w){
    this.prevWeight = newWeight;
    this.newWeight = w;
  }
  
  @Override
  public void execute(){
    strokeWeight(newWeight);
  }
  
  @Override
  public void undo(){
    strokeWeight(prevWeight);
  }
  
}
