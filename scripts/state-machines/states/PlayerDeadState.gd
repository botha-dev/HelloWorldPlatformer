extends State

class_name PlayerDeadState

@export var dead_node: String = "dead"
@onready var dead_timer: Timer = $DeadTimer

func on_enter():
	playback.travel(dead_node)
	dead_timer.start()
	Engine.time_scale = 0.3

func _on_dead_timer_timeout() -> void:	
	Engine.time_scale = 1
	get_tree().reload_current_scene()
