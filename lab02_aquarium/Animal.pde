class Animal {
	PVector pos;
	PVector vel;

	PVector size = new PVector(100, 100);

	Animal(Tank tank, PVector pos) {
		this.pos = pos;
		this.vel = new PVector();
	}

	Animal(Tank tank) {
		this(tank, new PVector());
	}

	void move(Tank tank) {
		if (this.vel.mag() == 0) {
			vel.x = 10;
			vel.rotate(30);
		}

		pos = pos.add(vel);
	}

	void draw() {
		fill(255, 0, 0);
		rect(pos.x, pos.y, size.x, size.y);
	}

	void debugBoundingBox() {
		noFill();
		stroke(255, 0, 0);
		strokeWeight(scale);
		rect((pos.x - size.x / 2) * scale, (pos.y - size.y / 2) * scale, size.x * scale, size.y * scale);
	}

	String toString() {
		return String.format("Animal at %f,%f with vel %f,%f", pos.x, pos.y, vel.x, vel.y);
	}
}