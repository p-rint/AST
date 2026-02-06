shader_type spatial;

uniform sampler2D heightmap : source_color;

uniform float amplitude : hint_range(0.0, 1.0, 0.1);

void vertex() {
	// Called for every vertex the material is visible on.
	vec4 height = texture(heightmap, UV + .5);
	
	VERTEX.y = height.r * .2;//amplitude;
	
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 height = texture(heightmap, UV);
	ALBEDO = height.rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
