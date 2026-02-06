extends CharacterBody2D

const SPEED = 80.0
var spawn_position = Vector2(0,130)
var can_shoot = true
var dead = false
var score: int



@onready var timer: Timer = $Timer

@onready var marker_2d: Marker2D = $Marker2D

@onready var shoot_sound: AudioStreamPlayer = $shoot_sound
@onready var respawn_sound: AudioStreamPlayer = $respawn_sound
@onready var death_sound: AudioStreamPlayer = $death_sound


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
	
	if Input.is_action_just_pressed("1_shoot"):
		shoot()

func reset_player(play_death_sound):
	if play_death_sound == true:
		death_sound.play()

	hide()
	dead = true
	global_position = Vector2(10000,10000)
	timer.start(3)
	
func _on_timer_timeout() -> void:
	global_position = spawn_position
	rotation_degrees = 0
	show()
	dead = false
	timer.stop()
	Main.game_paused = false
	respawn_sound.play()
	
func reload():
	can_shoot = true
	
func shoot():
	if can_shoot == true and dead == false:
		shoot_sound.play()
		var new_bullet = BULLET.instantiate()
		new_bullet.position = marker_2d.global_position
		new_bullet.direction = Vector2.UP.rotated(rotation)
		new_bullet.shooter = self


		can_shoot = false
		get_tree().current_scene.add_child(new_bullet)
		new_bullet.get_node("Sprite2D").rotation = rotation
		
