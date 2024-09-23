extends State

@onready var dead_timer: Timer = $DeadTimer

@export var dead_node: String = "dead"

func on_enter(): 
	dead_timer.start()
	playback.travel(dead_node)
	
func _on_dead_timer_timeout() -> void:
	character.queue_free()
