class RainbowFish extends SadFish {
	PImage getRainbowImage(PImage maskImage) {
		PImage rainbowImage = createImage(maskImage.width, maskImage.height, RGB);
		rainbowImage.loadPixels();
		colorMode(HSB, 1);
		for (int i = 0; i < rainbowImage.pixels.length; i++) {
			PVector pixel = new PVector(i % rainbowImage.width, i / rainbowImage.width);
			PVector center = new PVector(rainbowImage.width / 2, -rainbowImage.height * 1);
			float distanceFromCenter = pixel.dist(center);
			rainbowImage.pixels[i] = color(abs((distanceFromCenter / 300 + ((float)millis()) / 10000) % 1), 0.8, 1);
		}
		colorMode(RGB, 255);
		rainbowImage.updatePixels();
		rainbowImage.mask(maskImage);

		return rainbowImage;
	}
	
	RainbowFish(Tank tank, PVector pos) {
		super(tank, pos);
	}

	void draw() {
		this.img = getRainbowImage(ImageLib.get("sad-fish-mask.png", int(size.x * scale), 0));
		imageMode(CENTER);
		pushMatrix();
		translate(pos.x * scale, pos.y * scale);
		scale(-vel.x/abs(vel.x), 1);
		image(img, 0, 0);
		popMatrix();
	}
}
