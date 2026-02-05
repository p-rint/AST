#@tool
extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN

# Generate 512x512 image
	var image = noise.get_image(128, 128)
	image.save_png("res://noise_output.png")
