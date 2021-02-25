import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CommandInvoker{

    
    private List<Command> commandList;
    
    public CommandInvoker(){
      commandList = new ArrayList<Command>();
    }
    
    public CommandInvoker(List<Command> lx){
      commandList = lx;
    }
    
    public void addCommand(Command c){
      commandList.add(c);
    }
    
    
    public void executeCommand(){
      for(Command c: commandList){
        c.execute();
      }
    }
    
    public void undoCommand(){
      if(commandList.isEmpty()){
        System.out.println("Nothing was done before. So the execution list is empty :)");
      }
      else{
        Collections.reverse(commandList);
        for(Command c: commandList){
          c.undo();
        }
      }
    }
}  
