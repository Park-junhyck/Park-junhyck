extends Node

var enemy_scene : PackedScene
var spawn_timer = 5
var spawn_time = 0

func _ready():
    enemy_scene = preload("res://Enemy.tscn")  # 적 씬을 미리 로드

func _process(delta):
    spawn_time += delta
    if spawn_time >= spawn_timer:
        spawn_enemy()
        spawn_time = 0

func spawn_enemy():
    var enemy = enemy_scene.instance()
    enemy.position = Vector3(randf_range(-10, 10), 0, randf_range(-10, 10))  # 랜덤 위치
    add_child(enemy)
