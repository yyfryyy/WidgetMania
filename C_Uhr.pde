class Uhr
{
  int xPos, yPos;
  int textSize;
  String style;

  Uhr(int xPos_, int yPos_, int textSize_, String style_) {
    xPos = xPos_;
    yPos = yPos_;
    textSize = textSize_;
    style = style_;
  }

  void display () {
    pushStyle(); //vorherige Styles zwischenspeichern
    if (style == "digital") {
      textAlign(CENTER, BASELINE);
      fill(gruen_hell);
      textSize(textSize);
      text(nf((hour()), 2) + ":" + nf((minute()), 2) +":" + nf((second()), 2), xPos, yPos);
    } else if (style == "analog") {
    }
    popStyle(); // vorherige STyles wiederherstellen
  }
}
