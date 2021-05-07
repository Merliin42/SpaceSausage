extends RigidBody2D

signal hit(points)
export var points : int = -100



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_DogCatcher_area_entered(area):
	emit_signal("hit", points)
