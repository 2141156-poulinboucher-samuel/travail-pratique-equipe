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
func _on_Changement_Scene():
	var prochaine_scene = (scene_actuelle + 1) % Scenes.size()
	var noeud_prochaine_scene = Scenes[prochaine_scene].instance()
	scene_actuelle = prochaine_scene
	
	noeud_prochaine_scene.connect("victoire", self, "_on_Changement_Scene")
	noeud_scene_actuelle.queue_free()
	add_child(noeud_prochaine_scene)
	noeud_scene_actuelle = noeud_prochaine_scene
