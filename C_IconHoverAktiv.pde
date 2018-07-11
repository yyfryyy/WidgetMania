class IconHoverAktiv extends IconHover
{
  color cAktiv;

  IconHoverAktiv(String name_, int xPos_, int yPos_, int breite_, int hoehe_, color cFuellung_, color cHover_, color cAktiv_) {
    super(name_, xPos_, yPos_, breite_, hoehe_, cFuellung_, cHover_);
      cAktiv = cAktiv_;
  }

  void display() {

    pushStyle(); //vorherige Styles zwischenspeichern
    icon.disableStyle();
    noStroke();
    if (aktiv) {
      fill(cAktiv);
    } else if (!aktiv) {
      fill(cFuellung);
    }
    if ( isOver() && !mousePressed) {
      fill(cHover);
    }
    shape(icon, xPos, yPos, breite, hoehe);
    if (isOver()) {
      mouse = true;
    } else if (!isOver()) {
      mouse = false;
    }
    popStyle(); // vorherige STyles wiederherstellen
  }

  boolean isOver() {
    if (mouseX >= xPos && mouseX <= xPos+breite && mouseY >= yPos && mouseY <= yPos+hoehe) {
      return true;
    } else {
      return false;
    }
    // return(mouseX >= xPos && mouseX <= xPos+breite && mouseY >= yPos && mouseY <= yPos+hoehe);
    // kürzere Variante
  }

  void click() {
    if ( isOver() ) {
      aktiv = !aktiv;
    }
  }
}
