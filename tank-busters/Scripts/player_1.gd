extends CharacterBody2D

const SPEED = 80.0
var spawn_position = Vector2(0,130)

@onready var timer: Timer = $Timer

@onready var marker_2d: Marker2D = $Marker2D
const BULLET = preload("res://Scenes/bullet.tscn")



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
	
	if Input.is_key_pressed(KEY_KP_0):
		shoot()
		
	
func reset_player():
	hide()
	timer.start(3)
	
func _on_timer_timeout() -> void:
	global_position = spawn_position
	rotation_degrees = 0
	show()
	timer.stop()
	
	
func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.position = marker_2d.global_position
	get_tree().current_scene.add_child(new_bullet)
