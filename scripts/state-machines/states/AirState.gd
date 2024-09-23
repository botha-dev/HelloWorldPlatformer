extends State

@export var ground_state: State
@export var wall_jump_velocity: int = 150
@export var double_jump_velocity: int = 175

var has_double_jumped: bool = false

func on_enter():
	has_double_jumped = false

func state_process(delta):
	if character.is_on_floor(): 
		next_state = ground_state

func state_input(event: InputEvent):
	if !event.is_action_pressed("jump"): 
		return
	
	if character.is_on_wall():
		wall_jump()
		
	if !has_double_jumped:
		double_jump()

func _on_player_animations_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.

func wall_jump():
	character.velocity.y = -wall_jump_velocity

func double_jump(): 
	character.velocity.y = -double_jump_velocity
	has_double_jumped = true
