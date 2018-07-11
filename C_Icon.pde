class Icon
{
  int xPos, yPos, breite, hoehe;
  color cFuellung, cHover;
  boolean aktiv = false;
  boolean mouse = false;
  String name;
  String upName;
  PShape icon;

  Icon(String name_, int xPos_, int yPos_, int breite_, int hoehe_, color cFuellung_) {
    name = name_;
    xPos = xPos_;
    yPos = yPos_;
    breite = breite_;
    hoehe = hoehe_;
    cFuellung = cFuellung_;
    icon = loadShape("data/" + name + ".svg");
  }
  
  void display() {

    pushStyle(); //vorherige Styles zwischenspeichern
    icon.disableStyle();
    noStroke();
    fill(cFuellung);
    shape(icon, xPos, yPos, breite, hoehe);
    if(isOver()) {
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
      aktiv = true;
    }
  }
}
