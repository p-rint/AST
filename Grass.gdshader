shader_type spatial;
render_mode cull_disabled;

varying vec4 worldPos;

uniform float windPower : hint_range(0.0, .7, 0.1);

uniform sampler2D noiseTex : source_color;

uniform float windNoiseScale : hint_range(0.0, .3, 0.01);

uniform vec2 windSpeed;

varying vec4 noi;

uniform sampler2D grass_color : source_color;

varying float height;

void vertex() {
	// Called for every vertex the material is visible on.
	worldPos = (MODEL_MATRIX) * vec4(VERTEX, 1.0);
	
	height = 1.0 - UV.y;
	
	//NORMAL = vec3(0,1,0);
	
	noi = texture(noiseTex, (worldPos.xz * windNoiseScale) + TIME * windSpeed);
	
	float new = noi.r;
	VERTEX.xz += new * windPower * pow(height, 2);
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec3 grassCol = texture(grass_color, vec2(height)).rgb;
	vec3 finCol = mix(grassCol, noi.rgb,.1);
	ALBEDO = 
	ALBEDO = finCol;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
