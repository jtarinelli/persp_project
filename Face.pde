class Face implements Comparable<Face>{
  
  PVector[] points;
  PVector[] trnsPoints;
  PVector viewer;
  PVector center;
  PShape face; 
  color fill; 
  
  Face(PVector v, PVector p1, PVector p2, PVector p3, PVector p4, color c) {
    viewer = v;
    points = new PVector[4];
    points[0] = p1;
    points[1] = p2;
    points[2] = p3;
    points[3] = p4;
    fill = c;
    
    // calculate center of face by taking average of each point's coordinates
    center = new PVector((p1.x+p2.x+p3.x+p4.x)/4, (p1.y+p2.y+p3.y+p4.y)/4, (p1.z+p2.z+p3.z+p4.z)/4);
  }
  
  void updateViewer(PVector newViewer) {
    this.viewer = newViewer;
  }
  
  // returns distance btn center of face and viewer
  float distFromViewer() {
    return dist(viewer.x, viewer.y, viewer.z, center.x, center.y, center.z);
  }
  
// compares faces based on distance from viewer
  int compareTo(Face other) {
    return (int)(other.distFromViewer() - this.distFromViewer());
  }  
  
  // transforms 1 point in one point perspective
  // might not just be one point? lol 
  PVector onePointPersp(PVector point) {
  float dist = -viewer.z;
  
  float newX = viewer.x + (point.x - viewer.x) * (dist / (point.z + dist));
  float newY = viewer.y + (point.y - viewer.y) * (dist / (point.z + dist));
  return new PVector(newX, newY);
  }
  
  // transforms array of points in one point perspective
  PVector[] transformPoints(PVector[] points) {
    PVector[] newPoints = new PVector[points.length];
    for (int i=0; i<points.length; i++) {
      newPoints[i] = onePointPersp(points[i]);
    }
    return newPoints;
  }
  
  // makes new transformed array of points
  // and draws them as rectangle
  void draw() {
    PVector[] trnsPoints = transformPoints(points);
    face = createShape(QUAD, trnsPoints[0].x,trnsPoints[0].y, trnsPoints[1].x,trnsPoints[1].y, 
    trnsPoints[2].x,trnsPoints[2].y, trnsPoints[3].x,trnsPoints[3].y);
    face.setFill(fill);
    shape(face);
    
    // testing center for painter's algorithm
    PVector trnsCenter = onePointPersp(center);
    point(trnsCenter.x,trnsCenter.y);
  }
  
}
