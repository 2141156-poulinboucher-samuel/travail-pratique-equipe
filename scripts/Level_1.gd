extends Node2D

"""
Déclaration des variables globales au script
"""
signal victoire
var PorteOuverte = preload("res://scenes/PorteOuverte.tscn")

onready var map = $Map_1
onready var gemmes = $Map_1/Gemme.get_children()
onready var spikes = $Map_1/Spike.get_children()
onready var player = $Player
onready var porteVerouille = $Map_1/PorteVerouille
onready var porteOuverte = $Map_1/PorteOuverte

var porteOuverteFin = PorteOuverte.instance()
var gemmeCollecte = 0

"""
Vérifie si le personnage tombe hors de la carte et signal la fin de la partie si oui
"""
func _process(delta):
	if player.position.y > 1240:
		player.queue_free()
		_on_EndGame()
		
"""
Initialise les signaux et les assignes à leur méthode
"""
func _ready():
	for gemme in gemmes:
		gemme.connect("collecte", self, "_on_Gemme_Collected" )
	for spike in spikes:
		spike.connect("endgame", self, "_on_EndGame")
	player.connect("endgame", self, "_on_EndGame")
	porteVerouille.connect("endgame", self, "_on_EndGame")
	porteOuverte.connect("win", self, "_on_Win")
	porteOuverteFin.connect("win", self, "_on_Win")

"""
Fonction qui gère l'ouverture de la porte lorsqu'assez de gemmes sont collectée
"""
func _on_Gemme_Collected():
	gemmeCollecte += 1
	if gemmeCollecte == 8:
		_change_porte()

"""
Change la porte verouillée pour une porte déverouillée
"""
func _change_porte():
		map.add_child(porteOuverteFin)
		porteOuverteFin.global_position = porteVerouille.global_position
		porteVerouille.queue_free()

"""
Affiche le menu de défaite lors de la mort du joueur
"""
func _on_EndGame():
	get_tree().change_scene("res://scenes/Main.tscn")

"""
Envoi le signal lors de la victoire 
"""
func _on_Win():
	emit_signal("victoire")
