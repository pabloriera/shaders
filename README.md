# Taller básico de código creativo con Shaders I.   
### 15:30 hs. Taller. Aula - taller.   

¡Vení a programar y a experimentar efectos visuales con las técnicas que se usan en los videojuegos! Los programadores, artistas y docentes (¡sí… todo eso!) Pablo Riera y Diego Alberti te invitan a jugar con la excusa de ver cómo funcionan las placas de video. ¡Para participar de este taller no necesitás saber programación! 

Las entradas se retiran a partir de las 13 horas en el hall de entrada del C3. CUPO LIMITADO. + 8 años. 

# Taller "no tan básico" de código creativo con Shaders II. 
### 17:30 hs. Taller. Aula - taller. 

En este taller los programadores, artistas y docentes Pablo Riera y Diego Alberti te van a presentar a shaders y al lenguaje de sombreado GLSL que sirven para transformar y crear efectos especiales. Básicamente, vas a procesar el color de todos los pixeles de la pantalla. ¡OK! Después de esta descripción, tenés dos opciones: o Googleás todo esto… o ¡venís al taller! Así que… ¡Te esperamos! 
Las entradas se retiran a partir de las 13 horas en el hall de entrada del C3. CUPO LIMITADO. + 15 años. 

# Recursos web para jugar con Shaders

Hay varias páginas que ofrecen editores y visualizadores de Shaders

Página sencilla, directo al grano
[GLSL Sandbox](http://glslsandbox.com/)

Editor del libro de shaders, permite incorporar imágenes
[Editor del libro de shaders](http://editor.thebookofshaders.com/)

Editor con la posibilidad de manejar valores con perillas
[Interactive Shader Format](https://www.interactiveshaderformat.com)

Página no tan sencilla, con muchas opciones, pero con variaciones en el lenguaje utilizado
[Shadertoy](https://www.shadertoy.com)

Página simple, con ejemplo para utilizar estructuras 3D y Vertex Shaders.
[SHDR](http://shdr.bkcore.com/)

## ¿Qué es un shader?

El libro de los shaders es un proyecto del artista Patricio Gonzalez Vivo. Ahí se pueden encontrar las explicaciones básicas sobre qué son los Shaders y muchos ejemplos para ir aprendiendo

[El libro de los shaders](http://patriciogonzalezvivo.com/2015/thebookofshaders/00/?lan=es)

## Galerias

[Patricio Gonzalez Vivo](http://patriciogonzalezvivo.github.io/glslGallery)

## Ejemplos para empezar

[Teoría del color](http://editor.thebookofshaders.com/?log=160826175515)
[Teoría del color](http://glslsandbox.com/e#34861.0)

<img src="https://github.com/pabloriera/shaders/blob/master/images/color.png?raw=true" width="100px"/>

[Tablero Ajedrez](http://glslsandbox.com/e#34775.0)

<img src="https://github.com/pabloriera/shaders/blob/master/images/tablero.png?raw=true" width="100px"/>

[Tablero Ajedrez Rotado](http://glslsandbox.com/e#34775.1)

<img src="https://github.com/pabloriera/shaders/blob/master/images/tablero2.png?raw=true" width="100px"/>

## Ejemplos Varios

[Estela para dibujar](http://glslsandbox.com/e#34862.0)

[Efecto voronoi](http://glslsandbox.com/e#31898.0)

[Fractal con colores](http://glslsandbox.com/e#31676.0)

[Órbitas](http://glslsandbox.com/e#32891.1)

[Trazos generativos](http://glslsandbox.com/e#33112.8)

[Mandelbrot](http://glslsandbox.com/e#34708.3)

[Cuadricula ruidosa](http://glslsandbox.com/e#32420.2)

[Cuadricula rotada](http://glslsandbox.com/e#31765.4)

[Fuego](http://glslsandbox.com/e#31528.0)

[Juego de la vida](http://glslsandbox.com/e#21541.3)

[Caminata al azar](http://glslsandbox.com/e#34866.9)

## Funciones útiles

Círculo
``` C
float circle(vec2 p,float x,float y,float rad)
{
	return 1.0-smoothstep(rad*0.8,rad*1.01,distance(p,vec2(x,y)));	
}
```

Segmento

``` C
float segment(vec2 v, vec2 w, vec2 p,float size) {
  // Return minimum distance between line segment vw and point p
  float l2 = pow(distance(v,w),2.);  // i.e. |w-v|^2 -  avoid a sqrt
	
  if (l2 == 0.0) return distance(p, v);   // v == w case
  // Consider the line extending the segment, parameterized as v + t (w - v).
  // We find projection of point p onto the line. 
  // It falls where t = [(p-v) . (w-v)] / |w-v|^2
  // We clamp t from [0,1] to handle points outside the segment vw.
  float t = max(0., min(1.0, dot(p - v, w - v) / l2));
  vec2 projection = v + t * (w - v);  // Projection falls on the segment
  float d = distance(p, projection);
  return smoothstep(0.6*size,1.4*size,d);
}
```

Numeros aleatorios en dos dimensiones
``` C
float random2D(vec2 st) { 
    return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}
```

Numeros aleatorios en dos dimensiones con semilla asignable
``` C
float random2D(vec2 st,vec2 seed) { 
    return fract(sin(dot(st.xy, seed))* 43758.5453123);
}
```

Numeros aleatorios 1D
``` C
float random1D(float x)
{
	return (0.5-fract(sin(x)*124321.0354));
}
```
