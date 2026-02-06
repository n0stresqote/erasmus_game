extends Area2D

@onready var pickup_sound: AudioStreamPlayer = $pickup_sound


func _on_body_entered(body: Node2D) -> void:
	print("detected")
	print(body)
	if body.name == "player2":
		print("passing on")
		Main.add_points("player2")
		pickup_sound.play()
