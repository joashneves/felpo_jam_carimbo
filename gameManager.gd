extends Node2D

var level : int = 1
var pontos : int = 0
var minutos : int = 300000
var minutos_max : int = 300000
var maximo_de_pontos : int = 0

@onready var cena_game_over : PackedScene = load("res://Scene/GameOver/Game_over.tscn");
	
func passou_papel(estava_carimbado : bool):
	if estava_carimbado == false:
		if pontos > 0:
			pontos -= 1;
			
func diminui_minutos(segundo):
	minutos -= segundo;
	if minutos < 0:
		game_over()

func contabilzar_pontos(_pontos):
	pontos += _pontos;
	if pontos < 0:
		pontos = 0
	aumenta_level()
	
func game_over():
	get_tree().change_scene_to_packed(cena_game_over)
	minutos = minutos_max

func aumenta_level():
	if pontos < 100:
		level = 1
	elif pontos < 129:
		level = 2;
	elif pontos < 350:
		level = 3;
	elif pontos < 1000:
		level = 4
	elif  pontos < 1530:
		level = 5
	elif pontos < 2000:
		level = 6
