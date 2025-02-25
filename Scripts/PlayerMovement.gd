extends CharacterBody3D

var speed: float = 5.0
var rotation_speed: float = 2.0

func _physics_process(delta: float) -> void:
	# Initialize movement direction
	var direction = Vector3.ZERO

	if Input.is_action_pressed("ui_up"):
		direction -= transform.basis.z
	if Input.is_action_pressed("ui_down"):
		direction += transform.basis.z
	if Input.is_action_pressed("ui_left"):
		rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-rotation_speed * delta)
		
	direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()
