extends Node2D

export var scroll_speed : float = 0.05
onready var seagullSpawner : PathFollow2D = $SeagullSpawner/PathFollow2D
onready var fishSpawner : PathFollow2D = $FishSpawner/PathFollow2D
const SEAGULL : PackedScene = preload("res://Scenes/Seagull.tscn")
const FISH : PackedScene = preload("res://Scenes/Fish.tscn")
const BOAT : PackedScene = preload("res://Scenes/Boat.tscn")
signal score(points)

func _ready():
	$Clouds.material.set_shader_param("scroll_speed", scroll_speed)


func on_Seagull_catched(points):
	emit_signal("score", points)


func on_Seagull_missed(points):
	emit_signal("score", points)

func on_Fish_hit(points):
	emit_signal("score", points)


func _on_SeagullRythm_timeout():
	seagullSpawner.offset = rand_range(0, 1080)
	var new_child : Area2D = SEAGULL.instance()
	new_child.position = seagullSpawner.position
	new_child.connect("catched", self, "on_Seagull_catched")
	new_child.connect("missed", self, "on_Seagull_missed")
	self.add_child(new_child)


func _on_FishRythm_timeout():
	fishSpawner.offset = rand_range(0, 1600)
	var new_child : RigidBody2D = FISH.instance()
	new_child.position = fishSpawner.position
	new_child.connect("hit", self, "on_Fish_hit")
	self.add_child(new_child)


func _on_Boat_gone():
	var new_boat : Sprite = BOAT.instance()
	new_boat.connect("gone", self, "_on_Boat_gone")
	self.add_child(new_boat)
