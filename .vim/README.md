# .vim Directory Overview

このディレクトリは、Vim の設定とプラグインを管理するためのものです。`.vimrc` を中心に、様々な設定ファイルやプラグインが配置されています。

## Directory Structure

-   **`after/`**:
    -   Vim のデフォルト設定やプラグインの読み込み後に適用される設定ファイルが配置されます。
    -   `ftplugin/`: ファイルタイプごとの設定（例: `markdown.vim`）が、Vim のデフォルト設定や他のプラグインの後に読み込まれます。

-   **`bundle/`**:
    -   Vundle.vim などのプラグインマネージャーによって管理される Vim プラグインが配置されます。`bundle.vim` が Vundle.vim の設定ファイルであり、プラグインのロード順序や有効/無効を制御しています。
    -   主要なプラグイン: `ale`, `copilot.vim`, `editorconfig-vim`, `FuzzyFinder`, `fzf`, `fzf.vim`, `L9`, `lightline.vim`, `matchit.zip`, `mdxdotvim`, `vim-astro`, `vim-fugitive`, `vim-indent-guides`, `vim-javascript`, `vim-jinja`, `vim-prettier`, `vim-qfreplace`, `vim-surround`, `Vundle.vim` など。

-   **`colors/`**:
    -   Vim のカラースキームファイルが配置されます。
    -   `mine.vim`: カスタムのカラースキームファイル。`.vimrc` で `colorscheme mine` として読み込まれています。

-   **`configs/`**:
    -   `.vimrc` から `s:LoadConfig` 関数を通じて読み込まれる、Vim の詳細設定ファイルが配置されます。
    -   設定ファイル例:
        -   `base.vim`: Vim の基本的な設定が含まれます。以前は `conceallevel` のグローバル設定がありましたが、Markdown 以外のファイルでの `conceal` 表示を避けるため、`ftplugin/markdown.vim` に移動されました。
        -   `bundle.ale.vim`, `bundle.copilot.vim`, `bundle.fuf.vim`, `bundle.indent-guides.vim`, `bundle.javascript.vim`, `bundle.lightline.vim`, `bundle.vim`: 各プラグインに関する設定が含まれます。
        -   `commands.ag.vim`, `commands.imgcat.vim`, `commands.vim`: カスタムコマンドの定義が含まれます。`commands.imgcat.vim` は `Imgcat` コマンドを定義しており、これは特定のファイルタイプに依存しない汎用的な画像プレビュー機能を提供します。
        -   `keyremap.vim`: キーマッピングの設定が含まれます。以前は Markdown 関連のコメントがありましたが、`Imgcat` コマンドが汎用的な機能であるため、コメントが修正されました。`Imgcat` 関連のキーマッピングでは、`expand('<cfile>')` を使用してカーソル下の単語を画像パスとして利用しています。
        -   `search.vim`, `view.vim`: 検索や表示に関する設定が含まれます。

-   **`ftplugin/`**:
    -   ファイルタイプごとの設定ファイルが配置されます。`ftplugin` ディレクトリ内のファイルは、特定のファイルタイプ（例: Markdown）のファイルを開いたときにのみ読み込まれます。グローバル変数であっても、特定のファイルタイプにのみ関連する設定は、設定の明確化と管理のしやすさのためにここに配置するのが原則です。
    -   `markdown.vim`: Markdown ファイルに特化した設定。`conceallevel=2` と `let g:markdown_syntax_conceal = 1` が設定され、Markdown ファイルでのみ `conceal` 表示が有効になります。

## Key Configuration Files

-   **`.vimrc`**:
    -   Vim のメイン設定ファイル。
    -   エンコーディング設定 (`set termencoding=utf-8`, `set encoding=utf-8`, `set fileencoding=utf-8`)。
    -   `runtimepath` の設定により、`after/` ディレクトリやこのディレクトリ自体が Vim の検索パスに追加されます。
    -   `colorscheme mine` により、`colors/mine.vim` がカラースキームとして適用されます。
    -   `s:LoadConfig` 関数を通じて `configs/` ディレクトリ内の設定ファイルを動的に読み込みます。これにより、設定がモジュール化され、管理しやすくなっています。
    -   `GeminiDiffFix` augroup: Gemini CLI から外部エディタ（Vim）を介して差分表示を行う際に、その色設定を上書きするために特別に追加された自動コマンドが定義されています。`MySetDiffColors()` 関数で `DiffAdd`, `DiffChange`, `DiffDelete`, `DiffText`, `DiffTextAdd` の色を調整しています。

-   **`.gvimrc`**:
    -   GVim (GUI 版 Vim) に特化した設定ファイル。

-   **`.netrwhist`**:
    -   Netrw プラグインの履歴ファイル。

## How to Use

このディレクトリは、Vim の設定をモジュール化し、管理しやすくするために構成されています。`.vimrc` を起点として、各設定ファイルが読み込まれることで、Vim の動作がカスタマイズされます。
