extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var classNameTextEdit = get_node("ClassNameTextEdit")
onready var graphEdit = get_tree().get_root().get_node("GraphEdit")

var memberList = []
var memberTextEditList = []

var curNode

func _ready():
	pass

func _on_node_selected(node):
	curNode = node;
	classNameTextEdit.set_text(curNode.get_title())
	
	#Clear member lists
	for memTextEdit in memberTextEditList:
		remove_child(memTextEdit)
	
	var pos = Vector2(5,150);
	for child in node.get_children():
		print(child.get_text())
		memberList.append(child)
		var tb = TextEdit.new()
		tb.set_size(Vector2(220,25))
		tb.set_pos(pos)
		tb.connect("text_changed",self,"_on_MemberTextEdit_text_changed")
		memberTextEditList.append(tb)
		pos.y += 25
		self.add_child(tb)
	
	var index = 0
	for i in memberList:
		memberTextEditList[index].set_text(i.get_text())
		index += 1
	

func _on_MemberTextEdit_text_changed():
	var index = 0
	for m in memberList:
		m.set_text(memberTextEditList[index].get_text())
		index += 1

func _on_ClassNameTextEdit_text_changed():
	curNode.set_title(classNameTextEdit.get_text())
	pass # replace with function body

func _on_NewClassButton_pressed():
	graphEdit._on_create_graph_node()

func _on_MemberAddButton_pressed():
	var member = Label.new()
	member.set_align(HALIGN_CENTER)
	curNode.add_child(member)
	_on_node_selected(curNode)
	memberTextEditList.back().grab_focus()