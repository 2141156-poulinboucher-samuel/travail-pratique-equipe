extends Area2D

"""
Déclaration des variables globales au script
"""
signal collecte

"""
Lorsque le corps de la gemme est entré, ajoute le score du joueur, envoi le signal de collecte et se détruit
"""
func _on_Area2D_body_entered(body):
	body.score += 100
	emit_signal("collecte")
	self.queue_free()
