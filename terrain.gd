extends StaticBody3D

@onready var collider: CollisionShape3D = $Collision
@onready var floor: MeshInstance3D = $Floor

var hmap = Image.new()

@onready var amplitude


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	makeCollision()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func makeCollision():
	#hmap = floor.get_surface_override_material(0).get("shader_parameter/heightmap")
	
	
	hmap.load("res://noise2.png")
	hmap.convert(Image.FORMAT_RF)

	amplitude = floor.get_surface_override_material(0).get("shader_parameter/amplitude")
	print(hmap.get_width())
	
	hmap.resize(hmap.get_width() + 1, hmap.get_height() + 1)
	print(hmap.get_width())
	
	
	var newWidth = 1/float(hmap.get_width())
	var newHeight = 1/float(hmap.get_height())
	
	collider.scale = Vector3(newWidth, 1, newHeight)
	print()
	
	
	collider.shape.map_width = hmap.get_width()
	collider.shape.map_depth = hmap.get_height()
	
	var float_array : PackedFloat32Array
	for y in hmap.get_height():
		for x in hmap.get_width():
			float_array.push_back(float(hmap.get_pixel(x,y).r) / 5.0)
			
	
	collider.shape.map_data = float_array
	
	
	#print(collider.shape.map_data)
	
	
