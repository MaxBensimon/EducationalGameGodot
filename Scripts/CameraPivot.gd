extends Node3D

var camera_offset = Vector3(0, 5, 5)
var camera_angle = Vector2(0, 0)
var sensitivity = .001

var camera_pivot_radius = 1
var character_radius = 22

func _ready() -> void:
	$Camera3D.position = camera_offset

func _process(delta: float) -> void:
	global_position = get_parent().global_position
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		camera_angle.x -= event.relative.x * sensitivity
		camera_angle.y -= event.relative.y * sensitivity 
		camera_angle.y = clamp(camera_angle.y, deg_to_rad(-25), deg_to_rad(45))
		
		rotation.y = camera_angle.x 
		rotation.x = camera_angle.y

		#var rotation_scale = character_radius / camera_pivot_radius
		#get_parent().rotation.y = camera_angle.x
