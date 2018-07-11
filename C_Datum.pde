class Datum
{
  int xPos, yPos, textSize;
  String tagesname, tag, monat, jahreszahl;
  
  Datum(int xPos_, int yPos_, int textSize_) {
    xPos= xPos_;
    yPos = yPos_;
    textSize = textSize_;
    tagesname = new SimpleDateFormat("EEEE").format(new Date());
    tag = new SimpleDateFormat("dd").format(new Date());
    monat = new SimpleDateFormat("MMMM").format(new Date());
    jahreszahl = new SimpleDateFormat("yyyy").format(new Date());
  }

  void display() {
    textAlign(CENTER,BASELINE);
    fill(gruen_hell);
    textSize(textSize);
    text(tagesname + ", der " + tag +". " + monat + " " + jahreszahl, xPos, yPos);
  }
}
