extends Node2D

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
		area.get_parent().queue_free()
