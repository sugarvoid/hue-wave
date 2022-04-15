extends Area2D


var wave_color : int
var speed : int = 150

onready var sprite : Sprite = get_node("Sprite")

func _process(delta):
	move(delta)
	

func _ready() -> void:
	match(self.wave_color):
		Globals.COLORS.YELLOW:
			self.sprite.frame = 4
		Globals.COLORS.GREEN:
			self.sprite.frame = 6
		Globals.COLORS.RED:
			self.sprite.frame = 2
			self.rotation_degrees = 90
		Globals.COLORS.BLUE:
			self.sprite.frame = 10
			self.rotation_degrees = 90


func move(delta) -> void:
	match(self.wave_color):
		Globals.COLORS.YELLOW:
			self.position.y += speed * delta
		Globals.COLORS.GREEN:
			self.position.y -= speed * delta
		Globals.COLORS.RED:
			self.position.x -= speed * delta
		Globals.COLORS.BLUE:
			self.position.x += speed * delta


func _on_Wave_body_entered(body):
	if body.get_class() == "Player":
		if body.current_color == self.wave_color:
			print('match')
		else:
			body.die()


func _on_Wave_area_entered(area):
	#check color
	#if same destroy
	pass 


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
