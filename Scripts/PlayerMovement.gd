extends CharacterBody3D

var speed: float = 3
var rotation_speed: float = 3

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction -= transform.basis.z
	if Input.is_action_pressed("ui_down"):
		direction += transform.basis.z
	
	if Input.is_action_pressed("ui_left") and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) or Input.is_action_pressed("ui_end"):
		direction -= transform.basis.x
	if Input.is_action_pressed("ui_left"):
		rotate_y(rotation_speed * delta)
	if Input.is_action_pressed("ui_right") and Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) or Input.is_action_pressed("ui_page_down"):
		direction += transform.basis.x
	if Input.is_action_pressed("ui_right"):
		rotate_y(-rotation_speed * delta)
	
	direction = direction.normalized()
	
	velocity = direction * speed
	move_and_slide()
