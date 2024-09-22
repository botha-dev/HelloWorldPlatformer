extends Control

class_name HealthChangeManager

@onready var health_bar: ProgressBar = $MarginContainer/HealthBarPosition/HealthBar

var character: CharacterBody2D
var damageable: Damageable

func _ready() -> void:	
	character = get_tree().get_first_node_in_group("player_group")
	for child in character.get_children(): 
		if child is Damageable: 
			damageable = child
			break
	
	health_bar.max_value = damageable.health		
	health_bar.value = damageable.health
	health_bar.size.x = health_bar.max_value * 4	
	SignalBus.connect("on_health_changed", _on_health_changed)
	
func _on_health_changed(character: Node, amount_changed: int, health: int) -> void: 
	health_bar.value = health;
