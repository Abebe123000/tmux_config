# tmux 設定詳細

このファイルでは、tmux.conf に含まれる設定項目の詳細を説明します。

## 基本設定

### プレフィックスキー
```tmux
set -g prefix C-Space
unbind C-b
```
- デフォルトの `Ctrl+b` から `Ctrl+Space` に変更
- より押しやすく、他のショートカットと干渉しにくい

### マウスサポート
```tmux
set-option -g mouse on
```
- マウスでペインの選択、リサイズ、スクロールが可能

## パフォーマンス設定

### エスケープ時間の短縮
```tmux
set -s escape-time 0
```
- Vimなどのエディタでのモード切り替え遅延を解消
- ESCキーの反応が即座になる

### スクロールバック履歴
```tmux
set -g history-limit 50000
```
- デフォルトの2000行から50000行に拡大
- より多くの履歴を遡れる

## 表示設定

### 256色サポート
```tmux
set -g default-terminal "screen-256color"
```
- カラフルなプロンプトやシンタックスハイライトを正しく表示

### メッセージ表示時間
```tmux
set -g display-time 4000
```
- tmuxのメッセージを4秒間表示（デフォルト: 750ms）
- メッセージをゆっくり読める

### ステータスバー更新頻度
```tmux
set -g status-interval 5
```
- ステータスバーを5秒ごとに更新（デフォルト: 15秒）
- 時刻表示などがより頻繁に更新される

## ウィンドウ・ペイン設定

### マルチモニタ対応
```tmux
setw -g aggressive-resize on
```
- 異なるサイズのクライアントで接続した際の動作を最適化

### フォーカスイベント
```tmux
set -g focus-events on
```
- エディタなどのアプリケーションがフォーカス変更を検知できる

## キーバインド

### ペイン移動（Vimライク）
```tmux
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
```
- `prefix + h/j/k/l` で左/下/上/右のペインに移動

### 設定ファイルのリロード
```tmux
bind r source-file ~/.tmux.conf \; display "Config reloaded!"
```
- `prefix + r` で設定を再読み込み

### ペイン分割
```tmux
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
```
- `prefix + |` で縦分割（左右に分割）
- `prefix + -` で横分割（上下に分割）
- 新しいペインは現在のディレクトリで開く

## プラグイン管理

### Tmux Plugin Manager (tpm)
```tmux
set -g @plugin 'tmux-plugins/tpm'
run '~/.tmux/plugins/tpm/tpm'
```

#### プラグインの管理方法
- `prefix + I` - プラグインをインストール
- `prefix + U` - プラグインを更新
- `prefix + alt + u` - 設定から削除したプラグインをアンインストール

#### プラグインの追加方法
`tmux.conf` に以下の形式で追加：
```tmux
set -g @plugin 'github_username/plugin_name'
```

#### おすすめプラグイン
- `tmux-plugins/tmux-resurrect` - tmuxセッションの保存・復元
- `tmux-plugins/tmux-yank` - クリップボード統合の改善
- `tmux-plugins/tmux-pain-control` - ペイン操作の追加機能
- `tmux-plugins/tmux-continuum` - 自動セッション保存
