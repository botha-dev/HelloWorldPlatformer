extends Area2D

@onready var timer: Timer = $Timer
@export var damage: int

func _on_body_entered(_body: Node2D) -> void:
	for child in _body.get_children():
		if child is Damageable:
			child.hit(damage) 		
	#print("Dead dead...")
	#Engine.time_scale = 0.5
	#body.get_node("CollisionShape2D").queue_free()	
	#timer.start();

func _on_timer_timeout() -> void:
	pass
	#Engine.time_scale = 1
	#get_tree().reload_current_scene()
