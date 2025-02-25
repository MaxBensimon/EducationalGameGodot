extends Node3D

var camera_offset = Vector3(5, 8, 3)
var camera_angle: float = deg_to_rad(-55)

func _process(delta: float) -> void:
	global_position = get_parent().global_position + camera_offset
	$Camera3D.look_at(get_parent().global_position)
	$Camera3D.rotation.x = camera_angle
