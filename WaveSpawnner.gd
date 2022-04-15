extends Node

onready var timer: Timer = get_node("Timer")
onready var p_Wave = preload("res://items/Wave.tscn")


var next_spawn_time: float = 5.0
var max_spawn_time: float = 10.0
var min_spawn_time: float = 5.0


func _ready() -> void:
	randomize()


func make_wave() -> void:
	var s = get_tree().current_scene
	var random_num = randi()%4+1
	var wave = p_Wave.instance()
	wave.wave_color = random_num
	wave.position = Globals.POSITIONS[random_num]
	s.call_deferred("add_child", wave)


func _on_Timer_timeout():
	make_wave()
