extends KinematicBody2D

var x = 0
var y = 0
var rot = 0
var timer = 0
var passed = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	set_rot(timer * 0.05)
	if passed == 0:
		set_opacity(0.50)
	else:
		set_opacity(1)
		get_child(2).hide()
		get_child(0).show()
	set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	if get_pos().x < 10 and x < 0:
		set_pos(Vector2(670 + x, get_pos().y + y))
		passed += 1
		if passed == 1:
			get_child(3).play("se_kira01")
	elif get_pos().x > 670 and x > 0:
		set_pos(Vector2(10 + x, get_pos().y + y))
		passed += 1
		if passed == 1:
			get_child(3).play("se_kira01")
	elif get_pos().y < 30 and y < 0:
		set_pos(Vector2(get_pos().x + x, 690 + y))
		passed += 1
		if passed == 1:
			get_child(3).play("se_kira01")
	elif get_pos().y > 690 and y > 0:
		set_pos(Vector2(get_pos().x + x, 30 + y))
		passed += 1
		if passed == 1:
			get_child(3).play("se_kira01")
	if passed == 2:
		queue_free()
