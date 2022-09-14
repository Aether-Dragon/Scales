void setup() {
  size(500, 500);  //feel free to change the size
  noLoop(); //stops the draw() function from repeating
  colorMode(HSB);
}

void draw() {
  boolean shift = false;
  for (int y = 500; y > -50; y -= 30) {
    for (int x = 30; x < 550; x += 90) {
      if (shift) 
        scale(x+45, y);
      else 
        scale(x, y);
    }
    if (shift)
      shift = false;
    else
      shift = true;
  }
}

//hsb coloring version
void scale(int x, int y) {
  float h = (int)(Math.random()*256);
  float s = (int)(Math.random()*126)+130;
  float b = (int)(Math.random()*101)+150;
  float w;
  float l;
  float curve;
  noStroke();
  for(int i = 0; i < 8; i++) {
    fill(h, s, b-(i*0.8*b/8));
    //ellipse(x,y, (8-i)*10, (8-i)*10);
    w =45-(i)*3;
    l = 90 - i*8;
    curve = 75 - i*8;
    beginShape();
    vertex(x-w, y);
    bezierVertex(x-w, y, x-w, y+curve, x, y+l);
    bezierVertex(x, y+l, x+w, y+curve, x+w, y);
    vertex(x, y);
    endShape();
  }
}

