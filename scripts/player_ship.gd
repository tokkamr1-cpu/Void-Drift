extends Node2D

@export var speed := 200
@export var max_health := 100
var health := max_health

@export var fire_rate := 0.3
var fire_cooldown := 0.0

func _process(delta):
    _handle_movement(delta)
    _handle_shooting(delta)

func _handle_movement(delta):
    var dir = Vector2.ZERO
    if Input.is_action_pressed("ui_right"): dir.x += 1
    if Input.is_action_pressed("ui_left"): dir.x -= 1
    if Input.is_action_pressed("ui_up"): dir.y -= 1
    if Input.is_action_pressed("ui_down"): dir.y += 1

    position += dir.normalized() * speed * delta

func _handle_shooting(delta):
    fire_cooldown -= delta
    if Input.is_action_pressed("shoot") and fire_cooldown <= 0:
        var b = preload("res://scenes/Projectile.tscn").instantiate()
        b.position = position
        b.direction = Vector2(1, 0)
        get_parent().add_child(b)
        fire_cooldown = fire_rate

func take_damage(amount):
    health -= amount
    if health <= 0:
        queue_free()
