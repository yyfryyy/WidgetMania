class AudioSteuerelement
{
  int xPos, yPos, breite, hoehe;
  color cFuellung, cHover;
  String bezeichnung;
  boolean aktiv = false;

  AudioSteuerelement(int xPos_, int yPos_, int breite_, int hoehe_, color cFuellung_, color cHover_, String bezeichnung_) {
    xPos = xPos_;
    yPos = yPos_;
    breite = breite_;
    hoehe = hoehe_;
    cFuellung = cFuellung_;
    cHover = cHover_;
    bezeichnung = bezeichnung_;
  }

  void display() {
    pushStyle();
    noStroke();
    if (isOver()) {
      fill(cHover);
    } else {
      fill(cFuellung);
    }
    if (bezeichnung == "StartStop") {
      if (aktiv) {
        // Stop
        beginShape();
        vertex(xPos, yPos);
        vertex(xPos+3*(breite/8), yPos);
        vertex(xPos+3*(breite/8), yPos+hoehe);
        vertex(xPos, yPos+hoehe);
        endShape();
        beginShape();
        vertex(xPos+5*(breite/8), yPos);
        vertex(xPos+breite, yPos);
        vertex(xPos+breite, yPos+hoehe);
        vertex(xPos+5*(breite/8), yPos+hoehe);
        endShape();
      } else if (!aktiv) {
        // Start
        beginShape();
        vertex(xPos, yPos);
        vertex(xPos+breite, yPos+hoehe/2);
        vertex(xPos, yPos+hoehe);
        endShape();
      }
    }
    if (bezeichnung == "LetzterSender") {
      beginShape();
      vertex(xPos, yPos);
      vertex(xPos+5*(breite/8), yPos+hoehe/2);
      vertex(xPos, yPos+hoehe);
      endShape();
      beginShape();
      vertex(xPos+5*(breite/8), yPos);
      vertex(xPos+breite, yPos);
      vertex(xPos+breite, yPos+hoehe);
      vertex(xPos+5*(breite/8), yPos+hoehe);
      endShape();
    }
    if (bezeichnung == "NaechsterSender") {
      beginShape();
      vertex(xPos, yPos);
      vertex(xPos+3*(breite/8), yPos);
      vertex(xPos+3*(breite/8), yPos+hoehe);
      vertex(xPos, yPos+hoehe);
      endShape();
      beginShape();
      vertex(xPos+3*(breite/8), yPos+hoehe/2);
      vertex(xPos+breite, yPos);
      vertex(xPos+breite, yPos+hoehe);
      endShape();
    }
    popStyle();
  }

  boolean isOver() {
    return(mouseX >= xPos && mouseX <= xPos+breite && mouseY >= yPos && mouseY <= yPos+hoehe);
  }


  void click() {
    if ( isOver() ) {
      aktiv = !aktiv;
    }
  }
}
