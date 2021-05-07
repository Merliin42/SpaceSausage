extends Node2D

export var scroll_speed : float = 0.05
const BOAT : PackedScene = preload("res://Scenes/Boat.tscn")

func _ready():
	$cloud.material.set_shader_param("scroll_speed", scroll_speed)

func _on_Boat_gone():
	var new_boat : Sprite = BOAT.instance()
	new_boat.connect("gone", self, "_on_Boat_gone")
	self.add_child(new_boat)

