class_name Enemy_bullet extends Area2D
##вражеская пуля наносит урон игроку и коробке
@export var speed: int =1500
@export var damage: int=20
var direction: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	##print(direction)
	global_position += speed*direction*delta## движение по направлению 


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)##нанесение урона игроку или коробке
	queue_free()
	##print("deleted")

##удаление при выходе за рамки игрового поля 
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	##print("exited, deleted")
