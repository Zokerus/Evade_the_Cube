extends CharacterBody3D

const SPEED = 5.0

var health_points: int = 50

signal health_changed(hp: int)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir : float = Input.get_axis("Left", "Right")
	var direction = (transform.basis * Vector3(input_dir, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_area_3d_body_entered(body):
	if body is Box:
		if body.box_type == 2:
			get_damage()
		body.queue_free()
	
func get_damage():
	health_points -= 10
	health_changed.emit(health_points)
	if health_points <= 0:
		get_tree().reload_current_scene()

func missed_food(body):
	if body is Box:
		if body.box_type == 1:
			get_damage()
		body.queue_free()
