extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var score_label: Label = $score
@onready var game_manager: Node = %game_manager

func _ready() -> void:
	%game_manager.connect("score_changed", on_score_change)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.	
	var direction := Input.get_axis("move_left", "move_right")
	
	change_direction(direction)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
	
	animation_update(velocity, direction)
	
	move_and_slide()

func change_direction(direction: float):
	if direction > 0:
		player_sprite.flip_h = false
	
	if direction < 0:
		player_sprite.flip_h = true

func animation_update(velocity: Vector2, direction: float):
	if !is_on_floor():
		player_sprite.play("air")
		pass
		
	if direction == 0: 
		player_sprite.play("idle")
		
	if direction != 0: 
		player_sprite.play("run")  	

func on_score_change()-> void:
	score_label.text = str(%game_manager.get_score())
	
