extends Node

"""
Déclaration des variables globales du script
"""
signal lancement_jeu(score)

"""
Envoi le signal de lancement du jeu
"""
func _on_Play_Button_button_down():
	emit_signal("lancement_jeu", 0)

"""
Quitte le jeu
"""
func _on_Quit_Button_button_down():
	get_tree().quit(1)
