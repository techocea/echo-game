extends CharacterBody2D

const GRAVITY := 900.0
const SPEED = 220.0
const JUMP_VELOCITY = -450.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta;

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("echo_pulse"):
		get_tree().call_group("hidden_platforms","reveal")
		
		var pulse := Node2D.new()
		pulse.set_script(load("res://scripts/echo_pulse.gd"))
		get_tree().current_scene.add_child(pulse)
		pulse.global_position = global_position
