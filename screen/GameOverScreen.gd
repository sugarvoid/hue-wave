extends Node2D

const GAME_SCENE: String = "res://Game.tscn"

func _ready():
	$GameOverSound.play()


func _input(event):
	if event.is_action_pressed("ui_accept"):
		var _x = get_tree().change_scene(GAME_SCENE)
