extends GraphEdit

signal window_resized
onready var lastWindowSize = OS.get_window_size()
onready var graphNode = preload("res://scenes/GraphNode.tscn")

func _ready():
	connect("connection_request",self,"_on_GraphEdit_connection_request")
	connect("disconnection_request",self,"_on_GraphEdit_disconnection_request")
	connect("window_resized",self,"_on_window_resized")
	self.set_right_disconnects(true)
	set_process(true)
	pass

func _process(delta):
	var windowSize = OS.get_window_size()
	if lastWindowSize != windowSize:
		lastWindowSize = windowSize
		emit_signal("window_resized")

func _on_window_resized():
	set_size(lastWindowSize)

func _on_GraphEdit_resized():
	print("Resized")

func _on_GraphEdit_connection_request( from, from_slot, to, to_slot ):
	print("From: " + from + " " + str(from_slot) + " To: " + to + " " + str(to_slot))
	self.connect_node(from,from_slot,to,to_slot)
	pass # replace with function body


func _on_GraphEdit_disconnection_request( from, from_slot, to, to_slot ):
	self.disconnect_node(from,from_slot,to,to_slot)
	pass # replace with function body

func _on_create_graph_node(pos):
	var newNode = graphNode.instance()
	newNode.set_offset(pos)
	print(pos)
	add_child(newNode)