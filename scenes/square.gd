extends ColorRect

const sprites = {
	"b_bishop": preload("res://sprites/pieces/bb.png"),
	"b_king": preload("res://sprites/pieces/bk.png"),
	"b_knight": preload("res://sprites/pieces/bn.png"),
	"b_pawn": preload("res://sprites/pieces/bp.png"),
	"b_queen": preload("res://sprites/pieces/bq.png"),
	"b_rook": preload("res://sprites/pieces/br.png"),
	"w_bishop": preload("res://sprites/pieces/wb.png"),
	"w_king": preload("res://sprites/pieces/wk.png"),
	"w_knight": preload("res://sprites/pieces/wn.png"),
	"w_pawn": preload("res://sprites/pieces/wp.png"),
	"w_queen": preload("res://sprites/pieces/wq.png"),
	"w_rook": preload("res://sprites/pieces/wr.png")
}

# Light color: #e9daba
# Dark color: #c3995a

signal clicked(loc)

var piece = null

func set_piece(new_piece):
	piece = new_piece
	
func clear_piece():
	piece = null
	$Sprite.texture = null
	
func update_sprite():
	$Sprite.texture = sprites[piece.type]
	
# Set color to default light or dark
func reset_color():
	if (int(String(name).split('_')[0]) + int(String(name).split('_')[1])) % 2 == 0:
		color = Color('c3995a')
	else:
		color = Color('e9daba')

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_color()
	clicked.connect(get_tree().get_root().get_node('Game')._on_square_clicked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	clicked.emit(String(name))
