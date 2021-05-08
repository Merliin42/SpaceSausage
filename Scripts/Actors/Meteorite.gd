extends Area2D

var type : int = 1 # 0 = straight, 1 = sinusoidal
export var SPEED : int = 200

func _process(delta):
	if type == 0 :
		straight(delta)
	elif type == 1 :
		sinusoidal(delta)

func straight(delta):
	self.position.x -= SPEED * delta

func sinusoidal(delta):
	self.position.x -= SPEED * delta
	self.position.y = position.y + sin(position.x/100)*10
