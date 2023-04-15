print("Loading wind-wave.nas");

var title = "Wave Settings";

    #rgb values for panel, last value is maximum alpha for panel
    var rgb = [0.45, 0.63, 0.79, 1.0];

    ## create a new window, dimensions are WIDTH x HEIGHT, using the dialog decoration (i.e. titlebar) allowfocus: 0
    var window = canvas.Window.new(size:[700,200], type:"dialog")
       .set('title',title)
       .clearFocus();

    #hide the panel window and set the showing flag to indicate it is not showing
    window.hide();
    setprop("/sim/gui/canvas/window[2]/showing", 0);

    # adding a canvas to the new window and setting up background colors/transparency
    var myCanvas = window.createCanvas().setColorBackground(rgb[0],rgb[1],rgb[2], rgb[3]);

    # creating the top-level/root group which will contain all other elements/group

    var root = myCanvas.createGroup();

    ####DISPLAYS####

# create a new vertical layout for the canvas
var vbox = canvas.VBoxLayout.new();
myCanvas.setLayout(vbox);


##################################################################################
#var wind_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0});

#var wind_label = root.createChild("text")
#        .setText("Wind")
#        .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
#        .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
#        .setColor(0,0,0,1)             # green, fully opaque
#        .setAlignment("left-center") # how the text is aligned to where you place it
#        .setTranslation(40, 10);     # where to place the text

#vbox.addItem(wind_label);

#create and fill a horizontal layout for the wind widgets
#var windLayout = canvas.HBoxLayout.new();

#var windDirectionLayout = canvas.VBoxLayout.new();

#var wind_direction_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
#  .setFixedSize(75,25)
#  .setText("Direction");
#windDirectionLayout.addItem(wind_direction_label);

#var wind_direction_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
#  .setFixedSize(75,25)
#  .setText(sprintf("%.2f",getprop("/environment/wind-from-heading-deg")));
#windDirectionLayout.addItem(wind_direction_value);

#windLayout.addItem(windDirectionLayout);


#var windSpeedLayout = canvas.VBoxLayout.new();

#var wind_speed_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
#  .setFixedSize(75,25)
#  .setText("Speed");
#windSpeedLayout.addItem(wind_speed_label);
#var wind_speed_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
#  .setFixedSize(75,25)
#  .setText(sprintf("%.2f",getprop("/environment/wind-speed-kt")));
#windSpeedLayout.addItem(wind_speed_value);

#windLayout.addItem(windSpeedLayout);

#var spacer = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
#  .setFixedSize(75,25);
#windLayout.addItem(spacer);

#windLayout.addItem(spacer);


#var wind_button = canvas.gui.widgets.Button.new(root, canvas.style, {})
#	.setText("Apply")
#	.setFixedSize(75, 35);
#wind_button.listen("clicked", func {
#  # add code here to react on click on button.
#  gui.popupTip("Wind Direction: " ~ wind_direction_value.text() ~"\nWind Speed: " ~ wind_speed_value.text());
#});
#windLayout.addItem(wind_button);

#add the wind h-layout to the canvas v-layout
#vbox.addItem(windLayout);



##################################################################################

#var wave_label = root.createChild("text")
#        .setText("Waves")
#        .set("font", "LiberationFonts/LiberationSans-Bold.ttf")
#        .setFontSize(20, 0.9)          # font size (in texels) and font aspect ratio
#        .setColor(0,0,0,1)             # green, fully opaque
#        .setAlignment("left-center") # how the text is aligned to where you place it
#        .setTranslation(40, 0);     # where to place the text


#var wave_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
#  .setFixedSize(75,35)
#  .setText("Wave");
#vbox.addItem(wave_label);

#create and fill a horizontal layout for the wave widgets
var waveLayout = canvas.HBoxLayout.new();

#wave direction value
var waveDirectionLayout = canvas.VBoxLayout.new();
var wave_direction_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
  .setFixedSize(75,25)
  .setText("Direction");
waveDirectionLayout.addItem(wave_direction_label);
var wave_direction_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/waves-from-deg")));
waveDirectionLayout.addItem(wave_direction_value);
waveLayout.addItem(waveDirectionLayout);

#wave amplitude value
var waveAmplitudeLayout = canvas.VBoxLayout.new();
var wave_amplitude_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
  .setFixedSize(75,25)
  .setText("Amplitude");
waveAmplitudeLayout.addItem(wave_amplitude_label);
var wave_amplitude_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("/fdm/jsbsim/hydro/environment/wave-amplitude-ft")));
waveAmplitudeLayout.addItem(wave_amplitude_value);
waveLayout.addItem(waveAmplitudeLayout);

