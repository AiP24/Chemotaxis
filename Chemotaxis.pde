//declare bacteria variables here
boolean pause = false;
Bacteria[] impostors = new Bacteria[100];
PImage im;
void setup() {     
 	//initialize bacteria variables here
 im = loadImage("onepiece.png");
  size(500, 500);
  for (int i = 0; i < 100; i++)
    impostors[i] = new Bacteria(width/2, height/2, new int[]{255, 0, 0});
}   
void draw() {
 	//move and show the bacteria
  background(0,0,0);
  fill(50, 50, 50);
  rect(width/10, height/10, width-width/5, height-height/5);
  fill(255, 255, 255);
  textSize(height/10);
  textAlign(CENTER);
  text("THE ONE PIECE IS REAL", width/2, height/20);
  textSize(height/40);
  text("Space to pause, r to reset, click to scare", width/2, height-height/40);
  for (int i = 0; i < impostors.length; i++) {
    if (!pause) impostors[i].move();
    impostors[i].show();
  }
  image(im, mouseX-im.width/2, mouseY-im.height/2);
}
void mouseClicked() {
    boolean all = true;
    for (int i = 0; i < impostors.length; i++) {
      if (!impostors[i].dead) {all = false; break;}
    }
    if (all) return;
    int ri = (int)(Math.random()*impostors.length);
    while (impostors[ri].dead) {
        ri = (int)(Math.random()*impostors.length);
    }
    impostors[ri] = new Bacteria(impostors[ri].x, impostors[ri].y, new int[]{255, 255, 255}, true);
}
void keyPressed() {
  if (key == 'r') {
    for (int i = 0; i < impostors.length; i++) {
      impostors[i] = new Bacteria(width/2, height/2, new int[]{255, 0, 0});
    }
  }
}
void keyReleased() {
  if (key == ' ') {
    pause = !pause;
  }
}
class Bacteria {     
 	public int x;
  public int y;
  private int[] col;
  public boolean dead = false;
  public Bacteria(int x, int y, int[] col) {
    this.x = x;
    this.y = y;
    this.col = col;
  }
  public Bacteria(int x, int y, int[] col, boolean dead) {
    this.x = x;
    this.y = y;
    this.col = col;
    this.dead = dead;
  }
  void move() {
    if (dead) {
      if (x > mouseX) {
        x += (int)(width/100 * Math.random());
      } else if (x < mouseX) {
        x -= (int)(width/100 * Math.random());
      }
      if (y > mouseY) {
        y += (int)(height/100 * Math.random());
      } else if (y < mouseY) {
        y -= (int)(height/100 * Math.random());
      }
    } else {
      if (x < mouseX) {
        x += (int)(width/100 * Math.random());
      } else if (x > mouseX) {
        x -= (int)(width/100 * Math.random());
      }
      if (y < mouseY) {
        y += (int)(height/100 * Math.random());
      } else if (y > mouseY) {
        y -= (int)(height/100 * Math.random());
      }
    }
    if (x < width/10) x=width/10;
    if (x > width-width/10) x=width-width/10;
    if (y < height/10) y=height/10;
    if (y > height-height/10) y=height-height/10;
  }
  void show() {
    fill(col[0], col[1], col[2]);
    ellipse(x, y, 10, 10);
  }
}    
