extends Node2D

var score : int = 0
var level2 = preload("res://Scenes/Levels/Level2.tscn").instance()
var level3 = preload("res://Scenes/Levels/Level3.tscn").instance()
var current_level : int = 1

func transition():
		$AnimationPlayer.play("level_out")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "level_in" :
		return 0
	if current_level == 2 :
		$Level1.queue_free()
		level2.connect("score", self, "_on_Level_score")
		add_child(level2)
	if current_level == 3 :
		$Character.spaceDog()
		level2.queue_free()
		level3.connect("score", self, "_on_Level_score")
		add_child(level3)
	$AnimationPlayer.play("level_in")


func _on_Level_score(points):
	score += points
	$HUD.change_score(score)
	if (score > 2000 or Input.is_action_pressed("ui_accept")) and current_level == 1 :
		current_level = 2
		transition()
	elif (score > 4000 or Input.is_action_pressed("ui_accept")) and current_level == 2 :
		$HUD.change_color(Color(1, 1, 1))
		current_level = 3
		transition()


func _on_Character_hit(points):
	score += points
	$HUD.change_score(score)
