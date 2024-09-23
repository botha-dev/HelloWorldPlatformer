extends HitState

class_name EnemyHitState

@export var hurtbox: Area2D

func _ready() -> void:
	super()

func on_enter():
	super()
	hurtbox.monitoring = false	
	
func on_exit():
	super()
	hurtbox.monitoring = true
	
