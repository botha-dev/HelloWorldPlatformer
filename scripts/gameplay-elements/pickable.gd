extends Node

class_name Pickable

@export var item_name: String
@export var item_description: String
@export var item_category: String
@export var is_key_item: bool

func pickup():
	InventoryManagement.emit_signal("item_pickup", self)
