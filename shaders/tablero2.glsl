#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

#define divide(what, part) floor(what * part) / part

void main( void ) {

	vec2 pos = gl_FragCoord.xy / resolution.y;
	
	float cuadros = 5.0;
	
	// cuadros
	vec2 grid = divide(pos,cuadros)*cuadros;
	
	// alternancia blanco negro
	float A= mod(grid.x,2.0);
	float B= mod(grid.y,2.0);

	// funcion xor
	float color = A*(1.-B)+B*(1.-A);
	
	gl_FragColor = vec4(color);
}