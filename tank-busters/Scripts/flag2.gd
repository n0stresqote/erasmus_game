extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player2":
		body.score2 += 1
		self.queue_free()
		print(body.score2)
