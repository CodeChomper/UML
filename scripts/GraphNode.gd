extends GraphNode

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var inspectorPanel = get_parent().get_node("GUI/InspectorPanel")

func _ready():
	set_slot(0,true,3,Color(0,255,0),true,3,Color(0,255,0))
	print(str(self.get_connection_output_count()))
	connect("raise_request",self,"_on_GraphNode_raise_request")
	pass
	
func _on_GraphNode_raise_request():
	inspectorPanel._on_node_selected(self);
	