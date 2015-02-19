#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

uniform vec2 resolution;
uniform sampler2D texture;

void main(void) {
    vec2 p = -1.0 + 2.0 * gl_FragCoord.xy / resolution.xy;
    float a = atan(p.y,p.x);
    float r = sqrt(dot(p,p));
    vec2 uv;
	uv.x = (a + 3.14159265359)/6.28318530718;
	uv.y = r / sqrt(2.0);
    vec3 col = texture2D(texture, uv).rgb;
    gl_FragColor = vec4(col, 1.0);
}
