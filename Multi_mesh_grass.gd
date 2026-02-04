@tool
extends MultiMeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	multi()
	
	print("Done")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func multi():
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
		
	multimesh.instance_count = 1000
	multimesh.visible_instance_count = 1000
		
	var index = 0
	for i in 30:
		for j in 30:
			var b = Basis().rotated(Vector3.UP, randf_range(0, PI * 2))
			var t = Transform3D(b, Vector3(i * .5,0, j * .5))
			multimesh.set_instance_transform(index, t)
			print(i)
			index += 1
