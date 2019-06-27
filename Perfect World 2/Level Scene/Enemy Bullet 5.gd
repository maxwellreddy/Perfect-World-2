extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var orig_x = 0
var orig_y = 0
var orig_rot = 0
var id = 0
var rot = 0

const laser_spawn = preload("res://Level Scene/Enemy Laser 2.tscn")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if timer >= 0 and timer < 15:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y ))
	else:
		set_pos(Vector2(get_pos().x + (x / 5), get_pos().y + (y / 5)))
	
	if get_pos().x > 680 or get_pos().x < 0:
		queue_free()