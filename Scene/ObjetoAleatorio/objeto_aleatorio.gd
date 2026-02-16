extends Node2D

@export var dano : int = 100;
@export var pontos : int = -10;

var velocidade : float = 200;
var tocando : Node2D = null;
var direcao = [0.05, -0.05, 0.07, -0.07].pick_random()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= velocidade * delta
	if position.x < -64:
		GameManager.contabilzar_pontos(20)
		queue_free()
	rodando_o_objeto()
	
func rodando_o_objeto():
	rotation += direcao;

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Carimbo"):
		GameManager.diminui_minutos(dano * 60)
		GameManager.contabilzar_pontos(pontos)
		queue_free()
		
