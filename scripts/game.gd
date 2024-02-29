extends Node

var piece_scene = preload("res://scenes/piece.tscn")

var curr_selection = null
var curr_team = null
var all_pieces = []

func init_board():
	# Rank 1
	create_piece('w_rook', [1, 1])
	create_piece('w_knight', [2, 1])
	create_piece('w_bishop', [3, 1])
	create_piece('w_queen', [4, 1])
	create_piece('w_king', [5, 1])
	create_piece('w_bishop', [6, 1])
	create_piece('w_knight', [7, 1])
	create_piece('w_rook', [8, 1])
	
	# Rank 2
	create_piece('w_pawn', [1, 2])
	create_piece('w_pawn', [2, 2])
	create_piece('w_pawn', [3, 2])
	create_piece('w_pawn', [4, 2])
	create_piece('w_pawn', [5, 2])
	create_piece('w_pawn', [6, 2])
	create_piece('w_pawn', [7, 2])
	create_piece('w_pawn', [8, 2])
	
	# Rank 7
	create_piece('b_pawn', [1, 7])
	create_piece('b_pawn', [2, 7])
	create_piece('b_pawn', [3, 7])
	create_piece('b_pawn', [4, 7])
	create_piece('b_pawn', [5, 7])
	create_piece('b_pawn', [6, 7])
	create_piece('b_pawn', [7, 7])
	create_piece('b_pawn', [8, 7])
	
	# Rank 8
	create_piece('b_rook', [1, 8])
	create_piece('b_knight', [2, 8])
	create_piece('b_bishop', [3, 8])
	create_piece('b_queen', [4, 8])
	create_piece('b_king', [5, 8])
	create_piece('b_bishop', [6, 8])
	create_piece('b_knight', [7, 8])
	create_piece('b_rook', [8, 8])
	
	
# Create a new piece object
func create_piece(type, loc):
	# Create piece with attributes
	var piece = piece_scene.instantiate()
	piece.set_type(type)
	piece.set_location(loc)
	
	# Add to list of all pieces
	all_pieces.append(piece)
	
	# Set location square's piece to this
	var square = get_square(loc)
	square.set_piece(piece)
	
	# Update sprite
	square.update_sprite()
	
# Obtain square object at specific location
func get_square(loc):
	return get_node('Board/rank' + str(loc[1]) + '/' + str(loc[0]) + '_' + str(loc[1]))
	
func get_piece(loc):
	return get_node('Board/rank' + str(loc[1]) + '/' + str(loc[0]) + '_' + str(loc[1])).piece
	
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
	
func get_valid_moves(piece):
	return
	
func is_valid_move(piece, new_loc):
	var team = piece.type.split('_')[0]
	
	# Cannot move to square occupied by same team
	if get_square(new_loc).piece and get_square(new_loc).piece.get_team() == team:
		print('same team')
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
						print('problem at ' + to_str_loc([old_num_loc[0], i]))
						return false
				return true
			if old_num_loc[1] == new_num_loc[1]:
				for i in range(old_num_loc[0] + 1, new_num_loc[0]):
					if get_square(to_str_loc([i, old_num_loc[1]])).piece:
						print('problem at ' + to_str_loc([i, old_num_loc[1]]))
						return false
				return true
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
	print('converting ' + str(location) + ' to ' + char('a'.unicode_at(0) + location[0] - 1) + str(location[1]))
	return char('a'.unicode_at(0) + location[0] - 1) + str(location[1])
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_board()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
