extends Node

var attack_range = 5
var attack_timer = 0.5  # 공격 딜레이
var attack_delay = 0.0

func _process(delta):
    attack_delay += delta
    if attack_delay >= attack_timer:
        attack_delay = 0.0
        perform_attack()

func perform_attack():
    var enemies = get_tree().get_nodes_in_group("enemies")  # "enemies" 그룹에 있는 적들을 찾음
    for enemy in enemies:
        if position.distance_to(enemy.position) <= attack_range:
            enemy.take_damage(10)  # 적에게 피해를 줌
