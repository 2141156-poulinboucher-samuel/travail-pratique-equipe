extends Area2D

"""
Déclaration des variables globales du script
"""
signal endgame

"""
Fait avancer la balle
"""
func _physics_process(_delta):
	position.x+=3

"""
Si la balle entre en collision avec le joueur, envoie le signal de fin de partie. Se supprime toujours après collision
"""
func _on_AlienBullet_body_entered(body):
	if "score" in body:
		body.queue_free()
		emit_signal("endgame")
	self.queue_free()
