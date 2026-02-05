extends Area2D

var SPEED = 320
var shooter
var direction: Vector2 = Vector2.ZERO
var sprite_rotation



func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
	
	


func _on_body_entered(body):
	if body is TileMapLayer:
		#print("detected")
		shooter.reload()
		
		var tilemap := body as TileMapLayer
		var tile_pos = tilemap.local_to_map(tilemap.to_local(global_position + direction * 2))
		var tile_data = tilemap.get_cell_tile_data(tile_pos)
		
		"""print(tilemap)
		print(tile_pos)
		print(tile_data)
		print(direction)
		print(global_position)"""
		
		if tile_data:
			var atlas_coords = tilemap.get_cell_atlas_coords(tile_pos)

			if atlas_coords == Vector2i(0, 0):
				tilemap.set_cell(tile_pos, 0, Vector2i(1, 0))
			
			elif atlas_coords == Vector2i(1, 0):
				tilemap.set_cell(tile_pos, 0, Vector2i(2, 0))
				
			elif atlas_coords == Vector2i(2, 0):
				tilemap.erase_cell(tile_pos)
		
		queue_free()
	if body.is_in_group("players"):
		body.reset_player()
		print("Calling a reset function")
		
		shooter.reload()
		queue_free()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
