extends CharacterBody3D

@onready var armature = $Armature
@onready var springArmPivot = $SpringArmPivot
@onready var springArm = $SpringArmPivot/SpringArm3D
@onready var animationTree = $AnimationTree

var speed: float = 3
var rotation_speed: float = 3
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var springArmRotationLock =  5.5 # This value is crazy
var mouseSensitivity = .001

const LERP_VALUE = .15

func _ready() -> void:
	springArm.rotation.x = springArmRotationLock

# This function closes the game when the Escape-key is pressed
func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT): # or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			springArmPivot.rotate_y(-event.relative.x * mouseSensitivity)
			#springArm.rotate_x(-event.relative.y * .0025)
			springArm.rotation.x = springArmRotationLock #clamp(springArm.rotation.x, -PI/4, PI/16)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	var input_dir = Input.get_vector("left", "right", "forward", "back")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	direction = direction.rotated(Vector3.UP, springArmPivot.rotation.y)

	if direction:
		velocity.x = lerp(velocity.x, direction.x * speed, LERP_VALUE) # Making velocity a lerp so that animations can interpolate smooothly
		velocity.z = lerp(velocity.z, direction.z * speed, LERP_VALUE)
		armature.rotation.y = lerp_angle(armature.rotation.y, atan2(-velocity.x, -velocity.z), LERP_VALUE) #Lerping the rotation of the armature so that it always faces the direction and not the camera pointing direction
	else:
		velocity.x = lerp(velocity.x, 0.0, LERP_VALUE)
		velocity.z = lerp(velocity.z, 0.0, LERP_VALUE)
	
	# Setting the property of the animation tree so that it knows what values to blend
	animationTree.set("parameters/BlendSpace1D/blend_position", velocity.length() / speed)
	
	move_and_slide()
