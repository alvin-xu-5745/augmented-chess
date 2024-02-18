extends Node

# Light color: #e9daba
# Dark color: #c3995a

var piece_scene = preload("res://scenes/piece.tscn")

var curr_selection = null

func init_board():
	# Rank 1
	create_piece('w_rook', 'a1')
	create_piece('w_knight', 'b1')
	create_piece('w_bishop', 'c1')
	create_piece('w_queen', 'd1')
	create_piece('w_king', 'e1')
	create_piece('w_bishop', 'f1')
	create_piece('w_knight', 'g1')
	create_piece('w_rook', 'h1')
	
	# Rank 2
	create_piece('w_pawn', 'a2')
	create_piece('w_pawn', 'b2')
	create_piece('w_pawn', 'c2')
	create_piece('w_pawn', 'd2')
	create_piece('w_pawn', 'e2')
	create_piece('w_pawn', 'f2')
	create_piece('w_pawn', 'g2')
	create_piece('w_pawn', 'h2')
	
	# Rank 7
	create_piece('b_pawn', 'a7')
	create_piece('b_pawn', 'b7')
	create_piece('b_pawn', 'c7')
	create_piece('b_pawn', 'd7')
	create_piece('b_pawn', 'e7')
	create_piece('b_pawn', 'f7')
	create_piece('b_pawn', 'g7')
	create_piece('b_pawn', 'h7')
	
	# Rank 8
	create_piece('b_rook', 'a8')
	create_piece('b_knight', 'b8')
	create_piece('b_bishop', 'c8')
	create_piece('b_queen', 'd8')
	create_piece('b_king', 'e8')
	create_piece('b_bishop', 'f8')
	create_piece('b_knight', 'g8')
	create_piece('b_rook', 'h8')
	
	
# Create a new piece object
func create_piece(type, loc):
	# Create piece with attributes
	var piece = piece_scene.instantiate()
	piece.set_type(type)
	piece.set_location(loc)
	
	# Set location square's piece to this
	get_square(loc).set_piece(piece)
	
# Obtain square object at specific location
func get_square(loc):
	return get_node('Board/rank' + loc[1] + '/' + loc)
	
# Signal handler for square clicked
func _on_square_clicked(loc):
	if not curr_selection:
		if get_square(loc).piece:
			curr_selection = loc
			get_square(loc).color = Color.RED
	elif curr_selection == loc:
		curr_selection = null
		get_square(loc).reset_color()
	else:
		move_piece(curr_selection, loc)
		get_square(curr_selection).reset_color()
		curr_selection = null
	
# Move piece
func move_piece(old, new):
	var old_square = get_square(old)
	var new_square = get_square(new)
	var piece = old_square.piece
	
	new_square.set_piece(piece)
	old_square.clear_piece()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_board()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
