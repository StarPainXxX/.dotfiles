#!/bin/bash

# 定义颜色
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
        # 基础工具
        brew install git zsh ripgrep node wget fastfetch cmake neovim tree

    elif [ -f /etc/arch-release ]; then
        echo -e "${GREEN}检测到 Arch Linux${NC}"
        echo "正在安装依赖..."
        # 使用 -Syu 确保系统一致性
        sudo pacman -Syu --noconfirm git zsh ripgrep nodejs npm wget base-devel unzip fastfetch clang cmake neovim tree

    elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
        echo -e "${GREEN}检测到 Ubuntu/Debian${NC}"
        echo "正在安装依赖..."
        sudo apt update
        sudo apt install -y git zsh ripgrep nodejs npm wget curl unzip clang-format cmake neovim tree
    else 
        echo -e "${RED}未知的操作系统，跳过依赖安装步骤。${NC}"
    fi
}

install_dependences

# ==========================================
# 2. 询问并安装 Ghostty (新增功能)
# ==========================================
install_ghostty() {
    echo -e "${YELLOW}👻 是否安装 Ghostty 终端? (支持 macOS/Arch) [y/N]${NC}"
    read -r -p "> " response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            echo "正在安装 Ghostty (macOS Cask)..."
            if brew install --cask ghostty; then
                echo -e "${GREEN}✅ Ghostty 安装成功!${NC}"
            else
                echo -e "${RED}❌ 安装失败，请尝试访问官网下载。${NC}"
            fi

        elif [ -f /etc/arch-release ]; then
            echo "正在安装 Ghostty (Arch Linux)..."
            # Arch 官方仓库已收录 ghostty
            if sudo pacman -S --noconfirm ghostty; then
                echo -e "${GREEN}✅ Ghostty 安装成功!${NC}"
            else
                echo -e "${RED}❌ Pacman 安装失败。请检查是否启用了 extra 仓库，或尝试使用 AUR。${NC}"
            fi

        elif [ -f /etc/lsb-release ] || [ -f /etc/debian_version ]; then
            echo -e "${YELLOW}⚠️  Ubuntu/Debian 暂无官方安装包，跳过 Ghostty 安装。${NC}"
            echo "请访问 https://ghostty.org/docs/install 手动安装。"
        fi
    else
        echo "跳过 Ghostty 安装。"
    fi
}

install_ghostty

# ==========================================
# 3. 安装 Oh My Zsh (如果不存在)
# ==========================================
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}📦 正在安装 Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    rm -f "$HOME/.zshrc"
else
    echo -e "${GREEN}✅ Oh My Zsh 已安装${NC}"
fi

# ==========================================
# 4. 下载 Zsh 插件
# ==========================================
echo -e "${YELLOW}🔌 正在安装 Zsh 插件...${NC}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# ==========================================
# 5. 建立软链接
# ==========================================
echo -e "${YELLOW}🔗 正在链接配置文件...${NC}"

mkdir -p "$CONFIG_DIR"

link_file() {
    local src=$1
    local dest=$2

    if [ ! -e "$src" ]; then
        # 只是跳过不报错，因为有些配置可能只在部分机器上有
        # echo -e "${RED}⚠️  警告: 源文件不存在 $src (跳过)${NC}"
        return
    fi

    if [ -L "$dest" ]; then
        rm "$dest"
    elif [ -e "$dest" ]; then
        echo -e "${BLUE}备份旧配置: $dest -> $dest.backup${NC}"
        mv "$dest" "$dest.backup"
    fi

    ln -s "$src" "$dest"
    echo -e "${GREEN}链接成功: $dest -> $src${NC}"
}

# --- 执行链接 ---

# 1. .zshrc
link_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# 2. .clang-format
link_file "$DOTFILES_DIR/.clang-format" "$HOME/.clang-format"

# 3. Clangd
link_file "$DOTFILES_DIR/.config/clangd" "$CONFIG_DIR/clangd"

# 4. Ghostty (如果你的 dotfiles 里有这个文件夹，它会自动链接)
link_file "$DOTFILES_DIR/.config/ghostty" "$CONFIG_DIR/ghostty"

# ==========================================
# 6. 结尾工作
# ==========================================
echo -e "${BLUE}🎉 配置完成!${NC}"
echo -e "请重新启动终端，或者运行 ${YELLOW}source ~/.zshrc${NC} 生效。"

if [ "$SHELL" != "$(which zsh)" ]; then
    echo "正在将默认 Shell 切换为 Zsh..."
    chsh -s "$(which zsh)"
fi
