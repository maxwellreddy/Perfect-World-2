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

	set_pos(Vector2(get_pos().x + x, get_pos().y + y ))
	
	if get_pos().x > 680 or get_pos().x < 0 or get_pos().y > 700 or get_pos().y < 20:
		queue_free()