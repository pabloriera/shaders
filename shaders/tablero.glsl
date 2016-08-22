#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	vec2 uv = ( gl_FragCoord.xy / resolution.xy ) * 2.0 - 1.0;
	uv.x *= resolution.x / resolution.y;
	uv *= 5.0;

	float t = mod( floor(uv.x) + floor(uv.y), 2.0);

	gl_FragColor = vec4( vec3( t ), 1.0 );

}