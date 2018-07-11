class Button
{
  //Parameter (Farbe, Kontur, Abstand etc...)
  int xPos, yPos, breite, hoehe, schriftgroesse, padding;
  String label;
  Boolean aktiv = false;
  color cSchrift, cHintergrund, cAktiv;

  //Konstruktor 
  //(Funktion die aufgerufen wird, wenn man ein Objekt aus der Klasse erzeugt)
  //hat keinen Rückgabewert
  Button(int xPos_, int yPos_, String label_) {
    xPos = xPos_;
    yPos = yPos_;
    label = label_;

    cSchrift = color(255);
    cHintergrund = color(0);
    cAktiv = color(0, 220, 0);
    schriftgroesse = 24;
    padding = 6;
    textSize(schriftgroesse);
    breite = int(textWidth(label))+2*padding;
    hoehe = schriftgroesse+2*padding;
    // Unterlaenge textDescent() um Unterlänge herauszufinden
  }

  void display() {
    pushStyle(); //vorherige Styles zwischenspeichern
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
