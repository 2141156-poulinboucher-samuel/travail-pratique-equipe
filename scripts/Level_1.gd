extends Node2D

onready var gemmes = $Map_1/Gemme.get_children()
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for gemme in gemmes:
		gemme.connect("collecte", self, "_on_Gemme_Collected" )

func _on_Gemme_Collected():
	score += 100
