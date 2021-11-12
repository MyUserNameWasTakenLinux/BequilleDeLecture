extends Panel

export(NodePath) var SidebarPath

var sidebar: ColorRect

func _ready():
	sidebar = get_node(SidebarPath)


func _on_ToggleButton_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.get_button_index() == 1:
			$AnimationPlayer.play("Click")
			
			if sidebar.rect_min_size.x == 72:
				sidebar.rect_min_size.x = 200
			else:
				sidebar.rect_min_size.x = 72
