extends Node

var is_interface_active: bool = false
var player_pos: Vector3
var test_int: int = 0

var apartment = "res://Scenes/apartment.tscn"
var interface = "res://Scenes/interface.tscn"

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("tab"):
		is_interface_active = !is_interface_active
		if is_interface_active:
			get_tree().change_scene_to_file(interface)
		else:
			get_tree().change_scene_to_file(apartment)
