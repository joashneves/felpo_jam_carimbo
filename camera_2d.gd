extends Camera2D

@export var max_shake : float = 10.0
@export var shake_fade : float = 10.0
var _shake_forca : float = 0

func trigger_shake() -> void:
	_shake_forca = max_shake
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if _shake_forca > 0:
		_shake_forca = lerp(_shake_forca, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-_shake_forca, _shake_forca), randf_range(-_shake_forca, _shake_forca))
