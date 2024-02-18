extends Node

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
		if move_piece(curr_selection, loc):
			get_square(curr_selection).reset_color()
			curr_selection = null
	
# Move piece
func move_piece(old, new):
	var old_square = get_square(old)
	var new_square = get_square(new)
	var piece = old_square.piece
	
	if is_valid_move(piece, new):
		piece.set_location(new)
		new_square.set_piece(piece)
		old_square.clear_piece()
		return true
	return false
	
func is_valid_move(piece, new_loc):
	var team = piece.type.split('_')[0]
	
	# Cannot move to square occupied by same team
	if get_square(new_loc).piece and get_square(new_loc).piece.get_team() == team:
		return false
	
	var old_num_loc = to_num_loc(piece.loc)
	var new_num_loc = to_num_loc(new_loc)
	
	match piece.type.split('_')[1]:
		'pawn':
			return true
		'rook':
			if old_num_loc[0] == new_num_loc[0]:
				for i in range(old_num_loc[1] + 1, new_num_loc[1]):
					if get_square(to_str_loc([old_num_loc[0], i])).piece:
						return false
				return true
			if old_num_loc[1] == new_num_loc[1]:
				for i in range(old_num_loc[0] + 1, new_num_loc[0]):
					if get_square(to_str_loc([old_num_loc[1], i])).piece:
						return false
			return false
		'knight':
			return (abs(old_num_loc[0] - new_num_loc[0]) == 2 and abs(old_num_loc[1] - new_num_loc[1]) == 1) or (abs(old_num_loc[0] - new_num_loc[0]) == 1 and abs(old_num_loc[1] - new_num_loc[1]) == 2)
		'bishop':
			return abs(old_num_loc[0] - new_num_loc[0]) == abs(old_num_loc[1] - new_num_loc[1])
		'queen':
			return old_num_loc[0] == new_num_loc[0] or old_num_loc[1] == new_num_loc[1] or abs(old_num_loc[0] - new_num_loc[0]) == abs(old_num_loc[1] - new_num_loc[1])
		'king':
			return abs(old_num_loc[0] - new_num_loc[0]) <= 1 and abs(old_num_loc[1] - new_num_loc[1]) <= 1
	return false
		
func to_num_loc(location):
	return [location[0].unicode_at(0) - 'a'.unicode_at(0) + 1, int(location[1])]
	
func to_str_loc(location):
	return char('a'.unicode_at(0) + location[0] - 1) + str(location[1])
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_board()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
