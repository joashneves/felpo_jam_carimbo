extends Node2D

@export var dano : int = 10000;
@export var pontos : int = -10;

var velocidade : float = 200;
var tocando : Node2D = null;
var direcao = [0.05, -0.05, 0.07, -0.07].pick_random()

@onready var sprite_atual = $Sprite2D
@onready var sprite_1 = load("res://Assets/Pizza/pizza.png")
@onready var sprite_2 = load("res://Assets/Cookie/cookie.png")
@onready var sprite_3 = load("res://Assets/Donaut/donut.png")
@onready var pontos_flutuante : PackedScene = load("res://Scene/Pontos/Pontos.tscn")
@onready var escolher_sprite = [sprite_1, sprite_2, sprite_3].pick_random()

@onready var camera : Camera2D = get_tree().get_first_node_in_group("Camera");

func _ready() -> void:
	sprite_atual.texture = escolher_sprite;

func _process(delta: float) -> void:
	position.x -= velocidade * delta
	if position.x < -64:
		GameManager.contabilzar_pontos(20)
		queue_free()
	rodando_o_objeto()
	verifica_velocidade_e_avanca()

func rodando_o_objeto():
	rotation += direcao;

func verifica_velocidade_e_avanca():
	if position.x < 380:
		if velocidade <= 60:
			velocidade = 300

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Carimbo"):
		GameManager.diminui_minutos(dano)
		GameManager.contabilzar_pontos(pontos)
		var pontos_criados = pontos_flutuante.instantiate()
		pontos_criados.quantidade_dos_pontos = pontos
		pontos_criados.position.x = position.x
		pontos_criados.position.y = position.y
		if get_tree() != null:
			get_tree().root.add_child(pontos_criados)
			body.encostei_em_algo()
			camera.trigger_shake()
			queue_free()
