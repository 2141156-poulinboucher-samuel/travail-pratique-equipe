"""
Script grandement inspiré de Frédérik Taleb 
https://github.com/talebFrederik/spaceSHMUP_A22/blob/master/scripts/Main.gd
"""
extends Node

"""
Déclaration des variables globales
"""
var Scenes = [preload("res://scenes/Menu.tscn"), preload("res://scenes/Level_1.tscn"), preload("res://scenes/Level_2.tscn"), preload("res://scenes/MenuVictoire.tscn")]
var MenuDefaite = preload("res://scenes/MenuDefaite.tscn")

var scene_actuelle = 0
var noeud_scene_actuelle
var scoreFinal = 0

"""
Initialise le menu de démarrage et l'ajoute au main
"""
func _ready():
	noeud_scene_actuelle = Scenes[scene_actuelle].instance()	
	noeud_scene_actuelle.connect("lancement_jeu", self, "_on_Changement_Scene")
	add_child(noeud_scene_actuelle)

"""
Effectue le changement de scènes lorsque le niveau est terminé
"""
func _on_Changement_Scene(score:int):
	var prochaine_scene = (scene_actuelle + 1) % Scenes.size()
	var noeud_prochaine_scene = Scenes[prochaine_scene].instance()
	scene_actuelle = prochaine_scene
	
	noeud_prochaine_scene.connect("victoire", self, "_on_Changement_Scene")
	noeud_prochaine_scene.connect("mort", self, "_on_Mort")
	noeud_scene_actuelle.queue_free()
	add_child(noeud_prochaine_scene)
	noeud_scene_actuelle = noeud_prochaine_scene

	scoreFinal += score
	if scene_actuelle == 3:
		var label_score = $MenuVictoire/MarginContainer/VBoxContainer/Score
		label_score.text = "Score: " + str(scoreFinal)

"""
Lorsque le joueur meurs, change la scène pour le menu de défaite
"""
func _on_Mort(score:int):
	var menu_defaite = MenuDefaite.instance()
	noeud_scene_actuelle.queue_free()
	add_child(menu_defaite)
	var label_score = $MenuDefaite/MarginContainer/VBoxContainer/Score
	label_score.text = "Score: " + str(scoreFinal+score)
