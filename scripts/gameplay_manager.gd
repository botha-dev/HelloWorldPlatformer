extends Node2D

class_name GameplayManager

@export var starting_area: int = 1
@export var player: PlayerController

var area_path: String = "res://scenes/areas/"
var current_area: int
var area_container: Node2D

func _ready() -> void:
	area_container = get_tree().get_first_node_in_group("area_group")	
	current_area = starting_area
	
	var key_pickup = get_tree().get_first_node_in_group("key_pickup")
	var key_lock = get_tree().get_first_node_in_group("key_lock")
	var gate = get_tree().get_first_node_in_group("gate")
	
	Global.player_controller = player	
	Global.key = key_pickup
	Global.lock = key_lock
	Global.gate = gate
	
	next_area(0)
	
func next_area(goto_area: int):
	current_area += goto_area
	load_next_area(current_area)

func load_next_area(area: int):
	var full_path = area_path + "area_" + str(area) + '.tscn'
	var scene = load(full_path) as PackedScene
	
	if !scene: 
		return null
	
	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited
		
	var instance = scene.instantiate()
	area_container.add_child(instance)
	
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	player.teleport_to_position(player_start_position.position)
	
