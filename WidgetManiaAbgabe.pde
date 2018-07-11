import java.text.SimpleDateFormat;
import java.util.*;

import ddf.minim.*;

/* ######################################
 Objekte
 #######################################*/

/* Hintergründe #######################*/
Hauptansicht Hauptansicht;
// Allgemeiner Hintergrund
Hintergrund hintergrund_sketch;
// Hintergründe der Übersichtswidgets
Hintergrund hintergrund_uhr;
Hintergrund hintergrund_wetter;
Hintergrund hintergrund_radio;
// Hintergründe für Detailansicht
Hintergrund hintergrund_detail;
Hintergrund hintergrund_detail_titel;
Hintergrund hintergrund_klein1;
Hintergrund hintergrund_klein2;

/* Icons ##############################*/
// Hauptansicht
IconHover icon_fs_exit;
IconHover icon_ha_fs_uhr;
IconHover icon_ha_fs_wetter;
IconHover icon_ha_fs_radio;
// Detailansicht Uhr
Icon icon_du_titel;
Icon icon_du_wetter;
Icon icon_du_radio;
IconHover icon_du_fs_wetter;
IconHover icon_du_fs_radio;
// Detailansicht Wetter
Icon icon_dw_titel;
Icon icon_dw_uhr;
Icon icon_dw_radio;
IconHover icon_dw_fs_uhr;
IconHover icon_dw_fs_radio;
// Detalansicht Radio
Icon icon_dr_titel;
Icon icon_dr_uhr;
Icon icon_dr_wetter;
IconHover icon_dr_fs_uhr;
IconHover icon_dr_fs_wetter;

/* Datum & Uhrzeit#####################*/
Uhr meineUhr;
Datum meinDatum;

/* Audioplayer ########################*/
AudioSteuerelement StartStop;
AudioSteuerelement NaechsterSender;
AudioSteuerelement LetzterSender;

Radio Radio;
Minim minim;
AudioPlayer player;
AudioMetaData meta;


/* ######################################
 Globale Variablen
 #######################################*/

int screen = 0;

color blau_dunkel = color(34, 33, 39);
color blau = color(45, 63, 99);
color blau_hell = color(100, 126, 161);
color gruen = color(154, 163, 8);
color gruen_hell = color(195, 200, 100);

//color blau_dunkel = color(8, 24, 34);
//color blau = color(36, 71, 105);
//color blau_hell = color(181, 209, 241);
//color gruen = color(193, 204, 156);
//color gruen_hell = color(238, 245, 238);

boolean hasVolume;

void setup() {
  size(1920, 1080, JAVA2D);
  smooth(8);
  pixelDensity(2);
  Hauptansicht = new Hauptansicht();
  hintergrund_sketch = new Hintergrund(0, 0, 1920, 1080, blau_dunkel);
  // Hauptansicht
  hintergrund_uhr = new Hintergrund(24, 24, 924, 504, blau);
  hintergrund_wetter = new Hintergrund(972, 24, 924, 1032, blau);
  hintergrund_radio = new Hintergrund(24, 552, 924, 504, blau);
  // Detailansicht
  hintergrund_detail = new Hintergrund(24, 24, 1872, 912, blau_hell);
  hintergrund_detail_titel = new Hintergrund(24, 24, 1872, 96, blau);
  hintergrund_klein1 = new Hintergrund(24, 960, 924, 96, blau);
  hintergrund_klein2 = new Hintergrund(972, 960, 924, 96, blau);

  // Hauptansicht
  icon_ha_fs_uhr = new IconHover("fullscreen", 876, 48, 48, 48, gruen_hell, gruen);
  icon_ha_fs_wetter = new IconHover("fullscreen", 1824, 48, 48, 48, gruen_hell, gruen);
  icon_ha_fs_radio = new IconHover("fullscreen", 876, 576, 48, 48, gruen_hell, gruen);
  // Fullscreen-Exit-Button in allen Detailansichten, führt zur Übersicht zurück
  icon_fs_exit = new IconHover("fullscreen_exit", 1824, 48, 48, 48, gruen_hell, gruen);
  // Detailansicht Uhr
  icon_du_titel = new Icon("uhr", 48, 48, 48, 48, gruen_hell);
  icon_du_wetter = new Icon("wetter", 48, 984, 60, 48, gruen_hell);
  icon_du_radio = new Icon("radio", 996, 984, 48, 48, gruen_hell);
  icon_du_fs_wetter = new IconHover("fullscreen", 876, 984, 48, 48, gruen_hell, gruen);
  icon_du_fs_radio = new IconHover("fullscreen", 1824, 984, 48, 48, gruen_hell, gruen);
  // Detailansicht Wetter
  icon_dw_titel = new Icon("wetter", 48, 48, 60, 48, gruen_hell);
  icon_dw_uhr = new Icon("uhr", 48, 984, 48, 48, gruen_hell);
  icon_dw_radio = new Icon("radio", 996, 984, 48, 48, gruen_hell);
  icon_dw_fs_uhr = new IconHover("fullscreen", 876, 984, 48, 48, gruen_hell, gruen);
  icon_dw_fs_radio = new IconHover("fullscreen", 1824, 984, 48, 48, gruen_hell, gruen);
  // Detailansicht Radio
  icon_dr_titel = new Icon("radio", 48, 48, 48, 48, gruen_hell);
  icon_dr_uhr = new Icon("uhr", 48, 984, 48, 48, gruen_hell);
  icon_dr_wetter = new Icon("wetter", 996, 984, 60, 48, gruen_hell);
  icon_dr_fs_uhr = new IconHover("fullscreen", 876, 984, 48, 48, gruen_hell, gruen);
  icon_dr_fs_wetter = new IconHover("fullscreen", 1824, 984, 48, 48, gruen_hell, gruen);

  //Hauptansicht
  meineUhr = new Uhr(924/2, 504/2+48, 120, "digital");
  meinDatum = new Datum(924/2, 504/2+120, 48);
  Radio = new Radio();
  
  StartStop = new AudioSteuerelement(414+182, 756, 96, 96, gruen_hell, gruen, "StartStop");
  NaechsterSender = new AudioSteuerelement(462+288, 756, 96, 96, gruen_hell, gruen, "LetzterSender");
  LetzterSender = new AudioSteuerelement(414, 756, 96, 96, gruen_hell, gruen, "NaechsterSender");
  
  minim = new Minim(this);
  player = minim.loadFile(Radio.wizardofoz);
  meta = player.getMetaData();
  player.play();
  hasVolume = player.hasControl(Controller.VOLUME);
  
  
}

