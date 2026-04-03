
@icon("res://asset/icons/state.svg")
class_name NodeState
extends Node

var animation_cardinals : Array = ["right","down","left","up"]
var tool_hitbox_location : Array = [[],[Vector2(9,0), Vector2(0,3), Vector2(-9,0), Vector2(0,-20)]]

@export var player : Player
@export var animated_sprite_2d : AnimatedSprite2D

var velocity : Vector2

@warning_ignore("unused_signal")
signal transition 

func get_4dir_index(angle: float) -> int:
	# Normalize angle to 0 - 2*PI
	var normalized_angle = fposmod(angle, PI * 2)
	# Divide into 4 quadrants (90 degrees each)
	var index = round(normalized_angle / (PI / 2))
	# Rounding can result in 4, which is the same as 0 (Right)
	return int(index) % 4
	# Usage Example:
	# var angle = velocity.angle()
	# var direction = get_4dir_index(angle)

func _deal_with_direction_facing_stuff(anim_name: String):
	var direction: Vector2 = player.player_direction
	var angle = direction.angle()
	var index = get_4dir_index(angle)
	animated_sprite_2d.play("%s_%s" % [anim_name, animation_cardinals[index]])

func _deal_with_tool_hitbox_location(hit_component_collision_shape_2d, tool: DataTypes.Tools):
	assert(  
		hit_component_collision_shape_2d, 
		"hit_component_collision_shape_2d must be assigned in the inspector"
		)
	var direction: Vector2 = player.player_direction
	var angle = direction.angle()
	var index = get_4dir_index(angle)
	hit_component_collision_shape_2d.position = tool_hitbox_location[tool][index]

func on_process(_delta : float) -> void:
	pass


func on_physics_process(_delta : float) -> void:
	pass


func on_next_transitions() -> void:
	pass
 

func on_enter() -> void:
	pass


func on_exit() -> void:
	pass
