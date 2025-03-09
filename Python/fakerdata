# 개발 테스트시 임의의 유저를 생성할때 사용
from faker import Faker

# Faker 클래스의 인스턴스를 생성합니다. 이를 통해 Faker의 기능을 사용할 수 있습니다.
fake = Faker()

# 결과 데이터를 저장할 리스트를 초기화합니다.
fake_data = []

# 10명의 데이터를 생성하기 위해 for 루프를 사용합니다.
for _ in range(10):  # (_)는 반복 변수로 사용할 필요가 없을 때 사용합니다.

    # 각 사람의 정보를 딕셔너리 형태로 생성합니다.
    person = {
        'name': fake.name(),        # 가짜 이름을 생성합니다.
        'address': fake.address(),  # 가짜 주소를 생성합니다.
        'age': fake.random_int(min=18, max=99)  # 18~99 사이의 가짜 나이를 생성합니다.
    }
    # 생성된 가짜 데이터를 리스트에 추가합니다.
    fake_data.append(person)

# 생성된 데이터를 하나씩 출력합니다.
for person in fake_data:
    print(person)  # 각 사람의 정보를 딕셔너리 형태로 출력합니다.

