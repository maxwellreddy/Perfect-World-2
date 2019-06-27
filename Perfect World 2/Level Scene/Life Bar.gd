extends StaticBody2D

var hp
var max_hp

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	set_scale(Vector2(hp/max_hp, 1))