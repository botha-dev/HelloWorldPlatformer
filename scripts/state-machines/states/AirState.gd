extends State

@export var ground_state: State

func state_process(delta):
	if character.is_on_floor(): 
		next_state = ground_state

func _on_player_animations_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
