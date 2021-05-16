extends CanvasLayer


func _on_Button_pressed():
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_out")


func _on_VideoPlayer_finished():
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_out")


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/Main.tscn")
