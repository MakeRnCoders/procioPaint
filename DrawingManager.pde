class DrawingManager {
  final int windowWidth, windowHeight, paperWidth, paperHeight;
  boolean isDrawing;
  Point firstPoint, secondPoint;
  ButtonsController bController;
  color[] savedPaperState;
  
  DrawingManager(int wW, int wH) {
    this.windowWidth = wW;
    this.windowHeight = wH;
    this.isDrawing = false;
    this.firstPoint = new Point(-1,-1);
    this.secondPoint = new Point(-1,-1);
    this.bController = new ButtonsController();
    this.paperWidth = this.windowWidth - this.bController.paintedButtonsAreaWidth;
    this.paperHeight = this.windowHeight;
    this.savedPaperState = new color[wW*wH];
  }
  
  void init() {
    this.bController.init();
  }
  
  void checkStatus() {
    if (mousePressed) {
      delay(100);
      if (this.onPaper()) {
        // if the user is not drawing something yet
        if (!this.isDrawing) { // first click
          // init secondPoint
          this.secondPoint.x = -1;
          this.secondPoint.y = -1;
          this.isDrawing = true;
          // set firstPoint
          this.firstPoint.x = mouseX;
          this.firstPoint.y = mouseY;
          // store the actual state of the paper
          loadPixels();
          arrayCopy(pixels, this.savedPaperState);
          this.drawShape(); // check if this can be removed
        }
        else { // second click (finalize shape)
          this.secondPoint.x = mouseX;
          this.secondPoint.y = mouseY;
          this.isDrawing = false;
          this.drawShape();
          // store actual paper's state
          loadPixels();
          arrayCopy(pixels, savedPaperState);
        }
      }
      // change the drawing tool
      else bController.checkMouseOver();
    }
    // actually draw using that tool
    else if (this.onPaper()) {
      if (this.isDrawing) {
        this.drawShape();
      }
    }
  }
  
  boolean onPaper() {
    boolean result = (mouseX < this.windowWidth && mouseX > this.bController.paintedButtonsAreaWidth && mouseY < this.windowHeight && mouseY > 0);
    return (result);
  }
  
  void drawShape() {
    
    // clean the paper
    // paint the paper in white
    fill(255);
    rect(this.bController.paintedButtonsAreaWidth, 0, this.paperWidth, this.paperHeight);
    
    // put back what was drawn before
    arrayCopy(savedPaperState, pixels);
    updatePixels();
    
    // draw
    delay(50);
    switch (this.bController.pressedButton) {
      case(0) :
        fill(0);
        rect(this.firstPoint.x, this.firstPoint.y, mouseX - this.firstPoint.x, mouseY - this.firstPoint.y);
        break;
      case(1) :
        fill(0);
        // This is a different version of the ellipse drawing: it keeps the center fixed
//        ellipse(this.firstPoint.x, this.firstPoint.y, (mouseX - this.firstPoint.x)*2, (mouseY - this.firstPoint.y)*2);
//        this.bController.init(); // in case the user draws a too wide ellipse from (left to right; the ellipse grows in both directions!)
        ellipse(this.firstPoint.x + (mouseX - this.firstPoint.x)/2, this.firstPoint.y + (mouseY - this.firstPoint.y)/2, 
                (mouseX - this.firstPoint.x), (mouseY - this.firstPoint.y));
        break;
      case(2) :
        stroke(0);
        line(this.firstPoint.x, this.firstPoint.y, mouseX, mouseY);
        noStroke();
        break;
    }
  }  
}
