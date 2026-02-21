extends Node2D

@export var texto_dos_pontos : String = "";
@export var quantidade_dos_pontos : int;

@onready var label_texto : Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	verfica_ponto(quantidade_dos_pontos)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	voa_meio_fluante(delta)

func verfica_ponto(pontos) -> void:
	if pontos < 0:
		label_texto.text = str(+pontos)
		label_texto.add_theme_color_override("font_color", Color(129.359, 0.219, 0.077, 1.0) )
	else:
		label_texto.text = str(pontos)
		label_texto.add_theme_color_override("font_color", Color(0.0, 44.299, 0.0, 1.0) )

func voa_meio_fluante(delta):
	if quantidade_dos_pontos >= 0:
		position.y -= 40 * delta
	else:
		position.y += 40 * delta

func _on_timer_timeout() -> void:
	queue_free()
