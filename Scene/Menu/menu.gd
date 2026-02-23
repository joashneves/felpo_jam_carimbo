extends Node2D

@export var cena_jogo : PackedScene;
@onready var tocador_de_musica : AudioStreamPlayer = $MusicaQueEuFizCommuitocarinho

@onready var animacao_de_transicao : AnimationPlayer = $AnimationPlayer

@onready var control_main: Control = $CanvasLayer/ControlMain
@onready var letras_animadas : AnimatedSprite2D = $Letras
@onready var exit: AnimatedSprite2D = $Exit

@onready var iniciar: Button = $CanvasLayer/ControlMain/Iniciar
@onready var sair: Button = $CanvasLayer/ControlMain/Sair
@onready var creditos: Button = $CanvasLayer/ControlMain/Creditos
@onready var como_jogar: Button = $CanvasLayer/ControlMain/ComoJogar
@onready var como_jogar_controle: Control = $CanvasLayer/ComoJogarControle
@onready var creditos_control: Control = $CanvasLayer/Creditos

func _ready() -> void:
	control_main.visible = true
	como_jogar_controle.visible = false
	creditos_control.visible = false
	
func _process(delta: float) -> void:
	if iniciar.is_hovered():
		letras_animadas.frame = 2;
	elif como_jogar.is_hovered():
		letras_animadas.frame = 4;
	elif creditos.is_hovered():
		letras_animadas.frame = 1;
	else:
		letras_animadas.frame = 0;
	
	if sair.is_hovered():
		exit.frame = 1;
	else:
		exit.frame = 0;
		
		

func _on_iniciar_jogo_pressed() -> void:
	animacao_de_transicao.play("comecar_jogo")

func _on_sair_pressed() -> void:
	if animacao_de_transicao.get_playing_speed() == 0:
		get_tree().quit()


func _on_musica_que_eu_fiz_commuitocarinho_finished() -> void:
	tocador_de_musica.play()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(cena_jogo)
	


func _on_sair_de_como_jogar_pressed() -> void:
	control_main.visible = true
	como_jogar_controle.visible = false


func _on_como_jogar_pressed() -> void:
	control_main.visible = false
	como_jogar_controle.visible = true


func _on_sair_de_creditos_pressed() -> void:
	creditos_control.visible = false
	control_main.visible = true


func _on_creditos_pressed() -> void:
	creditos_control.visible = true
	control_main.visible = false
