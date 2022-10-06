extends Node2D

onready var tween := $Tween
onready var Player := $Player
onready var PlayerMiddlePosition := $PlayerMiddlePosition
onready var EventMiddlePosition := $EventMiddlePosition
onready var event := $Event
var TransitionTime := 1

func _ready():
	yield(get_tree().create_timer(5),"timeout")
	Player.get_node("PlayerSprites").play("Run")
	Player.position.x = -12.5
	tween.interpolate_property(Player,"position",null,Vector2(50,138),TransitionTime)
	tween.start()

func _move_player_in():
	TransitionTime = 6
	Player.get_node("PlayerSprites").play("Run")
	tween.interpolate_property(Player,"position",null,PlayerMiddlePosition.position,TransitionTime)
	tween.start()

func _move_player_out():
	TransitionTime = 6
	tween.interpolate_property(Player,"position",null,Vector2(-25,138),TransitionTime)
	tween.start()

func _move_event_in():
	TransitionTime = 6
	Player.get_node("PlayerSprites").play("Run")
	tween.interpolate_property(event,"position",null,EventMiddlePosition.position,TransitionTime)
	tween.start()

func _move_event_out():
	TransitionTime = 6
	tween.interpolate_property(event,"position",null,Vector2(-25,138),TransitionTime)
	tween.start()


func _on_Tween_tween_completed(object, key):
	if object == Player and key == ":position":
		print("Idle")
		Player.get_node("PlayerSprites").play("IdleNoLook")
