extends Sprite2D

var speed = 400

func _process(delta):
    position.x += speed * delta
    if position.x > 1200:
        queue_free()