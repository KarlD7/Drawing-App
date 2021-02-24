/**
* Abstract class all shape brush tools inherit from
*/

abstract class ShapeBrush{
  public boolean start = true;
  public boolean drawing = true;
  public int startX;
  public int startY;
  public int endX;
  public int endY;
  
  public abstract void paint();
  public abstract void paintNumerically(int x, int y, int wd, int ht);
  public abstract void paintOneClick();
}
