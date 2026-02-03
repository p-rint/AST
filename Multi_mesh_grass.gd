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
	multimesh.visible_instance_count = 100
		
	var index = 0
	for i in 10:
		for j in 10:
			multimesh.set_instance_transform(index, Transform3D(Basis(), Vector3(i * .5,0, j * .5)))
			print(i)
			index += 1
