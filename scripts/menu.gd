extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var graphEdit = get_tree().get_root().get_node("GraphEdit")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_NewClassButton_pressed():
	graphEdit._on_create_graph_node()
	pass # replace with function body
