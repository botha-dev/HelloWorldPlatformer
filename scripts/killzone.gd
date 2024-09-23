extends Area2D

@onready var timer: Timer = $Timer
@export var damage: int

func _on_body_entered(_body: Node2D) -> void:
	for child in _body.get_children():
		if child is Damageable:
			child.hit(damage, _body.global_position - get_parent().global_position) 		

func _on_timer_timeout() -> void:
	pass
