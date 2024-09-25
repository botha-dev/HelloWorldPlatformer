extends Sprite2D

@export var area_number_key: int
@onready var interaction_area: InteractionArea = $InteractionArea

func _ready() -> void:
	interaction_area.interact = Callable(self, "_key_pickup")
	
func _key_pickup() -> void: 	
	for child in get_children(): 
		if child is Pickable:
			child.pickup()
			queue_free()
	
