extends Area2D

"""
Déclaration des variables globales au script
"""
signal endgame()

"""
Tue le joueur et envoi le signal de fin de partie (défaite)
"""
func _on_Spike_body_entered(body):
	body.queue_free()
	emit_signal("endgame")
