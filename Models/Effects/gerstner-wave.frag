#version 120

varying in vec3 oNormal;
varying in vec4 oColor;
varying in float oHeight;

void main()
{

vec3 oNormal;

//vec4 oColor; = vec4(0.1, 0.2, height, 0.8);

//  oNormal = gl_NormalMatrix * oNormal;
//  gl_FragColor = oColor;
  gl_FragColor = vec4(oHeight, oHeight, 1.0, 0.8);

}
