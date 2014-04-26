ButtonsController bController = new ButtonsController();

void setup() {
  size(800,800);
  background(255);
  bController.init();
}

void draw() {
  // change the drawing tool
  if (mousePressed) {
    delay(100);
    bController.checkMouseOver();
  }
  // actually draw using that tool
}
