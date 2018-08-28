extends Node

var pause_time = 0.0
var currently_playing = false

func _ready():
	$Melody.stream = load("res://resources/sounds/music/menu_music_001.ogg")

func pause():
	pause_time = $Melody.get_playback_position()
	$Melody.stop()
	currently_playing = false

func resume():
	$Melody.play(pause_time)
	currently_playing = true
	
func play():
	$Melody.play()
	currently_playing = true
	
func switch_state():
	if currently_playing:
		pause()
	else:
		resume()