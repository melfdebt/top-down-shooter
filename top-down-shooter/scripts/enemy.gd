class_name EnemyBase extends CharacterBody2D
##абстрактный класс врага

@export var max_health: int = 200
@export var contact_damage: int =10

var current_health: int
var player: CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_health=max_health
	##player= get_node("../Player")

##получение урона
func take_damage(damage: int )-> void:
	current_health-=damage
	if current_health<=0:
		die()
	##print("dammaged")
		
##смерть 
func die()->void:
	queue_free()
 
##получение направления к игроку
func get_direction_to_player()->Vector2:
	if player==null:
		return Vector2.ZERO
	return global_position.direction_to(player.global_position)


##нанесение урона при столкновении с другими сущностями
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage") and body is Player:
		body.take_damage(contact_damage)
		

	
	
