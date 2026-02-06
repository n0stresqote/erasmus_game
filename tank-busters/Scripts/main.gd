extends Node

var player_1_score := 0
var player_2_score := 0
var game_paused = false

@onready var wall_hit_sound: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready():
	add_child(wall_hit_sound)
	wall_hit_sound.volume_db = -15
	wall_hit_sound.stream = preload("res://Assets/wall_break_sound.mp3")

signal score_changed(player, score)

func add_points(player: String):
	print("received")
	if player == "player1":
		player_1_score += 1
		score_changed.emit("player1", player_1_score)
	elif player == "player2":
		print("Continuing")
		player_2_score += 1
		score_changed.emit("player2", player_2_score)


func play_wall_hit():
	wall_hit_sound.play()
