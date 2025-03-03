extends Camera3D

var distance_from_player := 10
var camera_sensitivity := .0025

var yaw := 0.0
var pitch := 0.0

func _ready() -> void:
		pitch = clamp(pitch, deg_to_rad(-89), deg_to_rad(-45))

func _input(event): # LEFT MOUSE is only camera. RIGHT MOUSE is camera and player direction
	if event is InputEventMouseMotion:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			yaw -= event.relative.x * camera_sensitivity
			pitch -= event.relative.y * camera_sensitivity
			pitch = clamp(pitch, deg_to_rad(-89), deg_to_rad(-25))
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
				snap_player_to_camera_direction()
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT or event.button_index == MOUSE_BUTTON_RIGHT:
			if not event.pressed:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _process(delta):
	var player = get_parent()
	
	var target_position = player.global_transform.origin
	var offset = Vector3(0, 0, distance_from_player)
	offset = offset.rotated(Vector3.UP, yaw)
	
	var right = offset.cross(Vector3.DOWN).normalized()
	offset= offset.rotated(right, pitch)
	
	global_transform.origin = target_position + offset
	look_at(target_position, Vector3.UP)
	
func snap_player_to_camera_direction():
	var player = get_parent()
	var camera_forward = global_transform.basis.z
	camera_forward.y = 0
	camera_forward = camera_forward.normalized()
	
	var target_rotation = atan2(camera_forward.x, camera_forward.z)
	
	player.rotation.y = target_rotation
