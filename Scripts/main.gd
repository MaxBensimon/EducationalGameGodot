extends Node3D
	
#func _ready() -> void:
		#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
#
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed:
			#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#if event is InputEventKey:
		#if event.pressed and event.keycode == KEY_ESCAPE:
			#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
