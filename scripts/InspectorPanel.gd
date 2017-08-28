extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var classNameTextEdit = get_node("ClassNameTextEdit")


var curNode;

func _ready():
	pass

func _on_node_selected(node):
	curNode = node;
	classNameTextEdit.set_text(curNode.get_title())

func _on_ClassNameTextEdit_text_changed():
	curNode.set_title(classNameTextEdit.get_text())
	pass # replace with function body
