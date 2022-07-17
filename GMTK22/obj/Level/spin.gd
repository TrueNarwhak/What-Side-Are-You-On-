extends Position2D

export var spin = 8.0

func _ready():
	pass

func _process(delta):
	rotation += spin * delta * 60
