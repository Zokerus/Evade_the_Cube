extends Node3D

@onready var boxes = $Boxes

var box = preload("res://Box.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()

	var new_box = box.instantiate()
	new_box.position.x = rng.randf_range(-4.5, 4.5)
	boxes.add_child(new_box)
