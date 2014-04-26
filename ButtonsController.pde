class ButtonsController {
  Button[] buttons;
  final int bx1, by1, vshift, nbuttons, paintedButtonsAreaWidth;
  int pressedButton;
  int lastPressedButton;
  
  ButtonsController() {
    this.bx1 = 10;
    this.by1 = 20;
    this.pressedButton = -1;
    this.lastPressedButton = -1;
    Button rb = new Button(this.bx1, this.by1, 'r');             // rectangle
    this.vshift = this.by1 + rb.bHeight;
    Button eb = new Button(this.bx1, this.by1 + vshift, 'e');    // ellipse
    Button lb = new Button(this.bx1, this.by1 + 2*vshift, 'l');  // line
    // 800 is the height value i choose, but that variable is out of scope
    Button sb = new Button(this.bx1, 800 - rb.bHeight - this.by1, 's'); // save
    Button[] buttonss = {rb, eb, lb, sb};
    this.nbuttons = buttonss.length;
    this.buttons = buttonss;
    this.paintedButtonsAreaWidth = 80;
}
  
  void init() {
    paintButtonsArea();
    // draw the buttons at program launch
    for (int i=0; i<this.nbuttons; i++) {
      this.buttons[i].update();
    }
  }
  
  void checkMouseOver() {
    // find which button has been pressed
    for (int i=0; i<this.nbuttons; i++) {
      if (this.buttons[i].hasMouseOver()) {
        this.updatePressedButton(i);
        return;
      }
    }
  }
  
  void updatePressedButton(int pb) {
    // save button pressed
    if (pb == 3) {
      saveFrame("artwork-#####.png");
      println(" Artwork saved in the directory containing the sketch ;)\n");
      return;
    }
    this.pressedButton = pb;
    if (this.lastPressedButton != -1) {
      // deselect last pressed button
      this.buttons[this.lastPressedButton].buttonPressed();
    }
    // select the pressed button
    this.buttons[pb].buttonPressed();
    this.lastPressedButton = pb;
  }
    
  void paintButtonsArea() {
    fill(20);
    rect(0,0,this.paintedButtonsAreaWidth,height);
  }    
}
