extends CanvasLayer


func change_score(score : int):
	$VBoxContainer/Score.text = str(score)

func change_color(color : Color) :
	$VBoxContainer/Score.add_color_override("font_color", color)
