extends Node2D

@onready var label_de_pontos : Label = $CanvasLayer/Control/Pontos
@onready var label_de_minutos : Label = $CanvasLayer/Control/Tempo

@onready var tocador_de_musica : AudioStreamPlayer = $Musica_player

func _ready() -> void:
	tocador_de_musica.play()
	
func _process(delta: float) -> void:
	label_de_pontos.text = str(GameManager.pontos)

	GameManager.diminui_minutos(delta * 1000) # diminui em milissegundos

	var time_ms := GameManager.minutos
	
	if time_ms < 0:
		time_ms = 0
	
	var total_seconds := int(time_ms / 1000)
	var minutes := total_seconds / 60
	var seconds := total_seconds % 60
	
	var time_string := "%02d:%02d" % [minutes, seconds]
	label_de_minutos.text = time_string


func _on_musica_player_finished() -> void:
	tocador_de_musica.play()
