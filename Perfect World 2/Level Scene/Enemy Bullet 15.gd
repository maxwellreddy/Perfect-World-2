extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var orig_x = 0
var orig_y = 0
var orig_rot = 0
var id = 0
var rot = 0
var randx = 0

const laser_spawn = preload("res://Level Scene/Enemy Laser 2.tscn")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if timer >= 0 and timer <= 220:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	elif timer > 220 and timer <= 230:
		set_pos(Vector2(get_pos().x + 0, get_pos().y + 0))
		randx = rand_range(-1, 1)
	else:
		set_pos(Vector2(get_pos().x + randx, get_pos().y - ((timer - 230) * 0.01)))
	if timer > 220:
		get_child(2).show()
	if get_pos().x < 30 or get_pos().x > 650 or get_pos().y > 670 or get_pos().y < 50:
		queue_free()