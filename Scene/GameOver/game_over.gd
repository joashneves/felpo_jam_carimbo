extends Node2D

@export var menu_cena : PackedScene;
@export var jogar_cena : PackedScene;

@onready var pontuacao_atual : Label = $CanvasLayer/Control/PontuacaoAtual
@onready var pontuacao_maxima : Label = $CanvasLayer/Control/PontuacaoMaximo

var temp_pontos : int = GameManager.pontos;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zerar_pontuacao()
	var frase = str("Sua Pontuação foi : " + str(temp_pontos))
	var frase_max = str("Sua Pontuação maxima foi : " + str(GameManager.maximo_de_pontos))
	pontuacao_atual.text = frase
	pontuacao_maxima.text = frase_max

func _on_ir_menu_pressed() -> void:
	get_tree().change_scene_to_packed(menu_cena)

func _on_jogar_novamente_pressed() -> void:
	get_tree().change_scene_to_packed(jogar_cena)
	
func _on_sair_do_jogo_pressed() -> void:
	get_tree().quit()

func zerar_pontuacao():
	var pontos_main = GameManager.pontos
	if pontos_main > GameManager.maximo_de_pontos:
		GameManager.maximo_de_pontos = pontos_main
	GameManager.pontos = 0


func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
