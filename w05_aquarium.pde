Tank t;

static PVector resolution = new PVector(1280, 720);
static float scale = 2;
static boolean DEBUG_BOUNDING_BOXES = true;

void settings() {
  size(int(resolution.x * scale), int(resolution.y * scale));

  t = new Tank(new PVector(0, 0), new PVector(resolution.x, resolution.y), 50);
}

void draw() {
  background(150);
  t.moveAnimals();
  t.draw();
}

void mouseClicked() {
  if (mouseButton == 37) t.add(new SadFish(t, new PVector(mouseX / scale, mouseY / scale)));
  if (mouseButton == 39) t.add(new Crab(t, mouseX / scale));
}