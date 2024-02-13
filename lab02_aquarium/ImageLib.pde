/*
ImageLib Usage

ImageLib.get("crab.png");
Returns the image at /data/crab.png

ImageLib.get("crab.png", 500, 0);
Returns the image at /data/crab.png resized to have a width of 500 (height is calculated automatically to maintain aspect ratio)

ImageLib.get("crab.png", 0, 20);
Returns the image at /data/crab.png resized to have a height of 20 (width is calculated automatically to maintain aspect ratio)

ImageLib.get("crab.png", 500, 20);
Returns the image at /data/crab.png resized to 500x20 (it'll probably look really stretched)

ImageLib.preload("crab.png", "fish.png", "Jerry");
Loads crab.png, fish.png, and Jerry from the data folder, returns nothing
Place this in your setup() or settings() to preload any images you'll need (that way your program doesn't stutter when you load an image for the first time :) )

ImageLib.debug = true;
Prints out whenever an image is loaded or resized
*/

String removeAnsiEscapeCodesIfNecessary(String string) {
	return coloredTerminalOutput ? string : string.replaceAll("\033.*?m", "");
}

class ImageLib {
	HashMap<String, PImage> originalImages = new HashMap<String, PImage>();
	HashMap<String, PImage> resizedImages = new HashMap<String, PImage>();

	boolean debug = false;

	PImage get(String filename, int width, int height) {
		if (!originalImages.containsKey(filename)) {
			println(removeAnsiEscapeCodesIfNecessary(String.format("\033[91mImageLib DEBUG \033[0;2m- \033[0mLoading \033[96m%s\033[0m", filename)));
			originalImages.put(filename, loadImage(filename));
		}
		if (width + height == 0) {
			width = originalImages.get(filename).width;
			height = originalImages.get(filename).height;
		}
		String resizedImageString = String.format("%s-%d-%d",filename, width, height);
		if (!resizedImages.containsKey(resizedImageString)) {
			if (width == originalImages.get(filename).width && height == originalImages.get(filename).height) {
				resizedImages.put(resizedImageString, originalImages.get(filename));
			} else {
				println(removeAnsiEscapeCodesIfNecessary(String.format("\033[91mImageLib DEBUG \033[0;2m- \033[0mResizing \033[96m%s\033[0m with parameters \033[96m%d\033[0mx\033[96m%d\033[0m", filename, width, height)));
				PImage duplicateImage = originalImages.get(filename).copy();
				duplicateImage.resize(width, height);
				resizedImages.put(resizedImageString, duplicateImage);
			}
		}

		return resizedImages.get(resizedImageString);
	}

	PImage get(String filename) {
		return get(filename, 0, 0);
	}

	void preload(String... filenames) {
		for (String filename : filenames) {
			if (!originalImages.containsKey(filename)) {
				println(removeAnsiEscapeCodesIfNecessary(String.format("\033[91mImageLib DEBUG \033[0;2m- \033[0mLoading \033[96m%s\033[0m", filename)));
				originalImages.put(filename, loadImage(filename));
			}
		}
	}
}

ImageLib ImageLib = new ImageLib();