#wave length value
#var waveLengthLayout = canvas.VBoxLayout.new();
#var wave_length_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
#  .setFixedSize(75,25)
#  .setText("Length");
#waveLengthLayout.addItem(wave_length_label);
#var wave_length_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
#  .setFixedSize(75,25)
#  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-length-ft")));
#waveLengthLayout.addItem(wave_length_value);
#waveLayout.addItem(waveLengthLayout);

#wave frequency value
var waveFrequencyLayout = canvas.VBoxLayout.new();
var wave_frequency_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
  .setFixedSize(75,25)
  .setText("Frequency");
waveFrequencyLayout.addItem(wave_frequency_label);
var wave_frequency_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-frequency")));
waveFrequencyLayout.addItem(wave_frequency_value);
waveLayout.addItem(waveFrequencyLayout);

#wave steepness value
var waveSteepnessLayout = canvas.VBoxLayout.new();
var wave_steepness_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
  .setFixedSize(75,25)
  .setText("Steepness");
waveSteepnessLayout.addItem(wave_steepness_label);
var wave_steepness_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-steepness")));
waveSteepnessLayout.addItem(wave_steepness_value);
waveLayout.addItem(waveSteepnessLayout);

#wave speed value
var waveSpeedLayout = canvas.VBoxLayout.new();
var wave_speed_label = canvas.gui.widgets.Label.new(root, canvas.style, {wordWrap: 0})
  .setFixedSize(75,25)
  .setText("Speed");
waveSpeedLayout.addItem(wave_speed_label);
var wave_speed_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-speed")));
waveSpeedLayout.addItem(wave_speed_value);
waveLayout.addItem(waveSpeedLayout);


#apply button
var wave_button = canvas.gui.widgets.Button.new(root, canvas.style, {})
	.setText("Apply Wave 0")
	.setFixedSize(100, 35);
wave_button.listen("clicked", func {
  # add code here to react on click on button.
  gui.popupTip("Wave 0 Direction: " ~ wave_direction_value.text() ~"\nWave 0 Amplitude: " ~ wave_amplitude_value.text());

var direction_x = -math.cos(0.017453293*wave_direction_value.text());
var direction_y =  math.sin(0.017453293*wave_direction_value.text());
setprop("fdm/jsbsim/hydro/environment/wave-0-direction-x",direction_x);
setprop("fdm/jsbsim/hydro/environment/wave-0-direction-y",direction_y);

  setprop("fdm/jsbsim/hydro/environment/wave-amplitude-ft",wave_amplitude_value.text());
  setprop("fdm/jsbsim/hydro/environment/waves-from-deg",wave_direction_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-0-frequency",wave_frequency_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-0-steepness",wave_steepness_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-0-speed",wave_speed_value.text());
});
waveLayout.addItem(wave_button);

#add the wave h-layout to the canvas v-layout
#vbox.addItem(waveLayout);



############### WAVE 1 ###############
var wave1Layout = canvas.HBoxLayout.new();
#wave-1 direction value
var wave1DirectionLayout = canvas.VBoxLayout.new();

var wave1_direction_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-1-from-deg")));
wave1DirectionLayout.addItem(wave1_direction_value);
wave1Layout.addItem(wave1DirectionLayout);

#wave amplitude value
var wave1AmplitudeLayout = canvas.VBoxLayout.new();

var wave1_amplitude_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("/fdm/jsbsim/hydro/environment/wave-1-amplitude-ft")));
wave1AmplitudeLayout.addItem(wave1_amplitude_value);
wave1Layout.addItem(wave1AmplitudeLayout);

#wave length value
#var wave1LengthLayout = canvas.VBoxLayout.new();

#var wave1_length_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
#  .setFixedSize(75,25)
#  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-1-length-ft")));
#wave1LengthLayout.addItem(wave1_length_value);
#wave1Layout.addItem(wave1LengthLayout);

#frequency
var wave1FrequencyLayout = canvas.VBoxLayout.new();
var wave1_frequency_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-1-frequency")));
wave1FrequencyLayout.addItem(wave1_frequency_value);
wave1Layout.addItem(wave1FrequencyLayout);

#wave steepness value
var wave1SteepnessLayout = canvas.VBoxLayout.new();

var wave1_steepness_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-1-steepness")));
wave1SteepnessLayout.addItem(wave1_steepness_value);
wave1Layout.addItem(wave1SteepnessLayout);

