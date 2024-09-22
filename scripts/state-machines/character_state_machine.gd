extends Node

class_name CharacterStateMachine

@export var character: CharacterBody2D
@export var animation_tree: AnimationTree
@export var current_state: State

var states: Array[State]

func _ready() -> void:
	for child in get_children():
		if child is State:
			child.character = character
			child.playback = animation_tree["parameters/playback"]
			child.connect("interrupt_state", _on_interrupt_state)
		else: 
			push_warning("Child " + child.name + " is not a State.")	
			
func _physics_process(_delta: float) -> void:
	if current_state.next_state != null:
		switch_state(current_state.next_state)
	
	current_state.state_process(_delta)	
	
func _input(event: InputEvent) -> void:
	current_state.state_input(event)	

func get_can_move() -> bool:
	return current_state.can_move	

func switch_state(new_state: State)	-> void:
	if current_state != null: 
		current_state.on_exit()
		current_state.next_state = null
		
	current_state = new_state
	current_state.on_enter()
	
func _on_interrupt_state(new_state: State)	:
	switch_state(new_state)
