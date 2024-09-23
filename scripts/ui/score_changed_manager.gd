extends Control

class_name ScoreChangeManager

@onready var score_label: Label = $MarginContainer/ScoreControl/ScoreLabel

var character: CharacterBody2D
var player: PlayerController
var damageable: Damageable

func _ready() -> void:	
	player = get_tree().get_first_node_in_group("player_group")	
	update_score(player.score)
	
	SignalBus.connect("on_score_changed", _on_score_changed)
	
	
func update_score(new_score: int):
	score_label.text = "Score: %d" % new_score
	
	
func _on_score_changed(character: Node, score_changed: int, current_score: int) -> void: 
	update_score(current_score)
