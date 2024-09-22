extends Node
class_name Damageable

signal on_hit_received(body: Node, hit_for: int)

@export var health: int = 10:
	set(value):
		var amount_changed = health - value
		health = value
		SignalBus.emit_signal("on_health_changed", get_parent(), amount_changed, health)
	get:
		return health

func hit(damage:int):
	health -= damage
	emit_signal("on_hit_received", get_parent(), damage)
	#print_debug("health: " + str(health))
	#if health <= 0: 
		#var parent = get_parent()
		#if parent is PlayerController:			
			#get_tree().reload_current_scene()
		#
		#parent.queue_free()
