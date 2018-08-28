extends Node

const MOB = preload("res://scenes/Mob/Mob.tscn")

var screensize

func _ready():
	screensize = Vector2(ProjectSettings.get_setting("display/window/size/width"),
		ProjectSettings.get_setting("display/window/size/height"))
		
	create_objects()


func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
	if Input.is_action_just_pressed("key_m"):
		$Music.switch_state()
		
func create_objects():
	$Background.start(screensize)
	
	for i in range(3):
		create_mob()
	
	$Cannon.start()

func create_mob():
	var mob = MOB.instance()
	mob.start(Vector2(randi() % 500 + 40, randi() % int(500) + 400))
	add_child(mob)
