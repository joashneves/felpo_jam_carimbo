extends Node2D

@export var cena_jogo : PackedScene;
@onready var tocador_de_musica : AudioStreamPlayer = $MusicaQueEuFizCommuitocarinho

@onready var animacao_de_transicao : AnimationPlayer = $AnimationPlayer


func _on_iniciar_jogo_pressed() -> void:
	animacao_de_transicao.play("comecar_jogo")


func _on_sair_pressed() -> void:
	if animacao_de_transicao.get_playing_speed() == 0:
		get_tree().quit()


func _on_musica_que_eu_fiz_commuitocarinho_finished() -> void:
	tocador_de_musica.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(cena_jogo)
