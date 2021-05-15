extends CanvasLayer

var score : int = 0

func change_score(score : int):
	$Tween.interpolate_property(self, "score", self.score, score, 1, Tween.TRANS_LINEAR)
	$Tween.start()

func change_color(color : Color) :
	$MarginContainer/VBoxContainer/Score.add_color_override("font_color", color)

func _process(delta):
	$MarginContainer/VBoxContainer/Score.text = str(score)

