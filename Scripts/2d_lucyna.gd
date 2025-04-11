extends CharacterBody2D

var speed = 300
var friction = 2500

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = input_dir.normalized()
	
	if direction:
		velocity = input_dir * speed
	else:
		velocity.x = move_toward(velocity.x, 0, friction * delta)
		velocity.y = move_toward(velocity.y, 0, friction * delta)
	
	move_and_slide()

# This function closes the game when the Escape-key is pressed
func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT): # or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
