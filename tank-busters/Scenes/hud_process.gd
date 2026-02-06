extends Node2D

@onready var player_1_score_label: Label = $Player1ScoreLabel
@onready var player_2_score_label: Label = $Player2ScoreLabel

@onready var player_1_score_result_label: Label = $result_screen/Label2
@onready var player_2_score_result_label: Label = $result_screen/Label3



func _ready():
	Main.score_changed.connect(_on_score_changed)

func _on_score_changed(player, score):
	print("received")
	if player == "player1":
		player_1_score_label.text = "Blue: %d" % score
		player_1_score_result_label.text = "Blue: %d" % score
	elif player == "player2":
		print("editing")
		player_2_score_label.text = "Red: %d" % score
		player_2_score_result_label.text = "Red: %d" % score
	Main.game_paused = true
	get_tree().current_scene.get_node("player1").reset_player(false)
	get_tree().current_scene.get_node("player2").reset_player(false)
	
	
