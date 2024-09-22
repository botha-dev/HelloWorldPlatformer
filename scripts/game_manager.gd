class_name GameManager

extends Node

#@export var starting_area: int = 1
#
#var _player_score: int = 0
#
#var score: int:
	#set(value):	
		#_player_score = value
		#emit_signal("score_changed", _player_score)
	#get:
		#return _player_score
#
#var area_path: String = "res://scenes/areas/"
#
#var current_area: int
#var area_container: Node2D
#
#@onready var player: PlayerController = $"../player"
#
#func _ready() -> void:
	#area_container = get_tree().get_first_node_in_group("area_group")	
	#current_area = starting_area
	#next_area(0)
		#
	#
#func next_area(goto_area: int):
	#current_area += goto_area
	#load_next_area(current_area)
#
#func load_next_area(area: int):
	#var full_path = area_path + "area_" + str(area) + '.tscn'
	#var scene = load(full_path) as PackedScene
	#
	#if !scene: 
		#return null
	#
	#for child in area_container.get_children():
		#child.queue_free()
		#await child.tree_exited
		#
	#var instance = scene.instantiate()
	#area_container.add_child(instance)
	#var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	#player.teleport_to_position(player_start_position.position)
#
#func add_score(value: int):		
	#score += value
	##emit_signal("score_changed")
#
#func get_score() -> int: 
	#return score
#
#signal score_changed(score: int)
