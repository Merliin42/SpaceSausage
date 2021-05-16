extends Sprite

export var SPEED : int = 50

func _process(delta):
	position.x = position.x - SPEED * delta

func _on_VisibilityNotifier2D_screen_exited():
	self.position = Vector2(992, 264)
