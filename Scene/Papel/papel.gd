extends Node2D

@export var velocidade : float = 200

@onready var sprite_do_papel : AnimatedSprite2D = $AnimationSprite
var carimbo_1 = load("res://Assets/Papel/pape_carimbadol.png");
var carimbado : bool = false
var tocando : Node2D = null;
var direcao =  [0.05, -0.05, 0,0.07, -0.07].pick_random()
var velocidade_em_y = [1,0, -1].pick_random()
var mudar_de_direcao_em_x : float = 292.0
signal papel;

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	position.x -= velocidade * delta
	if GameManager.level > 3:
		position.y -= (20 * velocidade_em_y) * delta
	if position.x < -64:
		GameManager.passou_papel(carimbado)
		queue_free()
func _physics_process(delta: float) -> void:
	rodando_o_papel()
	if Input.is_action_pressed("carimbar") and tocando != null and carimbado == false:
			GameManager.contabilzar_pontos([5,10,15].pick_random())
			sprite_do_papel.play("carimbado_1")
			carimbado = true
			
func rodando_o_papel():
	rotation += direcao;
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Carimbo"):
			tocando = body
func _on_area_2d_body_exited(body: Node2D) -> void:
		if body.is_in_group("Carimbo"):
			tocando = null
