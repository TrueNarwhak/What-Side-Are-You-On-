extends Node2D


func _ready():
	pass

func _process(delta):
	$Holder.scale.x = lerp($Holder.scale.x, 1, 0.2)
	$Holder.scale.y = lerp($Holder.scale.y, 1, 0.2)


func _on_RestartPrompt_timeout():
	$RestartPopup.show()
