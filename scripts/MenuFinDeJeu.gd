extends Node2D

"""
Recharge le jeu lors de la fin du jeu
"""
func _on_Restart_Button_button_down():
	get_tree().change_scene("res://scenes/Main.tscn")

"""
Quitte le jeu
"""
func _on_Quit_Button_button_down():
	get_tree().quit(1)
