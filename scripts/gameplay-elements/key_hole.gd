extends Sprite2D

@export var area_number_key: int
@onready var label: Label = $Label
@onready var label_timer: Timer = $Label/LabelTimer

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_unlock_gate")
	label.text = "You don't have the key."
	label.hide()
	label_timer.connect("timeout", _label_timer_timeout)
	
func _unlock_gate() -> void: 	
	print_debug("test entry")
	var index: int = 0
	var key_used: bool = false
	for inv in Global.player_controller.player_inventory:
		if inv.is_key_item: 			
			Global.player_controller.player_inventory.remove_at(index)
			Global.gate.queue_free()
			key_used = true
			label.text = "Unlocked using Key."
			break
			# play gate open music
		index += 1
		
	if !key_used:
		label.show()
		label_timer.start()
	
func _label_timer_timeout():
	label.hide()
