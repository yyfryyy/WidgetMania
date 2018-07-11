class Hauptansicht {
  
  void display() {
    // Uhr
    hintergrund_uhr.display();
    icon_ha_fs_uhr.display();
   
    meineUhr.display();
    meinDatum.display();

    // Radio
    hintergrund_radio.display();
    icon_ha_fs_radio.display();
    
    StartStop.display();
    NaechsterSender.display();
    LetzterSender.display();
    
    Radio.display_sender_name(120,624, 48);
    Radio.display_sender_logo(48,576,48,48);
    
    Radio.display_albumart(48, 672, 264,264);
    Radio.display_artist_titel(48,984,36);
    Radio.display_album_jahr(48,1016,18);
    
    
    // Wetter
    hintergrund_wetter.display();
    icon_ha_fs_wetter.display();
  }
}
