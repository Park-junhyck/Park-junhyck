extends CanvasLayer

# 플레이어 관련 변수 (플레이어 상태가 업데이트되면 UI도 갱신)
var player_health = 100
var player_max_health = 100
var player_level = 1
var player_experience = 0
var experience_to_level_up = 100

# UI 노드들
onready var health_label = $Control/HealthLabel
onready var level_label = $Control/LevelLabel
onready var health_bar = $Control/HealthBar
onready var experience_bar = $Control/ExperienceBar
onready var experience_label = $Control/ExperienceLabel

# 매 프레임마다 UI를 업데이트
func _process(delta):
    update_health_ui()
    update_experience_ui()
    update_level_ui()

# 체력 UI 업데이트
func update_health_ui():
    health_label.text = "Health: " + str(player_health) + "/" + str(player_max_health)
    health_bar.value = player_health / player_max_health * 100  # 체력바 업데이트

# 경험치 UI 업데이트
func update_experience_ui():
    experience_label.text = "EXP: " + str(player_experience) + "/" + str(experience_to_level_up)
    experience_bar.value = player_experience / experience_to_level_up * 100  # 경험치바 업데이트

# 레벨 UI 업데이트
func update_level_ui():
    level_label.text = "Level: " + str(player_level)

# 체력 증가 함수
func increase_health(amount):
    player_health = min(player_health + amount, player_max_health)  # 최대 체력 이상으로는 증가하지 않음

# 경험치 증가 함수
func increase_experience(amount):
    player_experience += amount
    if player_experience >= experience_to_level_up:
        level_up()

# 레벨업 처리
func level_up():
    player_level += 1
    player_experience = 0
    experience_to_level_up *= 1.5  # 레벨업에 따라 경험치 요구량 증가
