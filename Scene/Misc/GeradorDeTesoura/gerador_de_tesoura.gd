extends Node2D

@export var tesouras_scene : PackedScene;
var level : float = 0;
@onready var timer: Timer = $Timer
@export var tempo_do_gerador : float = 1;


func _on_timer_timeout() -> void:
	if GameManager.level > 4:
		var instance_tesoura = tesouras_scene.instantiate()
		var node_carimbo = get_tree().get_first_node_in_group("Carimbo")
		var spawn = [Vector2(820,432), Vector2(820,0)].pick_random()
		var position_ = node_carimbo.position - instance_tesoura.position ;
		instance_tesoura.position = spawn
		instance_tesoura.look_at(position_)
		#instance_tesoura.global_position = global_position;
		add_child(instance_tesoura)
			
