class Hintergrund
{
  int xPos, yPos, breite, hoehe;
  color cAnfang, cEnde;
  String axis;
  PGraphics gradient;
  boolean aktiv = false;

  Hintergrund(int xPos_, int yPos_, int breite_, int hoehe_, color cAnfang_, color cEnde_, String axis_ ) {
    xPos = xPos_;
    yPos = yPos_;
    breite = breite_;
    hoehe = hoehe_;
    cAnfang = cAnfang_;
    cEnde = cEnde_;
    axis = axis_;

    gradient = createGraphics(breite, hoehe, JAVA2D);

    if (axis == "y") {
      gradient.beginDraw();
      for (int i = 0; i <= hoehe; i++) {
        float inter = map(i, yPos, yPos+hoehe, 0, 1);
        color c = lerpColor(cAnfang, cEnde, inter);
        gradient.stroke(c);
        gradient.line(xPos, i, xPos+breite, i);
      }
      gradient.endDraw();
    }

    if (axis == "x") {
      gradient.beginDraw();
      for (int i = 0; i <= breite; i++) {
        float inter = map(i, xPos, xPos+breite, 0, 1);
        color c = lerpColor(cAnfang, cEnde, inter);
        gradient.stroke(c);
        gradient.line(i, 0, i, hoehe);
      }
      gradient.endDraw();
    }
  }

  Hintergrund(int xPos_, int yPos_, int breite_, int hoehe_, color cAnfang_) {
    xPos = xPos_;
    yPos = yPos_;
    breite = breite_;
    hoehe = hoehe_;
    cAnfang = cAnfang_;
    axis = "0";
  } 

  void display() {
    pushStyle(); //vorherige Styles zwischenspeichern
    noFill();
    noStroke();
    if (axis != "0") {    
      if (axis == "y") {
        image(gradient, xPos, yPos);
      } else if (axis == "x") {
        image(gradient, xPos, yPos);
      }
    } else {
      fill(cAnfang);
      rect(xPos, yPos, breite, hoehe);
    }
    popStyle(); // vorherige STyles wiederherstellen
  }
}
