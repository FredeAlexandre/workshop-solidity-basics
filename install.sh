#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

install_curl_ubuntu() {
    sudo apt update
    sudo apt install -y curl
}

install_curl_arch() {
    sudo pacman -Sy --noconfirm curl
}

install_curl_fedora() {
    sudo dnf install -y curl
}

install_curl_macos() {
    brew install curl
}

install_curl() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if [[ -f /etc/os-release ]]; then
            . /etc/os-release
            if [[ "$ID" == "ubuntu" ]]; then
                install_curl_ubuntu
            elif [[ "$ID" == "arch" ]]; then
                install_curl_arch
            elif [[ "$ID" == "fedora" ]]; then
                install_curl_fedora
            else
                echo -e "${RED}[ERROR] Unsupported Linux distribution.${NC}"
                exit 1
            fi
        else
            echo -e "${RED}[ERROR] Unsupported Linux distribution.${NC}"
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        install_curl_macos
    else
        echo -e "${RED}[ERROR] Unsupported OS.${NC}"
        exit 1
    fi
}

requirements() {
    if ! command -v curl &> /dev/null; then
        echo -e "${BLUE}[INFO] curl is not installed. trying to install...${NC}"
        install_curl
        if ! command -v curl &> /dev/null; then
            echo -e "${RED}[ERROR] curl installation failed. Ask for help !${NC}"
            exit 1
        else
            echo -e "${GREEN}[SUCCESS] curl is installed.${NC}"
        fi
        exit 1
    fi
}

requirements
output=$(curl -Ls https://foundry.paradigm.xyz | bash)
command_to_run=$(echo "$output" | awk -F"Run '" '{print $2}' | awk -F"'" '{print $1}')
eval "$command_to_run"
if ! command -v foundryup &> /dev/null; then
    echo -e "${RED}[ERROR] Foundry installation failed. Ask for help !${NC}"
    exit 1
else
    echo -e "${GREEN}[SUCCESS] Foundry is installed.${NC}"
fi
foundryup