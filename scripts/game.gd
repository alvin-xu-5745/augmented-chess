extends Node

var piece_scene = preload("res://scenes/piece.tscn")

func init_board():
	# Rank 1
	$Board/rank1/a1/Piece.set_type('wr')
	$Board/rank1/b1/Piece.set_type('wn')
	$Board/rank1/c1/Piece.set_type('wb')
	$Board/rank1/d1/Piece.set_type('wq')
	$Board/rank1/e1/Piece.set_type('wk')
	$Board/rank1/f1/Piece.set_type('wb')
	$Board/rank1/g1/Piece.set_type('wn')
	$Board/rank1/h1/Piece.set_type('wr')
	
	# Rank 2
	$Board/rank2/a2/Piece.set_type('wp')
	$Board/rank2/b2/Piece.set_type('wp')
	$Board/rank2/c2/Piece.set_type('wp')
	$Board/rank2/d2/Piece.set_type('wp')
	$Board/rank2/e2/Piece.set_type('wp')
	$Board/rank2/f2/Piece.set_type('wp')
	$Board/rank2/g2/Piece.set_type('wp')
	$Board/rank2/h2/Piece.set_type('wp')
	
	# Rank 7
	$Board/rank7/a7/Piece.set_type('bp')
	$Board/rank7/b7/Piece.set_type('bp')
	$Board/rank7/c7/Piece.set_type('bp')
	$Board/rank7/d7/Piece.set_type('bp')
	$Board/rank7/e7/Piece.set_type('bp')
	$Board/rank7/f7/Piece.set_type('bp')
	$Board/rank7/g7/Piece.set_type('bp')
	$Board/rank7/h7/Piece.set_type('bp')
	
	# Rank 8
	$Board/rank8/a8/Piece.set_type('br')
	$Board/rank8/b8/Piece.set_type('bn')
	$Board/rank8/c8/Piece.set_type('bb')
	$Board/rank8/d8/Piece.set_type('bq')
	$Board/rank8/e8/Piece.set_type('bk')
	$Board/rank8/f8/Piece.set_type('bb')
	$Board/rank8/g8/Piece.set_type('bn')
	$Board/rank8/h8/Piece.set_type('br')
	
	
func create_piece(type, loc):
	var piece = piece_scene.instantiate()
	piece.set_type(type)
	piece.set_location(loc)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	init_board()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
