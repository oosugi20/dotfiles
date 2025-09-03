# dotfiles

個人的なdotfiles設定です。Vim、zsh、tmuxの設定が含まれています。

## セットアップ

### 1. リポジトリのクローン

```bash
git clone --recursive <your-repo-url> ~/.dotfiles
```

### 2. 必要なツールのインストール

#### Homebrew パッケージ
```bash
# Brewfileから必須パッケージを一括インストール
brew bundle install --file=~/.dotfiles/Brewfile
```

#### iTerm2シェル統合
```bash
# シェル統合スクリプト
curl -L https://iterm2.com/shell_integration/zsh -o ~/.dotfiles/.zsh/.iterm2_shell_integration.zsh

# ユーティリティスクリプト
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
```

#### zshプラグイン
```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.dotfiles/.zsh/zsh-autosuggestions
```

#### npm グローバルパッケージ
```bash
# AI CLI・文章校正ツール
npm install -g @anthropic-ai/claude-code @google/gemini-cli textlint textlint-rule-preset-ja-technical-writing
```

#### Vimプラグイン
```bash
# Vundleは既にsubmoduleとして管理済み
# Vimを起動してプラグインをインストール
vim +PluginInstall +qall
```

### 3. シンボリックリンクの作成

```bash
# zsh設定
ln -sf ~/.dotfiles/.zsh/.zshenv ~/.zshenv

# Vim設定
ln -sf ~/.dotfiles/.vim/.vimrc ~/.vimrc
ln -sf ~/.dotfiles/.vim/.gvimrc ~/.gvimrc
ln -sf ~/.dotfiles/.vim ~/.vim

# tmux設定
ln -sf ~/.dotfiles/.tmux/conf ~/.tmux.conf
```

### 4. シェルの変更

```bash
# zshをデフォルトシェルに設定
chsh -s $(which zsh)
```

## 構成

- **`.vim/`**: Vim設定ファイル
  - 設定は`configs/`ディレクトリに機能別に分割
  - Vundleでプラグイン管理
- **`.zsh/`**: zsh設定ファイル
  - 設定は`.zshrc.*`ファイルに機能別に分割
  - iTerm2統合機能を含む
- **`.tmux/`**: tmux設定ファイル
- **`CLAUDE.md`**: プロジェクト固有の情報とルール

## 関連リポジトリ

- **[dev-tools](https://github.com/oosugi20/dev-tools)**: 開発用ユーティリティスクリプト集
  - Git文字コード変換ツール
  - GitHub Issues管理スクリプト
  - その他の開発補助ツール

## 詳細情報

詳細については各ディレクトリのREADME.mdを参照してください。