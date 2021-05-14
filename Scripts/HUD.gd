extends CanvasLayer


func change_score(score : int):
	$MarginContainer/VBoxContainer/Score.text = str(score)

func change_color(color : Color) :
	$MarginContainer/VBoxContainer/Score.add_color_override("font_color", color)
