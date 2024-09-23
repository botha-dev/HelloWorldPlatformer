extends State

@export var air_state: State
@export var jump_velocity: int = 300
@export var jump_node: String = "jump"

func state_process(delta: float):
	if !character.is_on_floor(): 
		next_state = air_state

func state_input(event: InputEvent):	
	if event.is_action_pressed("jump"):				
		jump()
		
func jump(): 
	character.velocity.y = -jump_velocity
	next_state = air_state	
	playback.travel(jump_node);
