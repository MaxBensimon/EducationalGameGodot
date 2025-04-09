extends CharacterBody2D

var max_speed = 300
var acceleration = 1500
var friction = 1200
var jump_velocity = -400

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = input_dir.normalized()
	
	if direction:
		velocity.x = move_toward(velocity.x, direction.x * max_speed, acceleration * delta)
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("forward") or Input.is_action_just_pressed("jump"):
			velocity.y = jump_velocity
	
	move_and_slide()
