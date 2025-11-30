extends Node2D

@export var speed := 150
@export var max_health := 40
var health := max_health
var player := null

func _ready():
    player = get_tree().get_root().find_child("PlayerShip", true, false)

func _process(delta):
    if player:
        var dir = (player.position - position).normalized()
        position += dir * speed * delta

func take_damage(amount):
    health -= amount
    if health <= 0:
        queue_free()
