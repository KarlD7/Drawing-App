/**
* Class for handling setting the text input.
* When the user wants to draw text, this class function setText() must first be called to set the text.
* Text shapes' text data can be changed later with the Transformation changeText().
*/

class TextSetter{
 
  private String text = "Sample text";
  private int size = 11;
  
  public TextSetter(){
  }
  
  public void setText(String text){
    this.text = text;
  }
  
  public String getText(){
   return text; 
  }
  
  public void setSize(int s){
   this.size = s; 
  }
  
  public int getSize(){
    return size; 
  }  
  
}