#wave speed value
var wave1SpeedLayout = canvas.VBoxLayout.new();

var wave1_speed_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-1-speed")));
wave1SpeedLayout.addItem(wave1_speed_value);
wave1Layout.addItem(wave1SpeedLayout);

#apply button
var wave1_button = canvas.gui.widgets.Button.new(root, canvas.style, {})
	.setText("Apply Wave 1")
	.setFixedSize(100, 35);
wave1_button.listen("clicked", func {
  # add code here to react on click on button.
  gui.popupTip("Wave 1 Direction: " ~ wave1_direction_value.text() ~"\nWave 1 Amplitude: " ~ wave1_amplitude_value.text());

var direction_x = -math.cos(0.017453293*wave1_direction_value.text());
var direction_y =  math.sin(0.017453293*wave1_direction_value.text());
setprop("fdm/jsbsim/hydro/environment/wave-1-direction-x",direction_x);
setprop("fdm/jsbsim/hydro/environment/wave-1-direction-y",direction_y);

  setprop("fdm/jsbsim/hydro/environment/wave-1-amplitude-ft",wave1_amplitude_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-1-from-deg",wave1_direction_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-1-frequency",wave1_frequency_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-1-steepness",wave1_steepness_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-1-speed",wave1_speed_value.text());
});
wave1Layout.addItem(wave1_button);

############### WAVE 2 ###############
var wave2Layout = canvas.HBoxLayout.new();
#wave-2 direction value
var wave2DirectionLayout = canvas.VBoxLayout.new();

var wave2_direction_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-2-from-deg")));
wave2DirectionLayout.addItem(wave2_direction_value);
wave2Layout.addItem(wave2DirectionLayout);

#wave amplitude value
var wave2AmplitudeLayout = canvas.VBoxLayout.new();

var wave2_amplitude_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("/fdm/jsbsim/hydro/environment/wave-2-amplitude-ft")));
wave2AmplitudeLayout.addItem(wave2_amplitude_value);
wave2Layout.addItem(wave2AmplitudeLayout);

#wave length value
#var wave2LengthLayout = canvas.VBoxLayout.new();

#var wave2_length_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
#  .setFixedSize(75,25)
#  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-2-length-ft")));
#wave2LengthLayout.addItem(wave2_length_value);
#wave2Layout.addItem(wave2LengthLayout);

#frequency
var wave2FrequencyLayout = canvas.VBoxLayout.new();
var wave2_frequency_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-2-frequency")));
wave2FrequencyLayout.addItem(wave2_frequency_value);
wave2Layout.addItem(wave2FrequencyLayout);

#wave steepness value
var wave2SteepnessLayout = canvas.VBoxLayout.new();

var wave2_steepness_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-2-steepness")));
wave2SteepnessLayout.addItem(wave2_steepness_value);
wave2Layout.addItem(wave2SteepnessLayout);

#wave speed value
var wave2SpeedLayout = canvas.VBoxLayout.new();

var wave2_speed_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-2-speed")));
wave2SpeedLayout.addItem(wave2_speed_value);
wave2Layout.addItem(wave2SpeedLayout);

#apply button
var wave2_button = canvas.gui.widgets.Button.new(root, canvas.style, {})
	.setText("Apply Wave 2")
	.setFixedSize(100, 35);
wave2_button.listen("clicked", func {
  # add code here to react on click on button.
  gui.popupTip("Wave 2 Direction: " ~ wave2_direction_value.text() ~"\nWave 2 Amplitude: " ~ wave2_amplitude_value.text());

var direction_x = -math.cos(0.017453293*wave2_direction_value.text());
var direction_y =  math.sin(0.017453293*wave2_direction_value.text());
setprop("fdm/jsbsim/hydro/environment/wave-2-direction-x",direction_x);
setprop("fdm/jsbsim/hydro/environment/wave-2-direction-y",direction_y);

  setprop("fdm/jsbsim/hydro/environment/wave-2-amplitude-ft",wave2_amplitude_value.text());
  setprop("fdm/jsbsim/hydro/environment/waves-2-from-deg",wave2_direction_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-2-frequency",wave2_frequency_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-2-steepness",wave2_steepness_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-2-speed",wave2_speed_value.text());
});
wave2Layout.addItem(wave2_button);


############### WAVE 3 ###############
var wave3Layout = canvas.HBoxLayout.new();
#wave-3 direction value
var wave3DirectionLayout = canvas.VBoxLayout.new();

var wave3_direction_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-3-from-deg")));
wave3DirectionLayout.addItem(wave3_direction_value);
wave3Layout.addItem(wave3DirectionLayout);

#wave amplitude value
var wave3AmplitudeLayout = canvas.VBoxLayout.new();

var wave3_amplitude_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("/fdm/jsbsim/hydro/environment/wave-3-amplitude-ft")));
wave3AmplitudeLayout.addItem(wave3_amplitude_value);
wave3Layout.addItem(wave3AmplitudeLayout);

