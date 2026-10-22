extends StaticBody2D

@export var reveal_duration: float = 3.0

var reveal_timer: float = 0.0

func _ready() -> void:
	hide()
	set_collision_enabled(false)

func _process(delta: float) -> void:
	if reveal_timer > 0.0:
		reveal_timer -= delta
		
	if reveal_timer <= 0.0:
		hide()
		set_collision_enabled(false)

func reveal() -> void:
	show();
	set_collision_enabled(true)
	reveal_timer = reveal_duration
	
func set_collision_enabled(enabled: bool) -> void:
	for child in get_children():
		if child is CollisionShape2D:
			child.set_deferred("disabled", not enabled)
