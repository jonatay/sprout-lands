extends Area2D
class_name CollectorComponent

@export var label_diag : Label
@export var collector_name : String

func _ready():
	area_entered.connect(_on_area_entered)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("char_collect"):
		for child in get_children():
			if child is CollisionShape2D:
				child.disabled = false
				if label_diag is Label:
					label_diag.text = ">%s<" % label_diag.text
	if event.is_action_released("char_collect"):
		for child in get_children():
			if child is CollisionShape2D:
				child.disabled = true
				if label_diag is Label:
					label_diag.text = label_diag.text.substr(1, label_diag.text.length()-2)


func _on_area_entered(area):
	print("collector area entered: ", area)
	if area is CollectableComponent:
		print("I got a : ", area.collectable_name)
