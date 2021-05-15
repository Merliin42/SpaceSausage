extends KinematicBody2D

const SPEED : int = 500
var SCREEN_SIZE
onready var soundPool : Array = [$Waf1, $Waf2]
signal hit(points)
var croc : bool = false
var spacedogEnabled : bool = false

func _ready():
	SCREEN_SIZE = get_viewport_rect().size

func _process(_delta):
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


func _on_Area2D_area_entered(_area):
	randomize()
#	soundPool[rand_range(0, 2)].play()
	if !spacedogEnabled :
		$AnimatedSprite.play("Croc")
	elif spacedogEnabled :
		$AnimatedSprite.play("SpaceCroc")
	croc = true


func _on_FishCatcher_area_entered(_area):
	emit_signal("hit", -100)
	soundPool[rand_range(0, 2)].play()
func spaceDog():
	spacedogEnabled = true
	$AnimatedSprite.play("SpaceDog")


func _on_AnimatedSprite_animation_finished():
	if croc and !spacedogEnabled :
		croc = false
		$AnimatedSprite.play("default")
	elif croc and spacedogEnabled :
		croc = false
		$AnimatedSprite.play("SpaceDog")
