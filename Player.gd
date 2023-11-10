extends CharacterBody3D

const SPEED = 5.0

var health_points: int = 50

signal health_changed(hp: int)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right","ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _on_area_3d_body_entered(body):
	if body is Box:
		if body.box_type == 1:
			eat_food()
		else:
			eat_poison()
		body.queue_free()

func eat_food():
	print("food")
	
func eat_poison():
	health_points -= 10
	health_changed.emit(health_points)
