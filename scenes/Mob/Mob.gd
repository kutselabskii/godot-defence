extends Area2D

enum STATE {
	IDLE,
	WALK_RIGHT,
	WALK_LEFT,
	DYING
}

var modulations = [Color(0, 0, 255), Color(255, 255, 0), Color(255, 0, 0)]

var screensize
var state = STATE.IDLE
var hit_points = 2


func _ready():
	randomize()
	change_state()
	switch_animation()
	$Sprite.self_modulate = modulations[hit_points]


func _process(delta):
	var velocity = Vector2(0, 0)
	if state == STATE.WALK_LEFT:
		velocity.x += -100 * delta
	if state == STATE.WALK_RIGHT:
		velocity.x += 100 * delta
	position += velocity
	position.x = clamp(position.x, 0, get_viewport_rect().size.x)


func start(starting_position = Vector2(150, 500)):
	position = starting_position


func _on_Player_area_entered(area):
	hit_points -= 1
	$Sprite.self_modulate = modulations[hit_points]

	if hit_points <= 0:
		$StateTimer.stop()
		state = STATE.DYING
		$CollisionShape2D.disabled = true
		$AnimationPlayer.play("Dying")
		$Beep.play()
	
	
func switch_animation():
	if state == STATE.IDLE:
		$AnimationPlayer.play("Idle")
	elif state == STATE.WALK_LEFT:
		$AnimationPlayer.play("Movement")
		$Sprite.flip_h = false
	elif state == STATE.WALK_RIGHT:
		$AnimationPlayer.play("Movement")
		$Sprite.flip_h = true
		
func change_state():
	var time = randf() + 1
	var new_state = randi() % (len(STATE) - 1)
	state = new_state
	switch_animation()
	$StateTimer.wait_time = time
	$StateTimer.one_shot = true
	$StateTimer.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Dying":
		get_parent().create_mob()
		queue_free()
