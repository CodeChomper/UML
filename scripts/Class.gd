extends Panel

onready var nameLabel = get_node("NameLabel")
onready var size = get_size()
onready var pos = get_global_pos()
onready var locPos = get_pos()

var mouseOver = false

func _ready():
	set_process(true)
	pass


func _process(delta):
	pos = get_global_pos()
	locPos = get_pos()
	#Move to mouse position when clicked
	if Input.is_mouse_button_pressed(1) and mouseOver:
		var mousePos = get_global_mouse_pos()
		set_global_pos(mousePos)
	update()

func _draw():
	for c in get_children():
		if c.is_in_group("Panel"):
			draw_line(size/2,c.locPos + (size / 2),Color(255,0,0),3.0)

func _on_ClassPanel_mouse_enter():
	mouseOver = true
	pass # replace with function body


func _on_ClassPanel_mouse_exit():
	mouseOver = false
	pass # replace with function body
