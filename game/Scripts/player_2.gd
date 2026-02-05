extends CharacterBody2D

const SPEED = 80.0
var spawn_position = Vector2(0,-130)
var can_shoot = true
var dead = false


@onready var timer: Timer = $Timer


@onready var marker_2d: Marker2D = $Marker2D
const BULLET = preload("res://Scenes/bullet.tscn")

# arrow keys movement
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(
		'a_key', 'd_key',
		'w_key', 's_key')

	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED
		rotation = direction.angle() + PI / 2
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
	
	if Input.is_key_pressed(KEY_SPACE):
		shoot()

func reset_player():

	hide()
	dead = true
	global_position = Vector2(10000,10000)
	timer.start(3)

	
func _on_timer_timeout() -> void:
	global_position = spawn_position
	rotation_degrees = 180
	show()
	dead = false
	timer.stop()

	
func reload():
	can_shoot = true
	
func shoot():
	if can_shoot == true and dead == false:
		var new_bullet = BULLET.instantiate()
		new_bullet.position = marker_2d.global_position
		new_bullet.direction = Vector2.UP.rotated(rotation)
		new_bullet.shooter = self

		can_shoot = false
		get_tree().current_scene.add_child(new_bullet)
		new_bullet.get_node("Sprite2D").rotation = rotation
