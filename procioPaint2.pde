DrawingManager dManager;

void setup() {
  size(800,800);
  background(255);
  dManager = new DrawingManager(width, height);
  dManager.init();
}

void draw() {
  dManager.checkStatus();
}
