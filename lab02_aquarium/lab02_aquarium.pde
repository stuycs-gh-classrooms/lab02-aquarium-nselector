Tank t;

static PVector resolution = new PVector(1280, 720);
static float scale = 2;
static boolean DEBUG_BOUNDING_BOXES = false;
// Processing doesn't support colored terminal output :(
boolean coloredTerminalOutput = false;

void settings() {
  size(int(resolution.x * scale), int(resolution.y * scale));

  t = new Tank(new PVector(0, 0), new PVector(resolution.x, resolution.y), 50);

  ImageLib.preload("crab.png", "sad-fish-mask.png", "sad-fish.png");

  ImageLib.debug = false;
}

void draw() {
  background(150);
  t.moveAnimals();
  t.draw();
}

void keyPressed() {
  if (key == '1') t.add(new SadFish(t, new PVector(mouseX / scale, mouseY / scale)));
  if (key == '2') t.add(new Crab(t, mouseX / scale));
  if (key == '3') t.add(new RainbowFish(t, new PVector(mouseX / scale, mouseY / scale)));
}