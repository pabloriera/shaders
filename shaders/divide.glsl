#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

#define divide(what, part) floor(what * part) / part

void main( void ) {

	vec2 uv = gl_FragCoord.xy / min(resolution.x , resolution.y);
	uv = divide(uv, 5.0);
	float h = uv.y;
	
	gl_FragColor = vec4(h);
	
}