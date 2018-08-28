extends Node

var screensize

func start(_screensize):
	screensize = _screensize
	$Main.position = screensize / 2
	$Truck.position = Vector2(screensize.x / 2, 350)
	
	$Border_bottom.position = Vector2(screensize.x / 2, screensize.y - 300)
	$Border_bottom.scale = Vector2(11.5, 0.1)
	$Border_bottom.start(true)
	
	$Border_top.position = Vector2(screensize.x / 2, 0)
	$Border_top.scale = Vector2(11.5, 0.1)
	$Border_top.start(true)
	
	$Border_left.position = Vector2(0, screensize.y / 2)
	$Border_left.scale = Vector2(0.1, 20.5)
	$Border_left.start(false)
	
	$Border_right.position = Vector2(screensize.x, screensize.y / 2)
	$Border_right.scale = Vector2(0.1, 20.5)
	$Border_right.start(false)
	
	
