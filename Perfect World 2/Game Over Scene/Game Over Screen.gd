extends Node2D
var loaded = false
var restart = false
const level_spawn = preload("res://Level Scene/level.tscn")

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	set_pos(Vector2(480, 360))
	if loaded == false:
		loaded = true
	if restart == true:
		queue_free()
		var level = level_spawn.instance()
		level.set_pos(Vector2(0, 0))
		get_tree().get_root().add_child(level)
		loaded = true
		

func _input(event):
	if event.is_action_pressed("ui_c"):
		restart = true
	if event.is_action_released("ui_c"): 
		restart = false