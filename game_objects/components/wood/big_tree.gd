extends Sprite2D
class_name BigTree

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

var log_scene : PackedScene = preload("uid://d3mrfhhhbfxxd")


func _ready():
	hurt_component.on_hurt.connect(_on_hurt)
	damage_component.max_damage_reached.connect(_on_max_damage_reached)

func _on_hurt(hit_damage:int)-> void:
	damage_component.apply_damage(hit_damage)
	# print("current damage: ", damage_component.current_damage)

func _on_max_damage_reached():
	call_deferred("_create_resource") 
	queue_free()

func _create_resource():
	var log_instance = log_scene.instantiate()
	get_parent().add_child(log_instance)
	log_instance.global_position = global_position
