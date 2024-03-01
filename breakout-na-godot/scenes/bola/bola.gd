extends Area2D


# Movimento da Bola
var velocidade_da_bola : float = 400.0
var posicao_inicial : Vector2 = Vector2(400, 500)
var direcao_inicial : Vector2 = Vector2(0, 0)
var nova_direcao : Vector2 = Vector2(0, 0)

# Verificações
var primeiro_lancamento : bool = true


func _ready():
	resetar_bola()


func _process(delta):
	# Se for o primeiro lançamento, esperar a ação do Jogador para lançar
	if primeiro_lancamento:
		if Input.is_action_just_pressed("lancar-bola"):
			escolher_direcao_inicial()
			primeiro_lancamento = false
			
	movimentar_bola(delta)
	
	
func resetar_bola() -> void:
	# Posiciona a Bola acima do Paddle
	position = posicao_inicial
	

func escolher_direcao_inicial() -> void:
	# Escolhe uma nova direção Horizontal
	var x_aleatorio = [-1, 1].pick_random()
	
	# Aplica a nova direção
	direcao_inicial = Vector2(x_aleatorio, -1)
	nova_direcao = direcao_inicial
	

func movimentar_bola(delta : float) -> void:
	# Movimenta a Bola com base em sua nova direção
	position += nova_direcao * velocidade_da_bola * delta
