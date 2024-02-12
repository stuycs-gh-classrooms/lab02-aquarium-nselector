class SadFish extends Animal {
	PImage img;
	float sinWaveY;
	float sinWaveStartingOffset;
	float sinWaveAmpltitude;
	float sineWavePeriodMillis;

	SadFish(Tank tank, PVector pos) {
		super(tank, pos);

		sinWaveY = pos.y;
		sinWaveStartingOffset = random(TWO_PI);
		sinWaveAmpltitude = random(50, 120);
		sineWavePeriodMillis = random(2000, 4000);
		
		size.x = 200;

		img = ImageLib.get("sad-fish.png", int(size.x * scale), 0);

		vel.y = 0;
		vel.x = random(1, 4) * (int(random(2)) * 2 - 1);
	}

	void move(Tank tank) {
		pos = pos.add(vel);

		if ((pos.x - size.x / 2 < tank.pos.x) || (pos.x + size.x / 2 >= tank.pos.x + tank.size.x)) {
			vel.x *= -1;
		}
		pos.y = sinWaveY + sin(((float)millis() / sineWavePeriodMillis * TWO_PI + sinWaveStartingOffset) % TWO_PI) * sinWaveAmpltitude;
	}

	void draw() {
		imageMode(CENTER);
		pushMatrix();
		translate(pos.x * scale, pos.y * scale);
		scale(-vel.x/abs(vel.x), 1);
		image(img, 0, 0);
		popMatrix();
	}
}
