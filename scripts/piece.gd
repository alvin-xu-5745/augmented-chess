extends Node

var type = null
var loc = null

func set_type(name):
	type = name
	
func set_location(location):
	loc = location
	
func clear():
	type = null
	loc = null
	
func get_team():
	return type.split('_')[0]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