#wave length value
#var wave3LengthLayout = canvas.VBoxLayout.new();

#var wave3_length_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
#  .setFixedSize(75,25)
#  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-3-length-ft")));
#wave3LengthLayout.addItem(wave3_length_value);
#wave3Layout.addItem(wave3LengthLayout);

#frequency
var wave3FrequencyLayout = canvas.VBoxLayout.new();
var wave3_frequency_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-3-frequency")));
wave3FrequencyLayout.addItem(wave3_frequency_value);
wave3Layout.addItem(wave3FrequencyLayout);

#wave steepness value
var wave3SteepnessLayout = canvas.VBoxLayout.new();

var wave3_steepness_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-3-steepness")));
wave3SteepnessLayout.addItem(wave3_steepness_value);
wave3Layout.addItem(wave3SteepnessLayout);

#wave speed value
var wave3SpeedLayout = canvas.VBoxLayout.new();

var wave3_speed_value = canvas.gui.widgets.LineEdit.new(root, canvas.style, {})
  .setFixedSize(75,25)
  .setText(sprintf("%.2f",getprop("fdm/jsbsim/hydro/environment/wave-3-speed")));
wave3SpeedLayout.addItem(wave3_speed_value);
wave3Layout.addItem(wave3SpeedLayout);

#apply button
var wave3_button = canvas.gui.widgets.Button.new(root, canvas.style, {})
	.setText("Apply Wave 3")
	.setFixedSize(100, 35);
wave3_button.listen("clicked", func {
  # add code here to react on click on button.
  gui.popupTip("Wave 3 Direction: " ~ wave3_direction_value.text() ~"\nWave 3 Amplitude: " ~ wave3_amplitude_value.text());

var direction_x = -math.cos(0.017453293*wave3_direction_value.text());
var direction_y =  math.sin(0.017453293*wave3_direction_value.text());
setprop("fdm/jsbsim/hydro/environment/wave-3-direction-x",direction_x);
setprop("fdm/jsbsim/hydro/environment/wave-3-direction-y",direction_y);

  setprop("fdm/jsbsim/hydro/environment/wave-3-amplitude-ft",wave3_amplitude_value.text());
  setprop("fdm/jsbsim/hydro/environment/waves-3-from-deg",wave3_direction_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-3-frequency",wave3_frequency_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-3-steepness",wave3_steepness_value.text());
  setprop("fdm/jsbsim/hydro/environment/wave-3-speed",wave3_speed_value.text());
});
wave3Layout.addItem(wave3_button);



#add the wave h-layouts to the canvas v-layout
vbox.addItem(waveLayout);
vbox.addItem(wave1Layout);
vbox.addItem(wave2Layout);
vbox.addItem(wave3Layout);




    ###KICK OFF THE UPDATES###
    window.update();


var hide = func(){
     window.del();
}

var show = func(){
#    myCanvas.setColorBackground(rgb[0],rgb[1],rgb[2], 1);
    window.show();
}


# the del() function is the destructor of the Window which will be called upon termination (dialog closing)
# use this to do resource management
window.del = func()
{
  print("Cleaning up wind-wave window:",title,"\n");
# explanation for the call() technique at: http://wiki.flightgear.org/Object_oriented_programming_in_Nasal#Making_safer_base-class_calls
  window.clearFocus();
  print("Stopping the wind-wave timer");
#  timer.stop();
  window.hide();
#  call(canvas.window.del, [], me);

};



####UPDATE DISPLAYS####
var update = func(){

    #update wind indicator/data
#    wind_direction_value.setText(sprintf("%.2f",getprop("/environment/wind-from-heading-deg")));
#    wind_speed_value.setText(sprintf("%.2f",getprop("/environment/wind-speed-kt")));

#    wave_amplitude_value.setText(sprintf("%.2f",getprop("/fdm/jsbsim/hydro/environment/wave-amplitude-ft")));
#    wave_frequency_value.setText(sprintf("%.2f",getprop("/fdm/jsbsim/hydro/environment/wave-length-ft")));

} #end of update function
