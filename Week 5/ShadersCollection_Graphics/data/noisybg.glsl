#define PROCESSING_COLOR_SHADER

uniform float time;
uniform vec2 resolution;
uniform vec3 noiseFactor;
uniform vec3 col;

vec4 randomizer4(const vec4 x)
{
    vec4 z = mod(x, vec4(5612.0));
    z = mod(z, vec4(3.1415927 * 2.0));
    return(fract(cos(z) * vec4(56812.5453)));
}

// Fast computed noise
// http://www.gamedev.net/topic/502913-fast-computed-noise/

const float A = 1.0;
const float B = 57.0;
const float C = 113.0;
const vec3 ABC = vec3(A, B, C);
const vec4 A3 = vec4(0, B, C, C+B);
const vec4 A4 = vec4(A, A+B, C+A, C+A+B);

float cnoise4(const in vec3 xx)
{
    vec3 x = mod(xx + 32768.0, 65536.0);
    vec3 ix = floor(x);
    vec3 fx = fract(x);
    vec3 wx = fx*fx*(3.0-2.0*fx);
    float nn = dot(ix, ABC);

    vec4 N1 = nn + A3;
    vec4 N2 = nn + A4;
    vec4 R1 = randomizer4(N1);
    vec4 R2 = randomizer4(N2);
    vec4 R = mix(R1, R2, wx.x);
    float re = mix(mix(R.x, R.y, wx.y), mix(R.z, R.w, wx.y), wx.z);

    return 1.0 - 2.0 * re;
}

	
void main( void ) {
	vec2 p = gl_FragCoord.xy / resolution.xy;
	float c = cnoise4(vec3(noiseFactor.x * p.x, noiseFactor.y * p.y, noiseFactor.z * time));	
	float r = col.r + (c-0.5)*0.2;
	float g = col.g + (c-0.5)*0.2;
	float b = col.b + (c-0.5)*0.2;	
	gl_FragColor = vec4(r, g, b, 1.0);
}