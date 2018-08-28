extends Sprite

const BULLET = preload("res://scenes/Cannon/Bullet/Bullet.tscn")

func start():
	position = Vector2(get_viewport_rect().size.x / 2 - 16, 346)

func _ready():
	visible = false
	
func _process(delta):
	if Input.is_action_just_pressed("key_mouse_left"):
		show()
	
	if Input.is_action_just_released("key_mouse_left"):
		hide()
		var bullet = BULLET.instance()
		bullet.init((get_viewport().get_mouse_position() - position).normalized())
		get_parent().add_child(bullet)
		bullet.position = Vector2(position.x, position.y + 10)
		
		$Shot.play()
		
		
