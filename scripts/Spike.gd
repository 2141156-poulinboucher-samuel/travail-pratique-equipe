extends Area2D

signal endgame

func _ready():
	pass


func _on_Spike_body_entered(body):
	body.queue_free()
	emit_signal("endgame")
