extends Node
class_name Damageable

signal on_hit_received(body: Node, hit_for: int, hit_from: Vector2)

@export var max_health: int = 10
@export var health: int = 10:
	set(value):
		var amount_changed = health - value
		health = value
		SignalBus.emit_signal("on_health_changed", get_parent(), amount_changed, health)
	get:
		return health

func hit(damage: int, hit_from: Vector2):
	health -= damage
	emit_signal("on_hit_received", get_parent(), damage, hit_from)
