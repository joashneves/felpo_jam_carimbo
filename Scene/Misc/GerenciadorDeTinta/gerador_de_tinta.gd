extends Node2D

@export var objetos_a_serem_criados : PackedScene;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var objeto_instanca = objetos_a_serem_criados.instantiate()
	var objetos_y = randf_range(64, 312)
	objeto_instanca.position = Vector2(820, objetos_y)
	objeto_instanca.velocidade = [50,60,90,100, 150,170].pick_random() * GameManager.level;
	#print(str(tempo_do_gerador) + "tempo de level : " + str(objeto_instanca.velocidade))
	add_child(objeto_instanca)
