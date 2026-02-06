extends Area2D


func _on_body_entered(body: Node2D) -> void:
	print("detected")
	print(body)
	if body.name == "player2":
		print("passing on")
		Main.add_points("player2")
