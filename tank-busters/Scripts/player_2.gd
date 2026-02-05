extends CharacterBody2D


const SPEED = 80.0
var score2 = 0

# wasd movement

func _physics_process(_delta):
	# character movement:
	var direction = Input.get_vector(
		'a_key', 'd_key',
		'w_key', 's_key')

	if direction.length():
		velocity = direction * SPEED
		rotation = direction.angle() + PI / 2
	else:
		velocity.x = move_toward(
			velocity.x, 0, SPEED)
		velocity.y = move_toward(
			velocity.y, 0, SPEED)
	move_and_slide()
