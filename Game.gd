extends Node2D

onready var lbl_label: Label = get_node("Score")


func _ready():
	var _c = Globals.connect("on_player_death", self, "_player_death")
	$BgMusic.play()


func _process(_delta):
	lbl_label.text = str(Globals.player_score)


func _player_death():
	$BgMusic.stop()
	$PlayerDeath.play()


func _on_PlayerDeath_finished():
	var _x = get_tree().change_scene(Globals.GAMEOVER_SCREEN)
