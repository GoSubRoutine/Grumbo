class Background {
  float backX=0; //Background tileing locations
  float backY=0;
  void refresh() {
    noStroke();
    for (backX=0; backX<520; backX=backX+20) { //creates backround
      for (backY=0; backY<520; backY=backY+20) {
        fill (random (235, 255));
        rect(backX, backY, 20, 20);
      }
      fill (random (235, 255));
      rect(backX, backY, 20, 20);
    }
  }
  void reset() {
    backY=0;
    backX=0;
  }
}