extends Node

var score: int

func add_score(value: int):	
	score += value
	emit_signal("score_changed")

func get_score() -> int: 
	return score

signal score_changed
