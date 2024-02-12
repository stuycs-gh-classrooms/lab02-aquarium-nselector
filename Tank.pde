class Tank {
	PVector pos;
	PVector size;
	float floorHeight;
	ArrayList<Animal> animals = new ArrayList<Animal>();
	
	color waterColor = color(27, 206, 242);
	color floorColor = color(255, 237, 145);

	Tank(PVector pos, PVector size, float floorHeight) {
		this.pos = pos;
		this.size = size;
		this.floorHeight = floorHeight;
	}

	void draw() {
		noStroke();
		fill(waterColor);
		rect(pos.x * scale, pos.y * scale, size.x * scale, size.y * scale);
		fill(floorColor);
		rect(pos.x * scale, (pos.y + size.y - floorHeight) * scale, size.x * scale, floorHeight * scale);
		for (Animal animal : animals) {
			animal.draw();
			if (DEBUG_BOUNDING_BOXES) {
				animal.debugBoundingBox();
			}
		}

	}

	void add(Animal... animals) {
		for (Animal animal : animals) {
			this.animals.add(animal);
		}
	}

	void addAt(PVector pos) {
		animals.add(new Crab(this, pos.x));
	}

	void moveAnimals() {
		for (Animal animal : animals) {
			animal.move(this);
		}
	}
}
