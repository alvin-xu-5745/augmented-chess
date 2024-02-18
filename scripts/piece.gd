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
	
func is_valid_move(new_loc):
	match type:
		'b_pawn':
			return
		'b_rook':
			return
		'b_knight':
			return
		'b_bishop':
			return
		'b_queen':
			return
		'b_king':
			return
		'w_pawn':
			return
		'w_rook':
			return
		'w_knight':
			return
		'w_bishop':
			return
		'w_queen':
			return
		'w_king':
			return
		

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
