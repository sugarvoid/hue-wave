extends Area2D


onready var sprite : Sprite = get_node("Sprite")


var wave_color : int
var speed : int


func _process(delta):
	move(delta)
	

func _ready() -> void:
	match(self.wave_color):
		Globals.COLORS.YELLOW:
			self.sprite.frame = 4
			self.speed = 200
		Globals.COLORS.GREEN:
			self.sprite.frame = 6
			self.speed = 350
		Globals.COLORS.RED:
			self.sprite.frame = 2
			self.rotation_degrees = 90
			self.speed = 280
		Globals.COLORS.BLUE:
			self.sprite.frame = 10
			self.rotation_degrees = 90
			self.speed = 500


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
			$AudioStreamPlayer.play()
		else:
			body.die()


func _on_Wave_area_entered(area):
	#check color
	#if same destroy
	pass 


func _on_VisibilityNotifier2D_screen_exited():
	self.queue_free()
