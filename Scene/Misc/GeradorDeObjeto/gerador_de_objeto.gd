extends Node2D

@export var objetos_a_serem_criados : PackedScene;
var player_node : CharacterBody2D;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	gerador_de_objetos()

func gerador_de_objetos():
	var level = GameManager.level
	var objeto_instanca = objetos_a_serem_criados.instantiate()
	match level:
		1:
			var objetos_y = randf_range(64, 312)
			objeto_instanca.position = Vector2(820, objetos_y)
			objeto_instanca.velocidade = [50,60,90,100, 150,170].pick_random() * GameManager.level;
			#print(str(tempo_do_gerador) + "tempo de level : " + str(objeto_instanca.velocidade))
		2:
			var objetos_y = randf_range(64, 312)
			objeto_instanca.position = Vector2(820, objetos_y)
			objeto_instanca.velocidade = [90,100, 150,170].pick_random() * GameManager.level;
		3:
			var objetos_y = randf_range(64, 312)
			objeto_instanca.position = Vector2(820, objetos_y)
			objeto_instanca.velocidade = [100, 150,170].pick_random() * GameManager.level;
		4:	
			var chance_de_teleguiado = randf_range(0,100)
			if(chance_de_teleguiado < 50):
				var objetos_y = randf_range(64, 312)
				objeto_instanca.position = Vector2(820, objetos_y)
				objeto_instanca.velocidade = [100, 150,170, 200].pick_random() * GameManager.level;
			else:
				player_node = get_tree().get_first_node_in_group("Carimbo")
				print("Carimbos esta em : "+ str(player_node.position))
				objeto_instanca.position = Vector2(820, player_node.position.y )
				objeto_instanca.velocidade = [100, 150,170, 200].pick_random() * GameManager.level;
		5:
			var chance_de_teleguiado = randf_range(0,100)
			if(chance_de_teleguiado <= 70):
				var objetos_y = randf_range(64, 312)
				objeto_instanca.position = Vector2(820, objetos_y)
				objeto_instanca.velocidade = [100, 150,170, 200].pick_random() * GameManager.level;
			else:
				player_node = get_tree().get_first_node_in_group("Carimbo")
				print("Carimbos esta em : "+ str(player_node.position))
				objeto_instanca.position = Vector2(820, player_node.position.y )
				objeto_instanca.velocidade = [150,170, 200].pick_random() * GameManager.level;
		6:
			player_node = get_tree().get_first_node_in_group("Carimbo")
			print("Carimbos esta em : "+ str(player_node.position))
			objeto_instanca.position = Vector2(820, player_node.position.y )
			objeto_instanca.velocidade = [150,170,200, 250].pick_random() * GameManager.level;
		_:
			var objetos_y = randf_range(64, 312)
			objeto_instanca.position = Vector2(820, objetos_y)
			objeto_instanca.velocidade = [50,60,90,100, 150,170].pick_random() * GameManager.level;

	add_child(objeto_instanca)
