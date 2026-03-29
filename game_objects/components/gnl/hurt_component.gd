extends Area2D
class_name HurtComponent

@export var tool : DataTypes.Tools = DataTypes.Tools.TOOL_NONE

signal on_hurt

func _ready():
	area_entered.connect(_on_area_entered)


func _on_area_entered(area):
	if area is HitComponent and area.tool == tool:
		on_hurt.emit(area.damage)
