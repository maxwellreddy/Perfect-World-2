var x = 0
var y = 0
var timer = 0
var orig_x = 0
var orig_y = 0
var orig_rot = 0
var id = 0
var rot = 0
var active = false

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if timer == 1:
		get_child(2).play("se_boon00")
	if timer == 85:
		get_child(2).play("se_lazer01")
	if 0 <= timer and timer <= 85:
		set_scale(Vector2(0.1, 1))
	elif 85 < timer and timer <= 90:
		set_scale(Vector2(0.2 * (timer - 85), 1))
	elif 90 < timer and timer <= 120:
		set_scale(Vector2(1, 1))
	else:
		queue_free()
	