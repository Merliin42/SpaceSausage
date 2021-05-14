extends Node2D

onready var seagullSpawner : PathFollow2D = $SeagullSpawner/PathFollow2D
onready var enemySpawner : PathFollow2D = $EnemySpawner/PathFollow2D
export var SEAGULL : PackedScene = preload("res://Scenes/Actors/Seagull.tscn")
export var ENEMY : PackedScene = preload("res://Scenes/Actors/Fishs/FlyingFish.tscn")
export var EnemyOffset : int = 1600
export var level : int = 0
signal score(points)


func on_Seagull_catched(points):
	emit_signal("score", points)


func on_Seagull_missed(points):
	emit_signal("score", points)

func on_Enemy_hit(points):
	emit_signal("score", points)


func _on_SeagullRythm_timeout():
	seagullSpawner.offset = rand_range(0, 1080)
	var new_child : Area2D = SEAGULL.instance()
	new_child.position = seagullSpawner.position
	new_child.connect("catched", self, "on_Seagull_catched")
	new_child.connect("missed", self, "on_Seagull_missed")
	self.add_child(new_child)


func _on_EnemyRythm_timeout():
	enemySpawner.offset = rand_range(0, EnemyOffset)
	var new_child = ENEMY.instance()
	new_child.position = enemySpawner.position
	new_child.connect("hit", self, "on_Enemy_hit")
	if level == 3 :
		new_child.type = 1
	self.add_child(new_child)
