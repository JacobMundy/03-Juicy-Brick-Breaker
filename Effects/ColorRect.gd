extends ColorRect

var c = 0
var colors = [
	Color8(0,0,0)     #black
	,Color8(33,37,41)   #gray 9
	,Color8(52,58,64)   #gray 8
	,Color8(73,80,87)   #gray 7
	,Color8(52,58,64)   #gray 8
	,Color8(33,37,41)   #gray 9
]

func _ready():
	update_color()

func update_color():
	$Tween.interpolate_property(self, "color", color, colors[c], 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Tween_tween_all_completed():
	c = wrapi(c+1, 0, colors.size())
	update_color()
