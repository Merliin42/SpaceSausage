extends RigidBody2D

signal hit



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_DogCatcher_area_entered(area):
	emit_signal("hit")
