class Crab extends Animal {
	PImage img;

	Crab(Tank tank, float x) {
		super(tank);

		pos.x = x;
		pos.y = tank.size.y - tank.floorHeight - size.y / 2;

		img = ImageLib.get("crab.png", 0, int(size.y * scale));
		size.x = size.y / img.height * img.width;

		vel.y = 0;
		vel.x = 5 * (int(random(2)) * 2 - 1);
	}

	void move(Tank tank) {
		pos = pos.add(vel);
		if ((pos.x - size.x / 2 < tank.pos.x) || (pos.x + size.x / 2 >= tank.pos.x + tank.size.x)) {
			vel.x *= -1;
		}
	}

	void draw() {
		imageMode(CENTER);
		pushMatrix();
		translate(pos.x * scale, pos.y * scale);
		// scale(-vel.x/abs(vel.x), 1);
		image(img, 0, 0);
		popMatrix();
	}
}
