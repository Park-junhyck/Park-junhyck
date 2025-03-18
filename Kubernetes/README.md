```
my-casual-puzzle-game/
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── hpa.yaml
├── README.md
└── .gitignore
```

# 비동기 캐주얼 퍼즐 게임 배포

이 프로젝트는 비동기 캐주얼 퍼즐 게임의 백엔드 서버를 Kubernetes 클러스터에 배포하는 구성.
아래의 YAML 파일을 사용하여 클러스터에 배포하고, 서비스와 Ingress를 설정

[배포 방법]
1. Kubernetes 클러스터에 배포`
kubectl apply -f k8s/deployment.yaml
`

2. 서비스 설정`
kubectl apply -f k8s/service.yaml
`

3. Ingress 설정`
kubectl apply -f k8s/ingress.yaml
`

4. Horizontal Pod Autoscaler 설정`
kubectl apply -f k8s/hpa.yaml
`


- `deployment.yaml`: 게임 백엔드 서버의 배포를 정의
- `service.yaml`: 클러스터 내에서 외부 트래픽을 처리하는 서비스 설정
- `ingress.yaml`: 외부 도메인에서 게임 서버로의 요청을 라우팅하는 Ingress 설정
- `hpa.yaml`: 오토 스케일링을 설정하여 서버 리소스를 자동으로 조절 가능

클라우드 환경에서 게임 백엔드 서비스를 안정적으로 운영
NCP의 로드 밸런서와 오토 스케일링을 활용하여 트래픽의 변화에 맞춰 서버 리소스를 효율적으로 관리
