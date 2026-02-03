shader_type spatial;


varying vec4 worldPos;

uniform float windPower : hint_range(0.0, .1, 0.1);

uniform sampler2D noiseTex : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
	worldPos = (MODEL_MATRIX) * vec4(1.0);
	
	float height = VERTEX.y;
	

	float new = (worldPos.x * (sin(TIME)));
	//float bend =
	
	vec4 noi = texture(noiseTex, worldPos.xy);
	VERTEX.x += new * windPower * pow(height, 2);
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 noi = texture(noiseTex, worldPos.xy * .1);
	ALBEDO = noi.rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
