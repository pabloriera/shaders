#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	vec2 pos = gl_FragCoord.xy / resolution;
	
	float x = 0.0;
	float y = 0.0;
	
	x = pos.x;
	y = pos.y;	
	
	gl_FragColor = vec4(x,y,0.0,1.0);
}