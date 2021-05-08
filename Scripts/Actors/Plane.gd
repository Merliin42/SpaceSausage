extends Area2D

export var SPEED : int = 200


func _ready():
	$Sprite.texture = load("res://Assets/Planes/plane"+ str(int(rand_range(1, 5))) + ".png")

func _process(delta):
	position.x = position.x - SPEED * delta
