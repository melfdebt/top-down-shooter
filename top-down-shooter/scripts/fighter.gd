class_name Fighter extends EnemyBase
##быстрый враг, атакующий при столкновении

@export var speed: int = 400
##движение в сторону игрока 
func _process(delta: float) -> void:
	if player==null:
		return
	##print(player)
	var direction = get_direction_to_player()
	##print(direction)
	velocity = direction * speed
	move_and_slide()

		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()## вызов _ready() родительского класса (enemybase)


# Called every frame. 'delta' is the elapsed time since the previous frame.
