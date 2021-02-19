class SaveCommand implements Command{
 
  public SaveCommand(){
  }
  
  @Override
  public void execute(){
    selectOutput("Select a folder to save to: ", "folderSelected");
  }
  
  //Does nothing, we don't want to undo the exporting of a file.
  @Override
  public void undo(){
  }
  
}
