extends Sprite2D

var speed = 200
var weapon_cooldown = 0.0
var weapon_max_cooldown = 0.5

func _process(delta):
    # Harakat (WASD)
    var input_dir = Vector2.ZERO
    if Input.is_action_pressed("ui_up"):
        input_dir.y -= 1
    if Input.is_action_pressed("ui_down"):
        input_dir.y += 1
    if Input.is_action_pressed("ui_left"):
        input_dir.x -= 1
    if Input.is_action_pressed("ui_right"):
        input_dir.x += 1
    input_dir = input_dir.normalized()
    position += input_dir * speed * delta

    # O'q otish
    if Input.is_action_just_pressed("ui_accept"):
        shoot()

func shoot():
    var bullet = preload("res://scenes/Bullet.tscn").instantiate()
    bullet.position = position + Vector2(32, 0)
    get_parent().add_child(bullet)