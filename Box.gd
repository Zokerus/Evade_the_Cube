extends CharacterBody3D
class_name Box

enum BOXTYPE {RANDOM, FOOD, POISON}

const SPEED = 5.0
@export var box_type: BOXTYPE = BOXTYPE.RANDOM

@onready var body = $body

func _init():
	pass

func _ready():
	if box_type == BOXTYPE.RANDOM:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		box_type = randi_range(0,1)+1

	if box_type == BOXTYPE.FOOD:
		body.get_surface_override_material(0).albedo_color = "ff8e61"
	else:
		body.get_surface_override_material(0).albedo_color = "ff1161"

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = (transform.basis * Vector3(0, 0, 1)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
