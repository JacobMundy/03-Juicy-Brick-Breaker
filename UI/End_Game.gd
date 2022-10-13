extends Control

func _ready():
	$Label2.text = "Final Score -" + str(Global.score)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
