#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 resolution;
uniform float time;
uniform vec4 m;


void main(void) {
  	vec2 p = gl_FragCoord.xy / resolution.xy;
	p.y = 1.0 - p.y;
	
	vec3 col = texture2D(texture, p).rgb;
	
	col.r -= mod(col.r, m.x);
	col.g -= mod(col.g, m.x);
	col.b -= mod(col.b, m.y);
	
	col.r += mod(time*m.z, p.x);
	col.b += mod(time*0.1, 0.2);
  	gl_FragColor = vec4(col, 1.0);
}

