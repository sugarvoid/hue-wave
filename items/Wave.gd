extends Area2D

enum COLOR {
	YELLOW,
	RED,
	BLUE,
	GREEN
}

var color : int 
var speed : int = 70

func _process(delta):
	self.position.y += speed * delta

func move() -> void:
	self.position.y += 20


func _on_Wave_body_entered(body):
	print(body)
	#check player color
	#if same ignore
	pass # Replace with function body.


func _on_Wave_area_entered(area):
	print(area)
	#check color
	#if same destroy
	pass # Replace with function body.
