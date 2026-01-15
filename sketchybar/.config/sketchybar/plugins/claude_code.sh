#!/bin/bash

# Claude Codeセッションの状態を表示するSketchybarプラグイン

PIDS=$(ps aux 2>/dev/null | grep '[c]laude$' | awk '{print $2}')

if [[ -z "$PIDS" ]]; then
  # セッションなし
  sketchybar --set "$NAME" icon="󰚩" label="" icon.color="0xff6e738d" icon.padding_right="-2"
  exit 0
fi

SESSION_COUNT=$(echo "$PIDS" | wc -l | tr -d ' ')
LABEL=""
ICON_COLOR="0xfff5a97f"  # オレンジ（デフォルト：待機中）

# 最新セッションの状態を確認
CLAUDE_DIR="$HOME/.claude"
LATEST_SESSION=$(ls -t "$CLAUDE_DIR/debug/" 2>/dev/null | grep -v latest | head -1 | sed 's/.txt$//')

if [[ -n "$LATEST_SESSION" ]]; then
  # ユーザー入力待ちチェック（デバッグログから）
  if tail -50 "$CLAUDE_DIR/debug/latest" 2>/dev/null | grep -qE "AskUser|askQuestion|permission"; then
    ICON_COLOR="0xffeed49f"  # 黄色
    LABEL="Waiting You..."
  else
    # 処理中タスクを取得
    ACTIVE_TASK=$(cat "$CLAUDE_DIR/todos/${LATEST_SESSION}"-agent-*.json 2>/dev/null | \
      jq -r '.[] | select(.status=="in_progress") | .activeForm' 2>/dev/null | \
      head -1)

    if [[ -n "$ACTIVE_TASK" ]]; then
      ICON_COLOR="0xffa6da95"  # 緑
      # タスク名を短縮（最大40文字）
      if [[ ${#ACTIVE_TASK} -gt 40 ]]; then
        ACTIVE_TASK="${ACTIVE_TASK:0:17}..."
      fi
      LABEL="$ACTIVE_TASK"
    fi
  fi
fi

# 複数セッションの場合はセッション数も表示
if [[ $SESSION_COUNT -gt 1 ]]; then
  LABEL="[$SESSION_COUNT] $LABEL"
fi

sketchybar --set "$NAME" icon="󰚩" label="$LABEL" icon.color="$ICON_COLOR" icon.padding_right=7
