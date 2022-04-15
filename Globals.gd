extends Node

signal on_coin_pickup()
signal on_player_death()

onready var screen_size = get_viewport().size

enum COLORS {
	WHITE,
	YELLOW,
	RED,
	BLUE,
	GREEN
}

const POSITIONS : Dictionary = {
	1: Vector2(239, -12),
	2: Vector2(499, 238),
	3: Vector2(-20, 238),
	4: Vector2(239, 492),
}

var player_score: int = 0 
