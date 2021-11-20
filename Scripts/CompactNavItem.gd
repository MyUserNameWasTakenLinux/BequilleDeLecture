extends Panel

export(Texture) var icon_texture
export(Texture) var filled_icon_texture
export(String) var display_scene_path
export var label_text = ""

var active_display_node
var custom_style = StyleBoxFlat.new()

signal add_new_display(display_path)

func _ready():
	custom_style.set_bg_color(Color("#1c2541"))
	custom_style.set_border_width_all(2)
	custom_style.set_border_color(Color("#1c2541"))
	
	$".".set('custom_styles/panel', custom_style)
	_create_animation()
	
	$NavIcon.texture = icon_texture
	$Label.text = label_text

func _create_animation():
	var animation = Animation.new()
	animation.set_length(0.3)
	animation.add_track(Animation.TYPE_VALUE)
	animation.track_set_path(0, ".:custom_styles/panel:border_color")
	animation.track_insert_key(0, 0, Color("#1c2541"))
	animation.track_insert_key(0, 0.1, Color("#f9f9fa"))
	animation.track_insert_key(0, 0.3, Color("#1c2541"))
	
	$AnimationPlayer.add_animation("Click", animation)


func _on_CompactNavItem_mouse_entered():
	custom_style.set_bg_color(Color("#263257"))


func _on_CompactNavItem_mouse_exited():
	custom_style.set_bg_color(Color("#1c2541"))


func _on_CompactNavItem_gui_input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and event.get_button_index() == 1:
			$AnimationPlayer.play("Click")
			emit_signal("add_new_display", display_scene_path)

