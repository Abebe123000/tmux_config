# tmux Configuration

tmuxの設定ファイルを管理するリポジトリです。

## 設定内容

- **プレフィックスキー**: `Ctrl+Space`（デフォルトの`Ctrl+b`から変更）
- **マウスモード**: 有効
- **Vimキーバインド風のペイン移動**: `prefix + hjkl`で上下左右に移動

## セットアップ

### 1. リポジトリをクローン

```bash
git clone <repository-url> ~/tmux_config
cd ~/tmux_config
```

### 2. インストールスクリプトを実行

```bash
chmod +x install.sh
./install.sh
```

インストールスクリプトは以下を実行します：
- `~/.config/tmux`ディレクトリを作成（存在しない場合）
- 既存の`~/.config/tmux/tmux.conf`がある場合は日付付きでバックアップ（例: `tmux.conf.backup.20250101-123456789`）
- このリポジトリの`tmux.conf`へのシンボリックリンクを`~/.config/tmux/tmux.conf`として作成

### 3. 設定を反映

既存のtmuxセッションがある場合：
```bash
tmux source-file ~/.config/tmux/tmux.conf
```

または、tmuxを再起動してください。

## キーバインド

### ペイン移動（Vimライク）
- `prefix + h` - 左のペインへ移動
- `prefix + j` - 下のペインへ移動
- `prefix + k` - 上のペインへ移動
- `prefix + l` - 右のペインへ移動

## カスタマイズ

設定を変更する場合は、このリポジトリの`tmux.conf`を編集してください。
変更は自動的に`~/.config/tmux/tmux.conf`に反映されます（シンボリックリンクのため）。

変更後は以下で再読み込み：
```bash
tmux source-file ~/.config/tmux/tmux.conf
```
