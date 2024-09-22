extends Camera2D

@onready var player: CharacterBody2D = %player
@export var cam_speed: float = 5

	
func _physics_process(delta: float) -> void:
	position = lerp(position, player.position, delta * cam_speed)
