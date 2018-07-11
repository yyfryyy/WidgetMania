void screen_detail_uhr() {
  // Kleines Widget links: Wetter
  hintergrund_klein1.display();
  icon_du_fs_wetter.display();
  icon_du_wetter.display();
  
  // Kleines Widget rechts: Radio
  hintergrund_klein2.display();
  icon_du_fs_radio.display();
  icon_du_radio.display();

  // Detailwidget Radio
  hintergrund_detail.display();
  hintergrund_detail_titel.display();
  icon_fs_exit.display();
  icon_du_titel.display();
  
  pushStyle(); //vorherige Styles zwischenspeichern
  textAlign(LEFT,BASELINE);
  fill(gruen_hell);
  textSize(48);
  text("Uhr",120 ,96);
  popStyle(); // vorherige STyles wiederherstellen
}
