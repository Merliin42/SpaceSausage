extends KinematicBody2D

const SPEED : int = 500
var SCREEN_SIZE
onready var soundPool : Array = [$Waf1, $Waf2]
signal hit(points)

func _ready():
	SCREEN_SIZE = get_viewport_rect().size

func _process(delta):
	var velocity : Vector2 = Vector2(0, 0)
	if Input.is_action_pressed("left"):
		velocity.x = -1
	if Input.is_action_pressed("right"):
		velocity.x = 1
	if Input.is_action_pressed("up"):
		velocity.y = -1
	if Input.is_action_pressed("down"):
		velocity.y = 1
	move_and_slide(velocity.normalized()*SPEED)


func _on_Area2D_area_entered(area):
	randomize()
#	soundPool[rand_range(0, 2)].play()


func _on_FishCatcher_area_entered(area):
	emit_signal("hit", -100)

func spaceDog():
	$AnimatedSprite.play("SpaceDog")
