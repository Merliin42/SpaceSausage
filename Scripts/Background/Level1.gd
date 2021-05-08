extends Node2D

export var scroll_speed : float = 0.05

func _ready():
	$cloud.material.set_shader_param("scroll_speed", scroll_speed)

