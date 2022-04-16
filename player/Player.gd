extends KinematicBody2D

class_name Player
var current_color : int = 0 

#onready var animated_sprite: AnimatedSprite = $AnimatedSprite


var speed = 400  # speed in pixels/sec
var velocity = Vector2.ZERO

func get_class() -> String:
	return "Player"

func _ready() -> void:
	var _c = Globals.connect("on_coin_pickup", self, "_increase_score")

# The code below updates the character's sprite to look in a specific direction.
func get_color_input():
	if Input.is_action_pressed("color_up"):
		$Sprite.frame = 1
		self.current_color = Globals.COLORS.YELLOW
	elif Input.is_action_pressed("color_down"):
		$Sprite.frame = 4
		self.current_color = Globals.COLORS.GREEN
	elif Input.is_action_pressed("color_left"):
		$Sprite.frame = 3
		self.current_color = Globals.COLORS.BLUE
	elif Input.is_action_pressed("color_right"):
		$Sprite.frame = 2
		self.current_color = Globals.COLORS.RED
	else:
		$Sprite.frame = 0
		self.current_color = Globals.COLORS.WHITE

func _increase_score() -> void:
	$Pickup.play()
	Globals.player_score += 1

func die() -> void:
	Globals.emit_signal("on_player_death")
	queue_free()

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x += 1
	elif Input.is_action_pressed('left'):
		velocity.x -= 1
	elif Input.is_action_pressed('down'):
		velocity.y += 1
	elif Input.is_action_pressed('up'):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed

func _process(_delta):
	get_input()
	get_color_input()
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, 20, Globals.screen_size.x - 20)
	position.y = clamp(position.y, 20, Globals.screen_size.y - 20)
