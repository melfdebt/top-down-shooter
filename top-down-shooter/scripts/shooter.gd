class_name Shooter extends EnemyBase
# враг-стрелок 

const ENEMY_BULLET = preload("uid://brvaohi2em75m")
@export var speed: int =200
@export var shooting_interval: float =1.5

var shooting_timer : float=0.0

func _process(delta: float) -> void:
	if player==null:
		return
	var direction = get_direction_to_player()
	velocity = direction * speed
	move_and_slide()
	shooting_timer-=delta##реализация таймера стрельбы (интервалы)
	if shooting_timer<=0:
		shoot()
		shooting_timer=shooting_interval
	
##создание и направление пули в сторону игрока
func shoot()->void:
	var bullet_instance=ENEMY_BULLET.instantiate()
	add_sibling(bullet_instance)
	var direction := global_position.direction_to(player.global_position)
	bullet_instance.global_position = global_position
	bullet_instance.direction = direction
	##print("bullet direction: ",direction)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()##выполенение родительского _ready()
	
