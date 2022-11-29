extends Node2D

onready var gemmes = $Map_1/Gemme.get_children()
onready var spikes = $Map_1/Spike.get_children()
onready var player = $Player

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for gemme in gemmes:
		gemme.connect("collecte", self, "_on_Gemme_Collected" )
	for spike in spikes:
		spike.connect("endgame", self, "_on_EndGame")
	player.connect("endgame", self, "_on_EndGame")
	
func _on_Gemme_Collected():
	score += 100

func _on_EndGame():
	get_tree().change_scene("res://scenes/Main.tscn")
