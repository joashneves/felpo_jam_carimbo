extends CharacterBody2D

@export var velocidade : float = 300

@export var sons_de_carimbo00 : AudioStreamPlayer;
@export var sons_de_carimbo01 : AudioStreamPlayer;
@export var sons_de_dano01 : AudioStreamPlayer;
@export var sons_de_dano02 : AudioStreamPlayer;
@export var sons_de_dano03 : AudioStreamPlayer;

@onready var sprite_animation : AnimatedSprite2D = $Animation
var tempo_de_recargar : float = 50;
var tempo_atual_de_recargar : float = 0;
var pode_carimbar : bool = false;

@onready var  tela_de_pausa : PackedScene = load("res://Scene/Pausa/pausa.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	verificar_se_pode_carimbar()
	animacao_de_carimbar()

		
func _physics_process(delta: float) -> void:
		movimentacao(delta)
	
func movimentacao(delta):
	if Input.is_action_pressed("baixo"):
		position.y += velocidade * delta
	elif Input.is_action_pressed("cima"):
		position.y -= velocidade * delta
	position.y = clamp(position.y, 23, 400)
	move_and_slide()

func verificar_se_pode_carimbar():
	if tempo_atual_de_recargar > tempo_de_recargar:
		pode_carimbar = true
	else: 
		pode_carimbar = false
	tempo_atual_de_recargar += 1;
	
func animacao_de_carimbar():
	if Input.is_action_pressed("carimbar") and pode_carimbar:
		pode_carimbar = false
		sprite_animation.play("carimbo_classico",3,false)
		if randf_range(0, 100) < 70:
			var som_escolhido = [sons_de_carimbo00, sons_de_carimbo01, sons_de_dano03].pick_random()
			som_escolhido.play()
		tempo_atual_de_recargar = 0

func encostei_em_algo() -> void:
	var son_dano = [sons_de_dano01, sons_de_dano02].pick_random()
	son_dano.play()
	#print("Encostei em algo")

func _on_animation_animation_finished() -> void:
	sprite_animation.frame = 0
	pode_carimbar = false;
