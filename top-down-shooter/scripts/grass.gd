class_name Grass extends Node2D
const PLAYER = preload("uid://bojg0cccsoi18")
const FIGHTER = preload("uid://dq7s3ll0d127f")
const SHOOTER = preload("uid://bjqqay22jonjw")

@export var spawn_interval: float = 6.0 #интервал спавна врагов

var spawn_timer: float =0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_instance=PLAYER.instantiate()
	player_instance.name="Player"
	add_child(player_instance)
	##появление игрока на поле 
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#таймер спавна врагов 
func _process(delta: float) -> void:
	spawn_timer-=delta
	if spawn_timer<=0:
		spawn_enemy()
		spawn_timer=spawn_interval
		
func spawn_enemy()->void:
	var points = $SpawnPoints.get_children()##список marker2d, в которых может появиться враг
	##print(points)
	
	var spawn_point=points.pick_random()#выбирается рандомная точка из списка
	
	var enemy_scene #выбор типа врага также рандомный 
	if randi()%2==0:
		enemy_scene=FIGHTER
	else:
		enemy_scene=SHOOTER
	var enemy_instance=enemy_scene.instantiate()
	$Enemies.add_child(enemy_instance)
	enemy_instance.global_position=spawn_point.global_position
	enemy_instance.player=$Player ##сразу передаем врагу игрока для преследования
	
	
