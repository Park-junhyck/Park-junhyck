extends Node2D

var level = 1
var experience = 0
var experience_to_level_up = 100

func increase_experience(amount):
    experience += amount
    if experience >= experience_to_level_up:
        level_up()

func level_up():
    level += 1
    experience = 0
    experience_to_level_up *= 2
    upgrade_player()  # 업그레이드 처리

func upgrade_player():
    # 능력치 증가
    pass
