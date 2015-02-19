#define PROCESSING_COLOR_SHADER

#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform float bright;
uniform float brightFloor;
uniform vec2 resolution;

void main( void ) {

	vec2 position = ( gl_FragCoord.xy / resolution.xy );

	float color = 0.0;

	color += sin( position.y * cos( time / 19.0 ) * 23.0 )  +  cos( position.x * cos( time / 19.0 ) * 19.0 );
	color += sin( position.x * sin( time / 20.0 ) * 42.0 )  +  cos( position.y * sin( time / 20.0 ) * 14.0 );
	color += sin( position.y * sin( time / 35.0 ) * 15.0 )  +  sin( position.x * sin( time / 35.0 ) * 33.0 );

	color *= sin( time / 32.0 ) * 0.4;
	
	gl_FragColor = vec4( vec3( brightFloor + color * 0.6 * bright, brightFloor + color * bright, brightFloor + sin( color + time / 3.0 ) * 0.75 * bright), 1.0 );

}
