class Button {
  int xPos;
  int yPos;
  final int bWidth  = 60;
  final int bHeight = 40;
  final char type;
  boolean pressedState;
  
  Button(int x, int y, char t) {
    this.xPos = x;
    this.yPos = y;
    this.type = t;
    this.pressedState = false;
  }
  
  void setPressedState(boolean ps) {
    this.pressedState = ps;
  }
  
  void buttonPressed() {
    this.pressedState = !this.pressedState;
    this.update();
  }
  
  boolean hasMouseOver() {
    return (mouseX > this.xPos && mouseX < (this.xPos + this.bWidth) && mouseY > this.yPos && mouseY < (this.yPos + this.bHeight));
  } 
    
  void update() {
    stroke(0);
    if (this.pressedState) {
      fill(30);
    }
    else fill(200);
    rect(this.xPos, this.yPos, this.bWidth, this.bHeight);
    // draw the white image inside the button
    fill(255);
    noStroke();
    switch (this.type) {
      case('r') :
        rect(this.xPos + this.bWidth/2 - 5, this.yPos + this.bHeight/2 - 5, 10, 10);
        break;
      case('e') :
        ellipse(this.xPos + this.bWidth/2, this.yPos + this.bHeight/2, 10, 10);
        break;
    }
  }
}
