extends Node2D

export var scroll_speed : float = 0.05
export var scroll_speed2 : float = 0.025

func _ready():
		$Clouds.material.set_shader_param("scroll_speed", scroll_speed)
		$Clouds2.material.set_shader_param("scroll_speed", scroll_speed2)
