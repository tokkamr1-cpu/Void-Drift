extends Node

var star_systems = []
var factions = ["Imperiya", "Quldur Floti", "Savdogarlar"]

func _ready():
    _generate_galaxy()

func _generate_galaxy():
    for i in range(10):
        var system = {
            "name": "Tizim_" + str(i),
            "faction": factions[randi() % factions.size()],
            "danger": randf_range(0.2, 1.0)
        }
        star_systems.append(system)
