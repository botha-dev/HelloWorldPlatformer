extends StaticBody2D



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	print_debug(event.as_text())
	