void draw() {
  println(frameRate);
  // Wetter
  if ((screen == 0 && icon_ha_fs_wetter.aktiv) || (screen == 2 && icon_du_fs_wetter.aktiv) || (screen == 3 && icon_dr_fs_wetter.aktiv)) {
    screen = 1;
    icon_ha_fs_wetter.aktiv = icon_ha_fs_uhr.aktiv = icon_ha_fs_wetter.aktiv = icon_ha_fs_radio.aktiv = false;
    icon_du_fs_wetter.aktiv = icon_du_fs_radio.aktiv = false;
    icon_dw_fs_uhr.aktiv = icon_dw_fs_radio.aktiv = false;
    icon_dr_fs_uhr.aktiv = icon_dr_fs_wetter.aktiv = false;
    icon_fs_exit.aktiv = false;
  }
  // Uhr
  if (screen == 0 && icon_ha_fs_uhr.aktiv || (screen == 1 && icon_dw_fs_uhr.aktiv) || (screen == 3 && icon_dr_fs_uhr.aktiv)) {
    screen = 2;
    icon_ha_fs_wetter.aktiv = icon_ha_fs_uhr.aktiv = icon_ha_fs_wetter.aktiv = icon_ha_fs_radio.aktiv = false;
    icon_du_fs_wetter.aktiv = icon_du_fs_radio.aktiv = false;
    icon_dw_fs_uhr.aktiv = icon_dw_fs_radio.aktiv = false;
    icon_dr_fs_uhr.aktiv = icon_dr_fs_wetter.aktiv = false;
    icon_fs_exit.aktiv = false;
  }
  // Radio
  if (screen == 0 && icon_ha_fs_radio.aktiv || (screen == 1 && icon_dw_fs_radio.aktiv) || (screen == 2 && icon_du_fs_radio.aktiv)) {
    screen = 3;
    icon_ha_fs_wetter.aktiv = icon_ha_fs_uhr.aktiv = icon_ha_fs_wetter.aktiv = icon_ha_fs_radio.aktiv = false;
    icon_du_fs_wetter.aktiv = icon_du_fs_radio.aktiv = false;
    icon_dw_fs_uhr.aktiv = icon_dw_fs_radio.aktiv = false;
    icon_dr_fs_uhr.aktiv = icon_dr_fs_wetter.aktiv = false;
    icon_fs_exit.aktiv = false;
  }
  // Hauptscreen
  if (screen != 0 && icon_fs_exit.aktiv) {
    screen = 0;
    icon_ha_fs_wetter.aktiv = icon_ha_fs_uhr.aktiv = icon_ha_fs_wetter.aktiv = icon_ha_fs_radio.aktiv = false;
    icon_du_fs_wetter.aktiv = icon_du_fs_radio.aktiv = false;
    icon_dw_fs_uhr.aktiv = icon_dw_fs_radio.aktiv = false;
    icon_dr_fs_uhr.aktiv = icon_dr_fs_wetter.aktiv = false;
    icon_fs_exit.aktiv = false;
  }

  hintergrund_sketch.display();

  if (screen == 0) {
    Hauptansicht.display();
  }
  if (screen == 1) {
    screen_detail_wetter();
  }
  if (screen == 2) {
    screen_detail_uhr();
  }
  if (screen == 3) {
    screen_detail_radio();
  }
  
  if (player.isPlaying()) { 
    if (StartStop.aktiv) {
      player.pause();
    } 
  } else if (!StartStop.aktiv) {
      player.play();
    }
}

void mouseReleased() {
  // Ansichten
  if (icon_ha_fs_wetter.isOver() ) {
    icon_ha_fs_wetter.click();
  }
  if (icon_ha_fs_uhr.isOver() ) {
    icon_ha_fs_uhr.click();
  }
  if (icon_ha_fs_radio.isOver() ) {
    icon_ha_fs_radio.click();
  }
  if (icon_fs_exit.isOver() ) {
    icon_fs_exit.click();
  }
  if (icon_dr_fs_wetter.isOver() ) {
    icon_dr_fs_wetter.click();
  }
  if (icon_du_fs_wetter.isOver() ) {
    icon_du_fs_wetter.click();
  }
  if (icon_dr_fs_uhr.isOver() ) {
    icon_dr_fs_uhr.click();
  }
  if (icon_dw_fs_uhr.isOver() ) {
    icon_dw_fs_uhr.click();
  }
  if (icon_du_fs_radio.isOver() ) {
    icon_du_fs_radio.click();
  }
  if (icon_dw_fs_radio.isOver() ) {
    icon_dw_fs_radio.click();
  }
  // AudioSteuerelemente
  if (StartStop.isOver()) {
    StartStop.click();
  }
  if (LetzterSender.isOver()) {
    LetzterSender.click();
  }
  if (NaechsterSender.isOver()) {
    NaechsterSender.click();
  }
}
