extends Node2D

"""
Déclaration des variables globales au script
"""
signal victoire
signal mort
var PorteOuverte = preload("res://scenes/PorteOuverte.tscn")

onready var map = $Map_2
onready var gemmes = $Map_2/Gemme.get_children()
onready var spikes = $Map_2/Spike.get_children()
onready var player = $Player
onready var porteVerouille = $Map_2/PorteVerouille

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
	porteOuverteFin.connect("win", self, "_on_Win")

"""
Fonction qui gère l'ouverture de la porte lorsqu'assez de gemmes sont collectée
"""
func _on_Gemme_Collected():
	gemmeCollecte += 1
	if gemmeCollecte == 20:
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
	emit_signal("mort")
"""
Envoi le signal lors de la victoire 
"""
func _on_Win():
	emit_signal("victoire")
