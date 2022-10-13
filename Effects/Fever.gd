extends Node2D

onready var bg = get_node("/root/Game/ColorRect")

func start_fever():
	fever()
	$Timer.start()
	var fever_indicator = get_node_or_null("/root/Game/UI/HUD/Fever")
	if fever_indicator != null:
		fever_indicator.use_parent_material = false

func end_fever():
	Global.fever = 0 

func _on_Timer_timeout():
	if Global.feverish:
		fever()
		$Timer.start()
		var fever_indicator = get_node_or_null("/root/Game/UI/HUD/Fever")
		if fever_indicator != null:
			fever_indicator.use_parent_material = false
	else:
		end_fever()
		bg.get_material().set_shader_param("timescale", 1)
		var fever_indicator = get_node_or_null("/root/Game/UI/HUD/Fever")
		if fever_indicator != null:
			fever_indicator.use_parent_material = true


func fever():
	bg.get_material().set_shader_param("timescale", 10)
	var ball_container = get_node_or_null("/root/Game/Ball_Container")
	if ball_container != null:
		ball_container.make_ball_fever()
