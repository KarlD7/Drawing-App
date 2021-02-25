/**
* Changes current stroke weight
*/

public class WeightCommand implements Command{
  
  private float newWeight = 1;
  private float prevWeight;
 
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
