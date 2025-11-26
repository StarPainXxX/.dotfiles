
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true

# 注意：如果你用 Powerlevel10k，建议这里直接设为 powerlevel10k/powerlevel10k
# 但保留 robbyrussell 也不影响，因为后面 source .p10k.zsh 会覆盖它
ZSH_THEME="robbyrussell"

# Plugins
# ⚠️ 注意：在 Arch 上，你需要手动 clone zsh-autosuggestions 和 zsh-syntax-highlighting 到插件目录
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z extract web-search docker)

source $ZSH/oh-my-zsh.sh

# User configuration

# --- 样式配置 ---
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#D84040,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#EC7FA9,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#EC7FA9,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#EC7FA9,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=#FF1493,underline'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#C0C0C0"

# --- 加载 Powerlevel10k 配置 ---
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- 跨平台系统识别与配置 (核心修改部分) ---

# 1. 通用别名 (Mac 和 Linux 都能用)
alias ni='nvim'
alias cl='clear'

# 2. 操作系统判断
if [[ "$(uname)" == "Darwin" ]]; then
    # === macOS 专属配置 ===
    
    # Homebrew (只在 Mac 上运行)
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
    fi

    # Mac 特有的软件路径 (LM Studio, Antigravity)
    export PATH="$PATH:$HOME/.lmstudio/bin"
    export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

    # Mac 的 ls 颜色
    alias ls='ls -G'

elif [[ "$(uname)" == "Linux" ]]; then
    # === Arch Linux 专属配置 ===
    
    # 显卡设置
    alias gpu='prime-run' 
    alias game='prime-run %command%' # 方便你记忆，想用独显就加 gpu 前缀

    # 常用包管理简写
    alias pac='sudo pacman -S'
    alias update='sudo pacman -Syu'
    
    # Linux 的 ls 颜色
    alias ls='ls --color=auto'
fi

# 3. 通用路径 (使用 $HOME 变量代替 /Users/joel)
# Created by `pipx`
export PATH="$PATH:$HOME/.local/bin"

# --- 启动展示 ---
# 确保 fastfetch 已安装，否则不运行以免报错
if command -v fastfetch &> /dev/null; then
    fastfetch --structure "title:os:host:shell:packages:kernel:cpu:gpu:memory" --logo-type small
fi
