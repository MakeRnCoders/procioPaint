class ButtonsController {
  Button[] buttons;
  final int bx1, by1, vshift, nbuttons, paintedButtonsAreaWidth;
  int pressedButton;
  int lastPressedButton;
  
  ButtonsController() {
    this.nbuttons = 2;
    this.bx1 = 10;
    this.by1 = 10;
    this.vshift = 60;
    this.pressedButton = -1;
    this.lastPressedButton = -1;
    Button rb = new Button(this.bx1, this.by1, 'r');
    Button eb = new Button(this.bx1, this.by1 + vshift, 'e');
    Button[] buttonss = {rb, eb};
    this.buttons = buttonss;
    this.paintedButtonsAreaWidth = 80;
}
  
  void init() {
    paintButtonArea();
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
    this.pressedButton = pb;
    if (this.lastPressedButton != -1) {
      this.buttons[this.lastPressedButton].buttonPressed();
    }
    this.buttons[pb].buttonPressed();
    this.lastPressedButton = pb;
  }
    
  void paintButtonArea() {
    fill(20);
    rect(0,0,this.paintedButtonsAreaWidth,height);
  }    
}
