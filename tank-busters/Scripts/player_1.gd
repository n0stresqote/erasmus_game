extends CharacterBody2D

const SPEED = 80.0
var spawn_position = Vector2(0,130)

@onready var timer: Timer = $Timer


# arrow keys movement

func _physics_process(delta: float) -> void:
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED
		rotation = direction.angle() + PI / 2
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
	
func reset_player():
	queue_free()
	timer.start()
	
	global_position = spawn_position
	rotation_degrees = 0


func _on_timer_timeout() -> void:
	pass # Replace with function body.
