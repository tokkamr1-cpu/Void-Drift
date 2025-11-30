extends Node2D

var player := null

func interact():
    $Panel.visible = true

func upgrade_ship():
    player.max_health += 20
    player.speed += 10

func buy_weapon():
    player.fire_rate = max(player.fire_rate - 0.05, 0.1)
