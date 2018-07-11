class HintergrundHover extends Hintergrund
{
  
  boolean aktiv = false;

  HintergrundHover(int xPos_, int yPos_, int breite_, int hoehe_, color cAnfang_, color cEnde_, String axis_ ) {
    super(xPos_,yPos_,breite_,hoehe_,cAnfang_,cEnde_,axis_);
  }
  HintergrundHover(int xPos_, int yPos_, int breite_, int hoehe_, color cAnfang_) {
    super(xPos_,yPos_,breite_,hoehe_,cAnfang_);
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

  boolean isOver() {
    return(mouseX >= xPos && mouseX <= xPos+breite && mouseY >= yPos && mouseY <= yPos+hoehe);
  }

  void click() {
    if ( isOver() ) {
      aktiv = true;
    }
  }
  
}
