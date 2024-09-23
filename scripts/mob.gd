extends CharacterBody2D

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_floor: RayCast2D = $RayCastFloor
@onready var state_machine: CharacterStateMachine = $CharacterStateMachine
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var sprite: Sprite2D = $Sprite2D
@onready var hurtbox: Area2D = $Killzone

@export var floor_raycast_position_left: Vector2
@export var floor_raycast_position_right: Vector2
@export var hit_state: HitState
@export var dead_state: State

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var move_speed: int = 30
const SPEED = 30

var direction: Vector2 = Vector2.LEFT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_tree.active = true	

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if ray_cast_left.is_colliding() || ray_cast_right.is_colliding() || !ray_cast_floor.is_colliding(): 
		flip_direction()
	
	if direction.x != 0 && state_machine.get_can_move():
		velocity.x = direction.x * move_speed
	elif state_machine.current_state != hit_state: 
		velocity.x = move_toward(velocity.x, 0, move_speed)
	
	if state_machine.current_state == hit_state || state_machine.current_state == dead_state: 
		hurtbox.monitoring = false
	else: 
		hurtbox.monitoring = true
	
	move_and_slide()		

func flip_direction() -> void: 
	#if state_machine.current_state == hit_state || !state_machine.get_can_move(): 
	if state_machine.current_state == hit_state: 
		return
		
	match(direction):
		Vector2.LEFT: 
			direction = Vector2.RIGHT;
			sprite.flip_h = false
			ray_cast_floor.position = floor_raycast_position_right			
		Vector2.RIGHT: 
			direction = Vector2.LEFT; 
			sprite.flip_h = true
			ray_cast_floor.position = floor_raycast_position_left			
	
