
extends Node2D

var radius: float = 0.0
var max_radius: float = 250.0
var duration: float = 0.45
var elapsed: float = 0.0

func _process(delta: float) -> void:
	elapsed += delta
	radius = (elapsed / duration) * max_radius
	queue_redraw()

	if elapsed >= duration:
		queue_free()

func _draw() -> void:
	var progress: float = elapsed / duration
	var alpha: float = 1.0 - progress
	var ring_color := Color(0.2, 0.85, 1.0, alpha)

	draw_arc(
		Vector2.ZERO,
		radius,
		0.0,
		TAU,
		64,
		ring_color,
		4.0
	)
