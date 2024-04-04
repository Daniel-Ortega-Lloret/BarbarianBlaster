extends Node3D

@onready var label_3d: Label3D = $Label3D

@export var health: int = 5
@export var start_color = Color.WHITE
@export var finish_color = Color.RED


var current_health: int:
	set(health_in):
		current_health = health_in
		label_3d.text = str(current_health) + "/" + str(health)
		label_3d.modulate = finish_color.lerp(start_color, float(current_health) / float(health))
		if current_health < 1:
			get_tree().reload_current_scene()

func _ready() -> void:
	current_health = health

func take_damage() -> void:
	current_health -= 1
