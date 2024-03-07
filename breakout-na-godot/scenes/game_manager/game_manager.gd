extends Node2D


# Controle dos Blocos
@export_group("Controle dos Blocos")
@export var blocos : Node2D
var blocos_na_fase : int = 0

# Passar de Fase
@export_group("Passar de Fase")
@export var proxima_fase : String
@onready var timer_do_passar_de_fase : Timer = $TimerDoPassarDeFase


func _ready():
	buscar_blocos()


func _process(delta):
	receber_inputs()
	

func receber_inputs() -> void:
	# Reinicia a fase
	if Input.is_action_just_pressed("reiniciar"):
		get_tree().reload_current_scene()
	
	# Sai do jogo
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()


func buscar_blocos() -> void:
	# Conta quantos Blocos há na fase
	for bloco in blocos.get_children():
		blocos_na_fase += 1


func atualizar_contagem_dos_blocos() -> void:
	# Remove um Bloco da contagem e, SE não tiver mais nenhum, inicia o passar de fase
	blocos_na_fase -= 1
	if blocos_na_fase <= 0:
		timer_do_passar_de_fase.start()


func _on_timer_do_passar_de_fase_timeout():
	# Carrega a próxima fase
	get_tree().change_scene_to_file(proxima_fase)
