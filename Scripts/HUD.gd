extends Control


func change_score(score : int):
	$VBoxContainer/Score.text = str(score)

func change_time(time : int):
	var minutes : int = int(time/60)
	var seconds : int = int(time%60)
	var text : String = str(minutes) + ":" + str(seconds)
	$VBoxContainer/Time.text = text
