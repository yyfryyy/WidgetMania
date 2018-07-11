void screen_detail_radio() {

  // Kleines Widget links: Uhr
  hintergrund_klein1.display();
  icon_dr_fs_uhr.display();
  icon_dr_uhr.display();
  

  // Kleines Widget rechts: Wetter
  hintergrund_klein2.display();
  icon_dr_fs_wetter.display();
  icon_dr_wetter.display();

  // Detailwidget Radio
  hintergrund_detail.display();
  hintergrund_detail_titel.display();
  icon_fs_exit.display();
  icon_dr_titel.display();


  pushStyle(); //vorherige Styles zwischenspeichern
  textAlign(LEFT, BASELINE);
  fill(gruen_hell);
  textSize(48);
  text("Radio", 120, 96);
  popStyle(); // vorherige STyles wiederherstellen
}
