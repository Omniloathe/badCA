/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void reset_click(GButton source, GEvent event) { //_CODE_:reset_button:572639:
  myCA.reset();
} //_CODE_:reset_button:572639:

public void play_click(GButton source, GEvent event) { //_CODE_:play_button:740891:
  play=true;
} //_CODE_:play_button:740891:

public void stop_click(GButton source, GEvent event) { //_CODE_:stop_button:642813:
  play=false;
} //_CODE_:stop_button:642813:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  reset_button = new GButton(this, 542, 750, 80, 30);
  reset_button.setText("Reset");
  reset_button.setTextBold();
  reset_button.addEventHandler(this, "reset_click");
  play_button = new GButton(this, 191, 752, 80, 30);
  play_button.setText("Play");
  play_button.setTextBold();
  play_button.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  play_button.addEventHandler(this, "play_click");
  stop_button = new GButton(this, 374, 751, 80, 30);
  stop_button.setText("Stop");
  stop_button.setTextBold();
  stop_button.setLocalColorScheme(GCScheme.RED_SCHEME);
  stop_button.addEventHandler(this, "stop_click");
}

// Variable declarations 
// autogenerated do not edit
GButton reset_button; 
GButton play_button; 
GButton stop_button; 