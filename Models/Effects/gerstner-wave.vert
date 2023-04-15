//  Copyright (C) 2023  Jeffery S. Koppe  (jeff.koppe@gmail.com)
//  This file is licensed under the GPL license version 2 or later.
//  heavily based on https://github.com/CaffeineViking/osgw/tree/master/share/shaders

#version 120

uniform float wave_time_sec;
varying out vec3 oNormal;
varying out vec4 oColor;
varying out float oHeight;

//uniform float waves_from_deg;
//uniform float wave_angular_frequency_rad_sec;
//uniform float wave_number_rad_ft;
//uniform float speed_north_fps;
//uniform float speed_east_fps;

//variables populated with wave attribute values passed in by wave.eff
uniform vec2 wave0_direction;
uniform float wave0_direction_x;
uniform float wave0_direction_y;
uniform float wave0_amplitude_ft;
uniform float wave0_steepness;
uniform float wave0_frequency;
uniform float wave0_speed;

uniform vec2 wave1_direction;
uniform float wave1_direction_x;
uniform float wave1_direction_y;
uniform float wave1_amplitude_ft;
uniform float wave1_steepness;
uniform float wave1_frequency;
uniform float wave1_speed;

uniform vec2 wave2_direction;
uniform float wave2_direction_x;
uniform float wave2_direction_y;
uniform float wave2_amplitude_ft;
uniform float wave2_steepness;
uniform float wave2_frequency;
uniform float wave2_speed;

uniform vec2 wave3_direction;
uniform float wave3_direction_x;
uniform float wave3_direction_y;
uniform float wave3_amplitude_ft;
uniform float wave3_steepness;
uniform float wave3_frequency;
uniform float wave3_speed;


const float pi = 3.14159;

//the number of waves processed (couldn't this be found from the length of gerstner_waves[]?)
int gerstner_waves_length = 4;

//structure to hold wave attributes
struct GerstnerWave {
    vec2 direction;
    float amplitude;
    float steepness;
    float frequency;
    float speed;
    float direction_x;
    float direction_y;
}

//the four separate gerstner waves
gerstner_waves[4] = GerstnerWave[4](
     GerstnerWave(vec2(0.0, 0.0), wave0_amplitude_ft, wave0_steepness, wave0_frequency, wave0_speed, wave0_direction_x, wave0_direction_y),
     GerstnerWave(vec2(0.0, 0.0), wave1_amplitude_ft, wave1_steepness, wave1_frequency, wave1_speed, wave1_direction_x, wave1_direction_y),
     GerstnerWave(vec2(0.0, 0.0), wave2_amplitude_ft, wave2_steepness, wave2_frequency, wave2_speed, wave2_direction_x, wave2_direction_y),
     GerstnerWave(vec2(0.0, 0.0), wave3_amplitude_ft, wave3_steepness, wave3_frequency, wave3_speed, wave3_direction_x, wave3_direction_y)
);





//gerstner functions
vec3 gerstner_wave_normal(vec3 position, float time) {
    vec3 wave_normal = vec3(0.0, 1.0, 0.0);
    for (int i = 0; i < gerstner_waves_length; ++i) {
        float proj = dot(position.xz, vec2(gerstner_waves[i].direction_x, gerstner_waves[i].direction_y)),
              phase = time * gerstner_waves[i].speed,
              psi = proj * gerstner_waves[i].frequency + phase,
              Af = gerstner_waves[i].amplitude *
                   gerstner_waves[i].frequency,
              alpha = Af * sin(psi);

        wave_normal.y -= gerstner_waves[i].steepness * alpha;

        float x = gerstner_waves[i].direction.x,
              y = gerstner_waves[i].direction.y,
              omega = Af * cos(psi);

        wave_normal.x -= x * omega;
        wave_normal.z -= y * omega;
    } return wave_normal;
}




vec3 gerstner_wave_position(vec2 position, float time) {
    vec3 wave_position = vec3(position.x, 0, position.y);

    for (int i = 0; i < gerstner_waves_length; ++i) {
        gerstner_waves[i].direction = vec2(gerstner_waves[i].direction_x, gerstner_waves[i].direction_y);
        float proj = dot(position, gerstner_waves[i].direction),
              phase = time * gerstner_waves[i].speed,
              theta = proj * gerstner_waves[i].frequency + phase,
              height = gerstner_waves[i].amplitude * sin(theta);

        wave_position.y += height * -1; // -1 necessary otherwise wave is upside down. why?

        float maximum_width = gerstner_waves[i].steepness *
                              gerstner_waves[i].amplitude,
              width = maximum_width * cos(theta),
              x = gerstner_waves[i].direction.x,
              y = gerstner_waves[i].direction.y;

        wave_position.x += x * width;
        wave_position.z += y * width;

    } return wave_position;
}



void main()
{
  vec4 oPosition;
  vec3 oNormal;

  oPosition = gl_Vertex;
  oNormal   = gl_Normal;

  //vertex position
  oPosition.xzy = gerstner_wave_position(oPosition.xy, wave_time_sec);

  //final vertex location
  gl_Position = gl_ModelViewProjectionMatrix * oPosition;




  //vertex normal
  oNormal = gerstner_wave_normal(oPosition.xyz, wave_time_sec);
//  oNormal = gl_NormalMatrix * oNormal;
  float alpha = -1 / oPosition.z;

  oColor = vec4(0.2, -alpha / 5, alpha, 0.7);
  oHeight = oPosition.z;

}
