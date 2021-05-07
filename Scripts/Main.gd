extends Node2D

var score : int = 0


func _on_Level1_win():
	print("win")
	$AnimationPlayer.play("Transition")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Transition" :
		$Level1.queue_free()


func _on_Level1_score(points):
	score += points
	$HUD.change_score(score)
