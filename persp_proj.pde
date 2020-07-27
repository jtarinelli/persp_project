import java.util.Arrays;
import controlP5.*;
ControlP5 viewerCtrl;
  float vx,vy,vz;

Face front, left, top, right, bottom;
Cube cube1, cube2, cube3;
PVector viewer;
float mode;

void setup() {
    size(1250,700); 
    
    viewer = new PVector(0,0,-500);  
    
    left = new Face(viewer, new PVector(200,200,100), new PVector(300,200,50), new PVector(300,350,50), new PVector(200,350,100), color(250));
    front = new Face(viewer,new PVector(300,200,50), new PVector(400,200,100), new PVector(400,350,100), new PVector(300,350,50), color(250));
    right = new Face(viewer,new PVector(400,200,100), new PVector(300,200,150), new PVector(300,350,150), new PVector(400,350,100), color(250));
    top = new Face(viewer,new PVector(200,200,100), new PVector(300,200,50), new PVector(400,200,100), new PVector(300,200,150), color(250));
    bottom = new Face(viewer,new PVector(200,350,100), new PVector(300,350,50), new PVector(400,350,100), new PVector(300,350,150), color(250));


    cube1 = new Cube(viewer, new PVector(100,100,100), 100);
    cube2 = new Cube(viewer, new PVector(400,400,100), 200);
    cube3 = new Cube(viewer, front, top, left, right, bottom);
    
    // everything for the sliders
    viewerCtrl = new ControlP5(this);
    viewerCtrl.addSlider("vx")
       .setPosition(width-240, height-120)
       .setSize(200, 20)
       .setRange(0, width)
       .setValue(100)
       .setColorCaptionLabel(color(0));
     viewerCtrl.addSlider("vy")
       .setPosition(width-240, height-80)
       .setSize(200, 20)
       .setRange(0, height)
       .setValue(0)
       .setColorCaptionLabel(color(0));
     viewerCtrl.addSlider("vz")
       .setPosition(width-240, height-40)
       .setSize(200, 20)
       .setRange(0, -1000)
       .setValue(-500)
       .setColorCaptionLabel(color(0));
       
     // for the buttons
     viewerCtrl.addButton("onePoint")
       .setValue(0)
       .setPosition(width-480, height-80)
       .setSize(200,20);
     viewerCtrl.addButton("twoPoint")
       .setValue(0)
       .setPosition(width-480, height-40)
       .setSize(200,20);
}

// draws the ground/horizon at the same y as the viewer (which is correct for 1 point persp)
void drawGround(PVector viewer) {
  fill(200);
  noStroke();
  rect(0,viewer.y,width,height);
}

public void onePoint() {
  mode = 1;
}

public void twoPoint() {
  mode = 2;
}

void draw() {
    background(250);
    viewer = new PVector(vx,vy,vz);
    drawGround(viewer);
    
    if(mode == 0) {
    } else if (mode == 1) {
      cube1.draw(viewer);
      cube2.draw(viewer);
    } else {
      cube3.draw(viewer);
    }

    fill(0);
    textSize(20);
    text("Set viewer position",width-240, height-140);
}
