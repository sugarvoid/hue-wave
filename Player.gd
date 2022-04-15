extends KinematicBody2D

# Movement speed in pixels per second.
export var speed := 500
export var friction = 0.18

# We map a direction to a frame index of our AnimatedSprite node's sprite frames.
# See how we use it below to update the character's look direction in the game.
var _sprites := {Vector2.RIGHT: 1, Vector2.LEFT: 2, Vector2.UP: 3, Vector2.DOWN: 4}
var velocity := Vector2.ZERO
export var acceleration = 0.2

var current_color : int = 0 

#onready var animated_sprite: AnimatedSprite = $AnimatedSprite


func _physics_process(delta):
	var direction := Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	if direction.length() > 0:
		velocity = lerp(velocity, direction.normalized() * speed, acceleration)
	else:
		velocity = lerp(velocity, Vector2.ZERO, friction)
	velocity = move_and_slide(velocity)


# The code below updates the character's sprite to look in a specific direction.
func _unhandled_input(event):
	if event.is_action_pressed("color_up"):
		$Sprite.frame = 1
	elif event.is_action_pressed("color_down"):
		$Sprite.frame = 4
	elif event.is_action_pressed("color_left"):
		$Sprite.frame = 3
	elif event.is_action_pressed("color_right"):
		$Sprite.frame = 2
	


