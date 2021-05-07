extends Node2D




func _on_Level1_win():
	print("win")
	$AnimationPlayer.play("Transition")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Transition" :
		$Level1.queue_free()
