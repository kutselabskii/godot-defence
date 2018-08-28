extends Area2D

var direction
var alive = true

func _on_Visibility_screen_exited():
	alive = false
	$Border_reached.play()


func init(dir):
	direction = dir


func _process(delta):
	if alive:
		position += 800 * delta * direction


func _on_Bullet_area_entered(area):
	if area.get_collision_layer_bit(0):
		alive = false
		hide()
		$CollisionShape2D.disabled = true
		$Hitsound.play()
	else:
		if area.horizontal:
			direction.y = -direction.y
		else:
			direction.x = -direction.x


func die():
	if !alive:
		queue_free()