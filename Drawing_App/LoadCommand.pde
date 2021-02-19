class LoadCommand implements Command{
 
  public LoadCommand(){
  }
  
  @Override
  public void execute(){
    selectInput("Select a file to import: ", "fileSelected");
  }
  
  @Override
  public void undo(){
  }
  
}
