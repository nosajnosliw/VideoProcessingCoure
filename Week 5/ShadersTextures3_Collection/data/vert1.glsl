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
	
	p.x -= mod(p.x, m.x);
	p.y -= mod(p.y, m.y);	
	p.y = mod(p.y + m.z*sin(m.a * time * p.x + p.x), 1.0);
	p.y = 1.0-p.y;

	float r = texture2D(texture, p).r;
	float g = texture2D(texture, p).g;
	float b = texture2D(texture, p).b;
	
  	gl_FragColor = vec4(r, g, b, 1.0);
}

