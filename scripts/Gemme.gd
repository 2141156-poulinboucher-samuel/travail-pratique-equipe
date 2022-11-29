extends Area2D

func _ready():
	pass

signal collecte

func _on_Area2D_body_entered(body):
	emit_signal("collecte")
	self.queue_free()
