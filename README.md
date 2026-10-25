# 나는 편의점 점장이다

편의점 점장이 되어 진열, 계산, 전자레인지, 청소, 도둑 검거까지 직접 몸으로 뛰는 액션 경영 게임입니다. 현재 버전은 **프로토타입 v0.1**입니다.

## 바로 플레이

**https://comco88-gif.github.io/convenience-store-manager/**

설치나 로그인 없이 PC·휴대폰 브라우저에서 바로 열립니다. `main` 브랜치에 push하면 1~2분 뒤 자동으로 반영됩니다. 저장소를 받은 뒤 `index.html`을 브라우저로 직접 열어도 됩니다.

## 조작

| 동작 | 키보드 | 터치 |
| --- | --- | --- |
| 이동 | WASD / 방향키 | 화면 아래 방향 패드 |
| 행동 (꾹 누르면 진열·걸레질) | E / Space | 행동 버튼 |
| 달리기 (체력 소모) | Shift | 달리기 버튼 |
| 계산 멈추기 | Q / Esc | - |
| 일시정지 | P | - |

## 다른 PC에서 개발 이어가기

```bash
git clone https://github.com/comco88-gif/convenience-store-manager.git
cd convenience-store-manager
```

로컬 서버로 실행 (Node나 Python 없이 Windows PowerShell만 있으면 됩니다):

```bash
powershell -ExecutionPolicy Bypass -File tools/serve.ps1
```

그다음 브라우저에서 http://localhost:8765 를 엽니다. Claude Code 데스크톱 앱에서는 `.claude/launch.json`의 `game` 설정으로 미리보기를 바로 띄울 수 있습니다.

작업을 마치면 `git add -A`, `git commit`, `git push`로 올리고, 다른 PC에서는 `git pull`로 받아옵니다.

## 구조

```
index.html          게임 전체 (HTML + CSS + JS 한 파일)
tools/serve.ps1     로컬 개발 서버
.claude/launch.json Claude Code 미리보기 설정
CLAUDE.md           기획 메모와 다음 작업 목록
```
