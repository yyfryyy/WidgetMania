class Radio {

  JSONArray senderliste = loadJSONArray("senderliste.json");
  int senderzufall = (int) random(0, 6);
  JSONObject sender = senderliste.getJSONObject(senderzufall);
  String sender_name = senderliste.getJSONObject(senderzufall).getString("name");
  String stream_url = senderliste.getJSONObject(senderzufall).getString("url");
  PImage sender_logo = loadImage(senderliste.getJSONObject(senderzufall).getString("logo"));
  String wizardofoz = senderliste.getJSONObject(senderzufall).getString("woo");
  PImage albumart = loadImage(senderliste.getJSONObject(senderzufall).getString("albumart"));

  void display_sender_name(int xPos_, int yPos_, int textSize_) {
    int xPos = xPos_;
    int yPos = yPos_;
    int textSize = textSize_;
    pushStyle();
    textSize(textSize);
    textAlign(LEFT, BASELINE);
    text(sender_name, xPos, yPos-textDescent()*0.6);
    popStyle();
  }

  void display_sender_logo(int xPos_, int yPos_, int breite_, int hoehe_) {
    int xPos = xPos_;
    int yPos = yPos_;
    int breite = breite_;
    int hoehe = hoehe_;
    pushStyle();
    image(sender_logo, xPos, yPos, breite, hoehe);
    popStyle();
  }

  void display_albumart(int xPos_, int yPos_, int breite_, int hoehe_) {
    int xPos = xPos_;
    int yPos = yPos_;
    int breite = breite_;
    int hoehe = hoehe_;
    pushStyle();
    image(albumart, xPos, yPos, breite, hoehe);
    popStyle();
  }
  void display_artist_titel(int xPos_, int yPos_, int textSize_) {
    int xPos = xPos_;
    int yPos = yPos_;
    int textSize = textSize_;
    pushStyle();
    textSize(textSize);
    textAlign(LEFT, BASELINE);
    text(meta.author() + " – " + meta.title(), xPos, yPos);
    popStyle();
  }
  void display_album_jahr(int xPos_, int yPos_, int textSize_) {
  int xPos = xPos_;
    int yPos = yPos_;
    int textSize = textSize_;
    pushStyle();
    textSize(textSize);
    textAlign(LEFT, BASELINE);
    text(meta.album() + " – " + meta.date(), xPos, yPos);
    popStyle();
  }
}
