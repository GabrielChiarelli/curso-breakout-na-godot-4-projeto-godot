extends StaticBody2D


# Parâmetros
@export var vida_do_bloco : int

# Cores
@export var vermelho : Color
@export var verde : Color
@export var azul : Color


func _ready():
	atualizar_cor()


func atualizar_cor() -> void:
	# Muda a cor do Bloco dependendo da sua quantidade de vida
	if vida_do_bloco == 3:
		modulate = verde
	elif vida_do_bloco == 2:
		modulate = azul
	elif vida_do_bloco == 1:
		modulate = vermelho
	else:
		modulate = Color.WHITE
		

func receber_dano() -> void:
	# Desconta vida e, se ainda tiver, muda de cor, se não, some
	vida_do_bloco -= 1
	
	if vida_do_bloco >= 1:
		atualizar_cor()
	else:
		queue_free()
