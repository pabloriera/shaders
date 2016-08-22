#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {

	vec2 pos = (gl_FragCoord.xy-resolution/2.) / resolution;
	
	float color=0.0;
	
	if (pos.x>=0.0)
	{
		color=1.0;
	}
	
	gl_FragColor = vec4(color);
