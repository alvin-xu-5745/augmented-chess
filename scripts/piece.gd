extends Node

const sprites = {
	"bb": preload("res://sprites/pieces/bb.png"),
	"bk": preload("res://sprites/pieces/bk.png"),
	"bn": preload("res://sprites/pieces/bn.png"),
	"bp": preload("res://sprites/pieces/bp.png"),
	"bq": preload("res://sprites/pieces/bq.png"),
	"br": preload("res://sprites/pieces/br.png"),
	"wb": preload("res://sprites/pieces/wb.png"),
	"wk": preload("res://sprites/pieces/wk.png"),
	"wn": preload("res://sprites/pieces/wn.png"),
	"wp": preload("res://sprites/pieces/wp.png"),
	"wq": preload("res://sprites/pieces/wq.png"),
	"wr": preload("res://sprites/pieces/wr.png")
}

var type
var loc

func set_type(name):
	type = name
	$Sprite.texture = sprites[name]
	
func clear_type():
	type = ""
	$Sprite.texture = null

func set_location(location):
	loc = location

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
