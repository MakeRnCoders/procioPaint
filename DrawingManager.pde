class DrawingManager {
  final int windowWidth, windowHeight, paperWidth, paperHeight;
  boolean isDrawing;
  Point firstPoint, secondPoint;
  ButtonsController bController;
  
  DrawingManager(int wW, int wH) {
    this.windowWidth = wW;
    this.windowHeight = wH;
    println(wW, wH);
    this.isDrawing = false;
    this.firstPoint = new Point(-1,-1);
    this.secondPoint = new Point(-1,-1);
    this.bController = new ButtonsController();
    this.paperWidth = this.windowWidth - this.bController.paintedButtonsAreaWidth;
    this.paperHeight = this.windowHeight;
  }
  
  void init() {
    this.bController.init();
  }
  
  void checkStatus() {
    if (mousePressed) {
      delay(100);
      if (this.onPaper()) {
        // if the user is not drawing something yet
        if (!this.isDrawing) {
          // init secondPoint
          this.secondPoint.x = -1;
          this.secondPoint.y = -1;
          this.isDrawing = true;
          // set firstPoint
          this.firstPoint.x = mouseX;
          this.firstPoint.y = mouseY;
          this.drawShape();
        }
        else {
          this.secondPoint.x = mouseX;
          this.secondPoint.y = mouseY;
          this.isDrawing = false;
          this.drawShape();
        }
      }
      // change the drawing tool
      else bController.checkMouseOver();
    }
    // actually draw using that tool
    else if (this.onPaper()) {
      println(mouseX, ' ', mouseY);
      if (this.isDrawing) {
        println("is drawing!");
        this.drawShape();
      }
    }
  }
  
  boolean onPaper() {
    boolean result = (mouseX < this.windowWidth && mouseX > this.bController.paintedButtonsAreaWidth && mouseY < this.windowHeight && mouseY > 0);
    if (result)
      println("on paper");
    else
      println("not on paper");
    return (result);
  }
  
  void drawShape() {
    // paint the paper in white
    fill(255);
    rect(this.bController.paintedButtonsAreaWidth, 0, this.paperWidth, this.paperHeight);
    delay(50);
    switch (this.bController.pressedButton) {
      case(0) :
        fill(0);
        rect(this.firstPoint.x, this.firstPoint.y, mouseX - this.firstPoint.x, mouseY - this.firstPoint.y);
        break;
      case(1) :
        fill(0);
        ellipse(this.firstPoint.x, this.firstPoint.y, mouseX - this.firstPoint.x, mouseY - this.firstPoint.y);
        break;
//      case(2) :
//        line(mouseX, mouseY, mouseX, mouseY);
//        break;
    }
  }
  
//  boolean isDrawing() {
//    return (this.firstPoint.x != -1 && this.firstPoint.y != -1 && this.secondPoint.x == -1 && this.secondPoint.y == -1);
//  }
}
