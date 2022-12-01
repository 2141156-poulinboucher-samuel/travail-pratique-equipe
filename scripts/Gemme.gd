extends Area2D

"""
Déclaration des variables globales au script
"""
signal collecte

func _on_Area2D_body_entered(body):
	body.score += 100
	emit_signal("collecte")
	self.queue_free()
