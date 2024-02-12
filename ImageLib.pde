class ImageLib {
	HashMap<String, PImage> images = new HashMap<String, PImage>();

	PImage get(String filename, int width, int height) {
		if (!images.containsKey(filename)) {
			images.put(filename, loadImage(filename));
			images.get(filename).resize(width, height);
		}

		return images.get(filename);
	}
}

ImageLib ImageLib = new ImageLib();
