extends Area2D

var speed := 400
var direction := Vector2.ZERO

func _process(delta):
    position += direction * speed * delta

func _on_body_entered(body):
    if body.has_method("take_damage"):
        body.take_damage(10)
    queue_free()
