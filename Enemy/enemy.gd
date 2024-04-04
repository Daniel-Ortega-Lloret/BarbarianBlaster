extends PathFollow3D

@onready var enemy: PathFollow3D = $"."
@onready var base = get_tree().get_first_node_in_group("base")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("bank")

@export_range (10, 100) var enemy_health := 50
@export_range(1,10) var SPEED: float = 3
@export_range(1, 100) var enemy_value = 15

var current_health: int:
	set(health_in):
		if health_in < current_health:
			animation_player.play("TakeDamage")
		current_health = health_in
		if current_health < 1:
			bank.gold += enemy_value
			queue_free()

func _ready() -> void:
	current_health = enemy_health
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	enemy.progress += delta * SPEED
	if enemy.progress_ratio == 1.0:
		base.take_damage()
		queue_free()
