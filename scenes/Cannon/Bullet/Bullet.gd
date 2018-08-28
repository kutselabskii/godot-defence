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
	alive = false
	hide()
	$CollisionShape2D.disabled = true
	$Hitsound.play()


func die():
	queue_free()