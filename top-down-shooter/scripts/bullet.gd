class_name Bullet extends Area2D
## пуля игрока, наносит урон врагам и коробке
@export var speed : int = 2000
@export var damage : int = 25 ##приносимый ею урон 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed*Vector2.UP.rotated(rotation + PI/2)*delta##определение направления, в котором она летит
	
	


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)##наносит урон (коробке, врагу)
	queue_free()
	##print("deleted")

##удаление когда выходит за пределы поля или попадает в коробку/шипы
func _on_area_entered(area: Area2D) -> void:
	queue_free()
	##print("collided")
