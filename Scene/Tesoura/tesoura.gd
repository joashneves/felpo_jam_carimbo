extends Node2D

@onready var papel_cortando : PackedScene = load("res://Scene/PapelCortado/papelCortado.tscn")

@export var velocidade : float = 600;
var _direction : Vector2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.x * velocidade * delta
	if position.x < -64:
		queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Papel"):
		print("Encostou no papel")
		body.queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Papel"):
		print(area.get_parent())
		var area_papel = area.get_parent()
		var papel_cortado = papel_cortando.instantiate()
		papel_cortado.direcao = area_papel.direcao;
		papel_cortado.velocidade = area_papel.velocidade
		papel_cortado.position = area_papel.position;
		area_papel.queue_free()
		get_tree().root.add_child(papel_cortado)
		
