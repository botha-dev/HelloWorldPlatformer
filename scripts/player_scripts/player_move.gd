extends Node
@onready var player_animations: AnimationPlayer = $"../player_animations"

# Return the desired direction of movement for the character
# in the range [-1, 1], where positive values indicate a desire
# to move to the right and negative values to the left.
func get_movement_direction() -> float:
	return Input.get_axis('move_left', 'move_right')

# Return a boolean indicating if the character wants to jump
func wants_jump() -> bool:
	var jump_pressed: bool = Input.is_action_just_pressed("jump")
	if jump_pressed:
		player_animations.play("jump")
	return jump_pressed
