extends KinematicBody2D

var current_color : int = 0 

#onready var animated_sprite: AnimatedSprite = $AnimatedSprite







var speed = 400  # speed in pixels/sec
var velocity = Vector2.ZERO

# The code below updates the character's sprite to look in a specific direction.
func _input(input):
	if input.is_action_pressed("color_up"):
		$Sprite.frame = 1
	elif input.is_action_pressed("color_down"):
		$Sprite.frame = 4
	elif input.is_action_pressed("color_left"):
		$Sprite.frame = 3
	elif input.is_action_pressed("color_right"):
		$Sprite.frame = 2
	else:
		$Sprite.frame = 0

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

func _process(delta):
	get_input()
	velocity = move_and_slide(velocity)
