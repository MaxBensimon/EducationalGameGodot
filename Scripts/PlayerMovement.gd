extends CharacterBody3D

# Movement speed (units per second)
var speed: float = 5.0

# Rotation speed (in radians per second)
var rotation_speed: float = 2.0

func _process(delta: float) -> void:
	# Handle camera rotation (left/right input)
	if Input.is_action_pressed("ui_end"):
		rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("ui_page_down"):
		rotate_y(-rotation_speed * delta)

func _physics_process(delta: float) -> void:
	# Initialize movement direction
	var direction = Vector3.ZERO

	# Get input and adjust movement relative to the player's local axes
	if Input.is_action_pressed("ui_up"):    # W key (forward)
		direction -= transform.basis.z
	if Input.is_action_pressed("ui_down"):  # S key (backward)
		direction += transform.basis.z
	if Input.is_action_pressed("ui_left"):  # A key (strafe left)
		direction -= transform.basis.x
	if Input.is_action_pressed("ui_right"): # D key (strafe right)
		direction += transform.basis.x

	# Normalize the direction to prevent faster diagonal movement
	direction = direction.normalized()

	# Move the player
	velocity = direction * speed
	move_and_slide()
