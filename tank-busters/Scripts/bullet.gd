extends Area2D

var SPEED = 320
var shooter
var direction: Vector2 = Vector2.ZERO



func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta



func _on_body_entered(body):
	if body is TileMapLayer:
		print("detected")
		shooter.reload()
		queue_free()
	if body.is_in_group("players"):
		body.reset_player()
		
		shooter.reload()
		queue_free()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
