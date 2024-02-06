PImage img;
PGraphics pg;

void setup() {
  size(2000, 2000);
  img = loadImage("padlock.jpg");
  img.resize(2000, 2000);
  pg = createGraphics(2000, 2000, JAVA2D);  // Create a PGraphics object
}

void draw() {
  pg.beginDraw();
  pg.clear();  // Make background transparent
  
  pg.noStroke();
  pg.fill(0);  // Set fill color to black
  
  float tiles = 50;
  float tileSize = width / tiles;
  
  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      
      color c = img.get(int(x * tileSize), int(y * tileSize));
      float b = map(brightness(c), 0, 255, 1, 0);
      
      pg.pushMatrix();
      pg.translate(x * tileSize, y * tileSize);
      pg.ellipse(tileSize / 2, tileSize / 2, tileSize * b, tileSize * b);
      pg.popMatrix();
    }
  }
  
  pg.endDraw();
  image(pg, 0, 0);  // Draw PGraphics onto main canvas
  
  if (keyPressed && key == 's') {
    pg.save("output_transparent.png");
  }
}
