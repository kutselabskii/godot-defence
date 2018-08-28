extends Node

var screensize

func start(_screensize):
	screensize = _screensize
	$Main.position = screensize / 2
	$Truck.position = Vector2(screensize.x / 2, 350)
