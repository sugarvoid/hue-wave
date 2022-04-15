extends Node2D

onready var lbl_label: Label = get_node("Score")

enum GameState {
	START_SCREEN,
	GAMEPLAY,
	GAMEOVER,
	PAUSE
}

func _ready():
	Globals.connect("on_player_death", self, "_player_death")

func _process(delta):
	lbl_label.text = str(Globals.player_score)

func _player_death():
	$PlayerDeath.play()


func _on_PlayerDeath_finished():
	var _x = get_tree().change_scene(Globals.GAMEOVER_SCREEN)
