extends Area2D

var SPEED = 320
var direction = Vector2.ZERO

func _physics_process(delta):
		position += transform.x * SPEED * delta
		

func _on_body_entered(body):
	print("detect1")
	#if body is TileMapLayer:
		#pass
	if body.is_in_group("players"):
		print("detect2")
		body.reset_player()
		queue_free()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
