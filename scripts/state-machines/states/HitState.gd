extends State

@export var damageable : Damageable
@export var return_state: State
@export var dead_state: State
@export var hit_node: String = "hit"
@export var dead_node: String = "dead"
@onready var hit_timer: Timer = $HitTimer

func _ready() -> void:
	damageable.connect("on_hit_received", _on_hit_received)

func on_enter():
	hit_timer.start()

func _on_hit_received(body: Node, hit_for: int):
	#only hit when not still in hit state (iframes)
	if !hit_timer.is_stopped():
		return 
		
	if damageable.health > 0:
		emit_signal("interrupt_state", self)
		playback.travel(hit_node)
		
	if damageable.health <= 0: 
		emit_signal("interrupt_state", dead_state)		

func _on_hit_timer_timeout() -> void:
	next_state = return_state
