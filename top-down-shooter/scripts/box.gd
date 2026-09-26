class_name Box extends StaticBody2D
## коробка, безвредный объект, разрушаемый
@export var health: int =30
var current_health: int

#получение урона от пуль или врагов
func take_damage(damage: int)->void:
	current_health-=damage
	if current_health<=0:
		destroy()

#разрушение коробки	
func destroy()->void:
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health=health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
