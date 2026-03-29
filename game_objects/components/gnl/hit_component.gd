extends Area2D
class_name HitComponent

@export var tool : DataTypes.Tools = DataTypes.Tools.TOOL_NONE
@export var damage : int = 1

#signal on_hit
#
#func _ready():
	#area_entered.connect(_on_area_entered)
#
#
#func _on_area_entered(area):
	#print("area entered: ", area)
#
