#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform sampler2D texture;
uniform vec2 resolution;
uniform float time;
uniform vec3 m;

void main(void) {
  	vec2 p = gl_FragCoord.xy / resolution.xy;
	
	vec2 p1 = vec2(p.x, mod(time*m.x, 1.0));
	vec2 p2 = vec2(mod(time*m.y, 1.0), p.y);
	
	float mode = floor(m.z);
	
	float rx = texture2D(texture, p1).r;
	float ry = texture2D(texture, p2).r;
	float gx = texture2D(texture, p1).g;
	float gy = texture2D(texture, p2).g;
	float bx = texture2D(texture, p1).b;
	float by = texture2D(texture, p2).b;
	float r, g, b;
	if (mode==0.0) {
		r = rx * ry;
		g = gx * gy;
		b = bx * by;
	} else if (mode==1.0) {
		r = rx * ry;
		g = gx * by;
		b = bx * gy;
	} else if (mode==2.0) {
		r = rx * gy;
		g = gx * ry;
		b = bx * by;
	} else if (mode==3.0) {
		r = rx * gy;
		g = gx * by;
		b = bx * ry;
	} else if (mode==4.0) {
		r = rx * by;
		g = gx * ry;
		b = bx * gy;
	} else if (mode==5.0) {
		r = rx * by;
		g = gx * gy;
		b = bx * ry;
	} else if (mode==6.0) {
		r = 0.3333333 * (rx*ry + gx*gy + bx*by);
		g = r;
		b = r;
	}	
  	gl_FragColor = vec4(r, g, b, 1.0);
}

