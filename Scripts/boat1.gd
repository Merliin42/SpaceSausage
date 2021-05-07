extends Sprite

var SPEED : int = 50
signal gone

func _process(delta):
	position.x = position.x - SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("gone")
	queue_free()
