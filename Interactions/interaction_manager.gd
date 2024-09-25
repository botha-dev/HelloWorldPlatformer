extends Node2D

@onready var player = get_tree().get_first_node_in_group("player_group")
@onready var label: Label = $Label

var can_interact : bool = true

const base_text = "[F] to "
 
var active_areas: Array[InteractionArea] = []

func register_area(area: InteractionArea):
	active_areas.append(area)		
	
func unregister_area(area: InteractionArea):
	var index = active_areas.find(area)
	
	if index != -1:
		active_areas.remove_at(index)		

func _process(delta: float):
	if active_areas.size() > 0 && can_interact: 
		active_areas.sort_custom(_sort_by_distance_to_player)
		label.text = base_text + active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.global_position.y -= 32
		label.global_position.x = active_areas[0].global_position.x - 50
		label.show()
	else: 
		label.hide()		

func _sort_by_distance_to_player(area1: InteractionArea, area2: InteractionArea):
	var area1_toPlayer = player.global_position.distance_to(area1.global_position)
	var area2_toPlayer = player.global_position.distance_to(area2.global_position)
	return area1_toPlayer < area2_toPlayer
			
func _input(event: InputEvent):
	if event.is_action_pressed("interact") && can_interact:
		print_debug("pressing interact in the area")
		if active_areas.size() > 0:
			can_interact = false
			label.hide()
			
			await active_areas[0].interact.call()
			
			can_interact = true 
		
