extends Area2D

@onready var pickup_sound: AudioStreamPlayer = $pickup_sound

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player1":
		Main.add_points("player1")
		pickup_sound.play()
