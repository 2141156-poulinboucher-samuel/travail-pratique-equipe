extends Area2D

"""
Déclaration des variables globales au script
"""
signal win(score)

"""
Lorsque le joueur entre dans la porte, envoi le signal de victoire
"""
func _on_PorteOuverte_body_entered(body):
	emit_signal("win", body.score)
