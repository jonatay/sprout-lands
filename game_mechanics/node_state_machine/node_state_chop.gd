extends NodeState

@export var hit_component_collision_shape_2d : CollisionShape2D

func _ready():
	if hit_component_collision_shape_2d:
		hit_component_collision_shape_2d.disabled = true
		hit_component_collision_shape_2d.position = Vector2.ZERO


func on_enter() -> void:
	_deal_with_direction_facing_stuff("chop")
	_deal_with_tool_hitbox_location(hit_component_collision_shape_2d, DataTypes.Tools.TOOL_CHOP)
	hit_component_collision_shape_2d.disabled = false


func on_exit() -> void:
	hit_component_collision_shape_2d.position = Vector2.ZERO
	hit_component_collision_shape_2d.disabled = true

	

func on_next_transitions() -> void:
	if not animated_sprite_2d.is_playing():
		transition.emit("idle")
