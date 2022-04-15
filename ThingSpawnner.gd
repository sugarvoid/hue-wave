extends Node

onready var screen_size = get_viewport().size

var rand = RandomNumberGenerator.new()

onready var p_Thing = preload("res://items/Thing.tscn")

func _spawn_thing() -> void:
	var s = get_tree().current_scene
	var thing = p_Thing.instance()
	rand.randomize()
	var x = rand.randf_range(0, screen_size.x)
	var y = rand.randf_range(0, screen_size.y)
	thing.position = Vector2(x, y)
	thing.position.x = clamp(thing.position.x, 30, Globals.screen_size.x - 30)
	thing.position.y = clamp(thing.position.y, 30, Globals.screen_size.y - 30)
	s.call_deferred("add_child", thing)
	

func _on_Timer_timeout():
	_spawn_thing()
