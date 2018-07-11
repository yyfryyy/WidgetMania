class ButtonHover extends Button
{
  ButtonHover(int xPos_, int yPos_, String label_) {
    super(xPos_, yPos_, label_);
  }

  void display() {
    pushStyle(); //vorherige Styles zwischenspeichern
    if ( isOver() ) {
      stroke(255, 0, 0);
      strokeWeight(3);
    } else {
      noStroke();
    }
    if (aktiv) {
      fill(cAktiv);
    } else {
      fill(cHintergrund);
    }
    textSize(schriftgroesse);
    rect(xPos, yPos, breite, hoehe);
    fill(cSchrift);
    text(label, xPos + padding, yPos + schriftgroesse + padding);
    popStyle(); // vorherige STyles wiederherstellen
  }
}
