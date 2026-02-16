extends Node2D

@export var papels_scene : PackedScene;
var level : float = 0;
@onready var timer_papel : Timer = $Timer
@export var tempo_do_gerador : float = 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_papel.start(tempo_do_gerador)	

func _on_timer_timeout() -> void:
	var papel_instanca = papels_scene.instantiate()
	var papels_y = randf_range(64, 312)
	papel_instanca.position = Vector2(820, papels_y)
	var level = GameManager.level;
	match level:
		1:
			papel_instanca.velocidade = 200;
			tempo_do_gerador = 1;
		2:
			papel_instanca.velocidade = [200, 210, 230, 250, 300].pick_random();
			tempo_do_gerador = 1;
		3:
			papel_instanca.velocidade = [200, 230, 250, 300, 400].pick_random();
			tempo_do_gerador = 2
		_:
			papel_instanca.velocidade = [100,200, 230, 250, 300, 350, 400, 450, 500,550].pick_random();
			tempo_do_gerador = 2;
	add_child(papel_instanca)
	timer_papel.start((tempo_do_gerador))
