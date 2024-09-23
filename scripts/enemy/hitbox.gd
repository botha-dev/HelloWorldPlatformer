extends Area2D

@export var damage: int = 1

func _on_body_entered(body: Node2D) -> void:	
	for  child in body.get_children(): 
		if child is Damageable: 
			child.hit(damage, body.global_position - global_position)
