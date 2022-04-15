extends Node2D

onready var lbl_label: Label = get_node("Score")

enum GameState {
	START_SCREEN,
	GAMEPLAY,
	GAMEOVER,
	PAUSE
}

func _process(delta):
	lbl_label.text = str(Globals.player_score)
