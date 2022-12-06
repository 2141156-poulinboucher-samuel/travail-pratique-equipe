extends Area2D

"""
Déclaration des variables globales au script
"""
signal endgame(score)

"""
Envoi le signal de fin de partie (défaite) lorsque le joueur touche la porte verouillée
"""
func _on_PorteVerouille_body_entered(body):
	emit_signal("endgame", body.score)
