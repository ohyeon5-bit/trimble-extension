#!/bin/bash
set -euo pipefail

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"

# 필수 파일 존재 확인
required_files=("index.html" "manifest.json" "icon.svg")
for file in "${required_files[@]}"; do
  if [ ! -f "$PROJECT_DIR/$file" ]; then
    echo "경고: 필수 파일을 찾을 수 없습니다: $file" >&2
  fi
done

echo "세션 시작: Trimble Connect 확장 프로젝트 준비 완료."
echo "정적 HTML/JS 프로젝트 — 별도 패키지 설치 없음."
