extends Node2D

onready var seagullSpawner : PathFollow2D = $SeagullSpawner/PathFollow2D
onready var enemySpawner : PathFollow2D = $EnemySpawner/PathFollow2D
const SEAGULL : PackedScene = preload("res://Scenes/Seagull.tscn")
const ENEMY : PackedScene = preload("res://Scenes/Fish.tscn")
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
	enemySpawner.offset = rand_range(0, 1600)
	var new_child : RigidBody2D = ENEMY.instance()
	new_child.position = enemySpawner.position
	new_child.connect("hit", self, "on_Enemy_hit")
	self.add_child(new_child)
