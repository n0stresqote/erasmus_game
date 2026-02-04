extends CharacterBody2D


const SPEED = 300.0

# wasd movement

func _physics_process(delta):
	var direction = Input.get_vector(
		"p1_left",
		"p1_right",
		"p1_up",
		"p1_down"
	)

	velocity = direction * SPEED
	move_and_slide()
