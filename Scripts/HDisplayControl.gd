extends HBoxContainer

var active_display_scene_path
var display_scene
var display_scene_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	active_display_scene_path = "res://Scenes/EnterTextScene.tscn"
	display_scene = load(active_display_scene_path)
	display_scene_instance = display_scene.instance()
	add_child(display_scene_instance)
	

func _on_TextIcon_add_new_display(display_path):
	if active_display_scene_path != display_path:
		active_display_scene_path = display_path
		display_scene_instance.queue_free()
		display_scene = load(display_path)
		display_scene_instance = display_scene.instance()
		add_child(display_scene_instance)


func _on_CardsIcon_add_new_display(display_path):
	if active_display_scene_path != display_path:
		active_display_scene_path = display_path
		display_scene_instance.queue_free()
		display_scene = load(display_path)
		display_scene_instance = display_scene.instance()
		add_child(display_scene_instance)
