void screen_detail_wetter() {
  
  // Kleines Widget links: Uhr
  hintergrund_klein1.display();
  icon_dw_fs_uhr.display();
  icon_dw_uhr.display();
  
  // Kleines Widget rechts: Radio
  hintergrund_klein2.display();
  icon_dw_fs_radio.display();
  icon_dw_radio.display();
  
  // Detailwidget Radio
  hintergrund_detail.display();
  hintergrund_detail_titel.display();
  icon_fs_exit.display();
  icon_dw_titel.display();
    
  pushStyle(); //vorherige Styles zwischenspeichern
  textAlign(LEFT,BASELINE);
  fill(gruen_hell);
  textSize(48);
  text("Wetter",120+12,96);
  popStyle(); // vorherige STyles wiederherstellen
}
