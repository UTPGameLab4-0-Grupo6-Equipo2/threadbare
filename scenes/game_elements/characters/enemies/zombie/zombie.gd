extends CharacterBody2D

@export var speed = 150
var player = null
@onready var animation_player = $AnimatedSprite2D
func _ready():
	var player_in_scene = get_tree().get_nodes_in_group("player")
	if player_in_scene:
		player = player_in_scene[0]
	else:
		set_physics_process(false) 

func _physics_process(delta):
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		if velocity.length() >0 :
			animation_player.play("walk")
		else :
			animation_player.play("idle")	
		
	