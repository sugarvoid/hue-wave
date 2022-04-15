extends Area2D



func _on_Thing_body_entered(body):
	queue_free()
