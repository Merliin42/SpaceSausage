extends Node2D

export var scroll_speed : float = 0.05





# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("first")
	$Scene3/Cloud.material.set_shader_param("scroll_speed", scroll_speed)




func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.visible = false
	$Scene3.visible = true
	$Scene3/Dog.play("default")


func _on_Dog_animation_finished():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
