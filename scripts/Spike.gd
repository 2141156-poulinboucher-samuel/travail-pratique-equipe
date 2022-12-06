extends Area2D

"""
Déclaration des variables globales au script
"""
signal endgame(score)

"""
Envoie le signal de fin de partie (défaite) lorsque le joueur touche le spike
"""
func _on_Spike_body_entered(body):
	emit_signal("endgame", body.score)
