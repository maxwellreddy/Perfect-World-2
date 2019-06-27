extends RigidBody2D

const level_spawn = preload("res://Level Scene/level.tscn")
var selected = false
var loaded = false
var highlighted = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	if (selected == true and loaded == false):
		get_parent().queue_free()
		var level = level_spawn.instance()
		level.set_pos(Vector2(0, 0))
		get_tree().get_root().add_child(level)
		loaded = true
	
func _input(event):
	if event.is_action_pressed("ui_z"):
		selected = true
	if event.is_action_released("ui_z"): 
		selected = false