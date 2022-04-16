extends Area2D

onready var life_timer: Timer = get_node("LifeTimer")

func _ready():
	life_timer.start(2)


func _on_Thing_body_entered(body):
	if body.get_class() == "Player":
		queue_free()
		Globals.emit_signal("on_coin_pickup")


func _on_LifeTimer_timeout():
	queue_free()
