class_name PlayerController

extends CharacterBody2D

@export var move_speed: int = 130

@onready var state_machine: CharacterStateMachine = $CharacterStateMachine
@onready var player_sprite: Sprite2D = $PlayerSprite
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hitbox: Area2D = $Hitbox


var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction: Vector2 = Vector2.ZERO

var score: int : 
	set(value):
		var score_changed = score - value;
		score = value
		SignalBus.emit_signal("on_score_changed", self, score_changed, value)
	get: 
		return score	 

func _ready() -> void:
	animation_tree.active = true	

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
		hitbox.monitoring = true
	
	direction = Input.get_vector("move_left", "move_right", "up", "down")
	
	if direction.x != 0 && state_machine.get_can_move():
		velocity.x = direction.x * move_speed
	else: 
		velocity.x = move_toward(velocity.x, 0, move_speed)
	
	move_and_slide()
	update_animation_parameters()
	update_sprite_facing_direction()
	
	if is_on_floor():
		hitbox.monitoring = false

func update_animation_parameters():
	animation_tree.set("parameters/move/blend_position", direction.x)
	
func update_sprite_facing_direction():
	if direction.x > 0: 
		player_sprite.flip_h = false
	elif direction.x < 0: 
		player_sprite.flip_h = true
	
func teleport_to_position(new_position: Vector2) -> void:
	self.position = new_position
	
