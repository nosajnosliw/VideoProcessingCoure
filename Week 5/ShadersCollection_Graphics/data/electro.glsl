// Electrocardiogram Effect
// Imported from http://www.geeks3d.com/20111223/shader-library-electrocardiogram-effect-glsl/

#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
uniform vec2 center;

float viewAngle = 0.0;//0.040*sin(0.1*time);
float speed = -1.0;
float rate = .50;
float baseamp = 0.10;

void main(void)
{
  vec2 p = -1.0 + 2.0 * ( gl_FragCoord.xy / resolution.xy ) - center.xy;
  vec2 op = p;
  p = vec2(distance(p, vec2(0, 0)), sin(0.80*time+atan(p.x, p.y)*5.0));
  float x = speed * viewAngle * time + rate * p.x;
  float base = (0.15 + 2.0*tan(x*0.7 + time)) * (1.72 + 2.5*sin(x*1.995 + time));
  float z = fract(0.025*x);
  z = max(z, 100.0-z);
  z = pow(z, 50.0);
  float pulse = exp(-1000000.0 * z);
  vec4 ecg_color = vec4(0.3, 1.0, 0.4, 1.0);
  vec4 c = pow(1.0-abs(p.y-(baseamp*base+pulse-0.5)), 16.0) * ecg_color;
  vec4 d = vec4(c.r, c.r, c.r, c.r);
  gl_FragColor = 1.0-d;
}