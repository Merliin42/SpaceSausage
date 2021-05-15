extends Area2D

signal catched(points)
signal missed(points)


const SPEED : Array = [100, 300]
const SIZE : Array = [1, 0.5]
const POINTS : Array = [10, 30]
var type : int

func _ready():
	type = int(rand_range(0, SPEED.size()))
	self.scale = Vector2(SIZE[type], SIZE[type])

func _process(delta):
	self.position.x -= SPEED[type]*delta


func _on_VisibilityNotifier2D_screen_exited():
	if position.x < 0 :
		emit_signal("missed", -POINTS[type])
		self.queue_free()

func _on_Seagull_body_entered(_body):
	emit_signal("catched", POINTS[type])
	self.queue_free()
