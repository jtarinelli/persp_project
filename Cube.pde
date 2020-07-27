class Cube {
  
  PVector viewer;
  Face front, top, left, right, bottom;
  Face[] faces;
  
  // put in each face induvidually
  Cube(PVector v, Face f, Face t, Face l, Face r, Face b) {
    viewer = v;
    front = f;
    top = t;
    left = l;
    right = r;
    bottom = b;
    faces = new Face[5];
    
    faces[0] = top;
    faces[1] = left;
    faces[2] = front;
    faces[3] = right;
    faces[4] = bottom;
  }
  
  // put in front upper left corner and size (one point persp only) 
  Cube(PVector v, PVector corner, int size) {
    viewer = v;
    front = new Face(viewer, corner, new PVector(corner.x,corner.y+size,corner.z), 
                     new PVector(corner.x+size,corner.y+size,corner.z), new PVector(corner.x+size,corner.y,corner.z), color(250));
    
    top = new Face(viewer, corner, new PVector(corner.x+size,corner.y,corner.z), new PVector(corner.x+size,corner.y,corner.z+size), 
                   new PVector(corner.x,corner.y,corner.z+size), color(255));
                   
    left = new Face(viewer, corner, new PVector(corner.x,corner.y+size,corner.z), new PVector(corner.x,corner.y+size,corner.z+size), 
                    new PVector(corner.x,corner.y,corner.z+size), color(240));
                    
    right = new Face(viewer, new PVector(corner.x+size,corner.y,corner.z), new PVector(corner.x+size,corner.y+size,corner.z), 
                     new PVector(corner.x+size,corner.y+size,corner.z+size), new PVector(corner.x+size,corner.y,corner.z+size), color(235));
                    
    bottom = new Face(viewer,  new PVector(corner.x,corner.y+size,corner.z), new PVector(corner.x+size,corner.y+size,corner.z), 
                      new PVector(corner.x+size,corner.y+size,corner.z+size), new PVector(corner.x,corner.y+size,corner.z+size), color(225));
                   
    faces = new Face[5];

    faces[0] = top;
    faces[1] = left;
    faces[2] = front;
    faces[3] = right;
    faces[4] = bottom;
    
  }
  
  void draw(PVector newViewer) {
    viewer = newViewer;
    Arrays.sort(faces); 
    
    stroke(0);
    for (Face face:faces) {
      face.updateViewer(viewer);
      face.draw();
    }

  }
  
}
