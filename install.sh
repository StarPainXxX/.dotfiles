#!/bin/bash

# 定义颜色，让输出好看点
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_DIR="$HOME/.config"

echo -e "${BLUE}🚀 开始初始化开发环境...${NC}"

# ==========================================
# 1. 系统检测与依赖安装
# ==========================================
install_dependences() {
    echo -e "${YELLOW}🔍 检测操作系统...${NC}"
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo -e "${GREEN}检测到 macOS${NC}"
        if ! command -v brew &> /dev/null; then
            echo -e "${RED}未检测到 Homebrew，请先安装 Homebrew!${NC}"
            exit 1
        fi
        echo "正在安装依赖..."
        brew install git zsh neovim ripgrep node wget fastfetch
        # 安装 clang 相关 (macOS 自带 clang，但 llvm 包包含 clangd)
        brew install llvm

    elif [ -f /etc/arch-release ]; then
        echo -e "${GREEN}检测到 Arch Linux${NC}"
        echo "正在安装依赖..."
        sudo pacman -Sy --noconfirm git zsh neovim ripgrep nodejs npm wget base-devel unzip fastfetch clang

    elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
        echo -e "${GREEN}检测到 Ubuntu/Debian${NC}"
        echo "正在安装依赖..."
        sudo apt update
        sudo apt install -y git zsh neovim ripgrep nodejs npm wget curl unzip clangd clang-format
        # 注意：Ubuntu apt 源里的 neovim 可能很老，这里仅安装基础版，建议后续手动换 snap 或 ppa
    else
        echo -e "${RED}未知的操作系统，跳过依赖安装步骤。${NC}"
    fi
}

install_dependences

# ==========================================
# 2. 安装 Oh My Zsh (如果不存在)
# ==========================================
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}📦 正在安装 Oh My Zsh...${NC}"
    # 使用 --unattended 避免安装完成后直接进入 zsh 导致脚本中断
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    # 删除 OMZ 自动生成的 .zshrc，我们要用自己的
    rm -f "$HOME/.zshrc"
else
    echo -e "${GREEN}✅ Oh My Zsh 已安装${NC}"
fi

# ==========================================
# 3. 下载 Zsh 插件 (适配你的 .zshrc)
# ==========================================
echo -e "${YELLOW}🔌 正在安装 Zsh 插件...${NC}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# ==========================================
# 4. 建立软链接 (核心逻辑)
# ==========================================
echo -e "${YELLOW}🔗 正在链接配置文件...${NC}"

# 确保 .config 目录存在
mkdir -p "$CONFIG_DIR"

# 定义函数：创建链接并备份旧文件
link_file() {
    local src=$1
    local dest=$2

    # 如果源文件不存在，跳过
    if [ ! -e "$src" ]; then
        echo -e "${RED}⚠️  警告: 源文件不存在 $src${NC}"
        return
    fi

    # 如果目标是软链接，先删除
    if [ -L "$dest" ]; then
        rm "$dest"
    # 如果目标是真实文件/目录，备份它
    elif [ -e "$dest" ]; then
        echo -e "${BLUE}备份旧配置: $dest -> $dest.backup${NC}"
        mv "$dest" "$dest.backup"
    fi

    # 创建新的软链接
    ln -s "$src" "$dest"
    echo -e "${GREEN}链接成功: $dest -> $src${NC}"
}

# --- 执行链接 ---

# 1. .zshrc
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# 2. .clang-format
link_file "$DOTFILES_DIR/.clang-format" "$HOME/.clang-format"

# 3. Neovim
link_file "$DOTFILES_DIR/.config/nvim" "$CONFIG_DIR/nvim"

# 4. Clangd
link_file "$DOTFILES_DIR/.config/clangd" "$CONFIG_DIR/clangd"

# ==========================================
# 5. 结尾工作
# ==========================================
echo -e "${BLUE}🎉 配置完成!${NC}"
echo -e "请重新启动终端，或者运行 ${YELLOW}source ~/.zshrc${NC} 生效。"

# 尝试切换默认 Shell 到 zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "正在将默认 Shell 切换为 Zsh..."
    chsh -s "$(which zsh)"
fi