extends Area2D

class_name Pickup

@export var pickup_value: int = 1
@onready var animation_player: AnimationPlayer = $AnimationPlayer

#var game_manager: GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#game_manager = get_tree().get_first_node_in_group("game_manager")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	if _body is PlayerController:
		#game_manager.add_score(pickup_value)		
		_body.score += pickup_value
		animation_player.play("pickup")
	
