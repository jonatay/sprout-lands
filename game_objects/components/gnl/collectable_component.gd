extends Area2D
class_name CollectableComponent


@export var collectable_name : String

func _ready():
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	print("collectable area entered: ", area)
	if area is CollectorComponent:
		print("Collected by: ", area.get_parent().name)
		get_parent().queue_free()
