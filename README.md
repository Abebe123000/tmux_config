# tmux Configuration

tmux の設定ファイルを管理するリポジトリです。

## 特徴

- **快適なプレフィックスキー**: `Ctrl+Space`（デフォルトの `Ctrl+b` より押しやすい）
- **Vimライクなペイン操作**: `hjkl` でペイン移動
- **パフォーマンス最適化**: エスケープ時間短縮、履歴拡大など
- **プラグイン管理**: tpm (Tmux Plugin Manager) 統合
- **マウスサポート**: 有効化済み

詳細な設定内容は [SETTINGS.md](SETTINGS.md) を参照してください。

## インストール

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

インストールスクリプトは以下を自動で行います：
- `~/.config/tmux` ディレクトリを作成
- 既存の設定ファイルをバックアップ（存在する場合）
- このリポジトリの `tmux.conf` へのシンボリックリンクを作成
- tpm (Tmux Plugin Manager) をインストール

### 3. 設定を反映

既存の tmux セッションがある場合：
```bash
tmux source-file ~/.config/tmux/tmux.conf
```

または tmux を再起動してください。

### 4. プラグインをインストール（オプション）

tmux 内で `Ctrl+Space` + `I` を押してプラグインをインストールします。

## クイックリファレンス

### よく使うキーバインド

| キー | 説明 |
|------|------|
| `Ctrl+Space` | プレフィックスキー |
| `prefix + h/j/k/l` | ペイン移動（左/下/上/右） |
| `prefix + \|` | 縦分割（左右に分割） |
| `prefix + -` | 横分割（上下に分割） |
| `prefix + r` | 設定ファイルをリロード |
| `prefix + I` | プラグインをインストール |
| `prefix + U` | プラグインを更新 |

すべてのキーバインドと設定の詳細は [SETTINGS.md](SETTINGS.md) を参照してください。

## カスタマイズ

設定を変更する場合は、このリポジトリの `tmux.conf` を編集してください。
シンボリックリンクのため、変更は自動的に反映されます。

変更後は以下で再読み込み：
```bash
tmux source-file ~/.config/tmux/tmux.conf
```

または tmux 内で `prefix + r` を押してください。

## ファイル構成

- `tmux.conf` - メインの設定ファイル
- `install.sh` - インストールスクリプト
- `SETTINGS.md` - 設定内容の詳細説明
- `README.md` - このファイル

## ライセンス

自由に使用・改変してください。
