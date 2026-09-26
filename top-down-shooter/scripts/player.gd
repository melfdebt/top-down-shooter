class_name Player extends CharacterBody2D

const BULLET = preload("uid://rgxnmn2law5x")
@export var speed: int = 500
@export var max_health : int=500
@export var cooldownInSecs: float = 0.3
var current_health: int 
@onready var shoot_cooldown_timer : Timer = $Timer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health=max_health
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_player()
	look_at(get_global_mouse_position())
	
##движение игрока по клавишам wasd
func move_player()->void:
	var movement_direction := Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
        "move_down"
	)
	velocity = movement_direction * speed
	move_and_slide()	
	
	
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_pressed() and event.keycode == KEY_ESCAPE:##выход из игры
			get_tree().quit()
		if event.is_pressed() and event.is_action("shoot"):##действие стрельба 
			if shoot_cooldown_timer.is_stopped():
				var bullet_instance = BULLET.instantiate()
				add_sibling(bullet_instance)
				bullet_instance.position = position
				bullet_instance.rotation = rotation
				shoot_cooldown_timer.start(cooldownInSecs)
				
				
				
##получение урона
func take_damage(damage : int )->void:
	current_health-=damage
	##print("hp was changed, new value: ",current_health)
	if current_health<=0:
		die()
		
		
##смерть
func die()-> void:
	queue_free()
	##get_tree().quit()
