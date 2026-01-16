#!/bin/bash

# ============================================
# 🚀 DEPLOY COMPLETO PARA GITHUB
# SingulAI Platform - REPOSITÓRIO CORRETO
# https://github.com/singulAI/SingulAIV1
# ============================================

set -e

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

clear

echo -e "${BLUE}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║   ███████╗██╗███╗   ██╗ ██████╗ ██╗   ██╗██╗      █████╗    ║
║   ██╔════╝██║████╗  ██║██╔════╝ ██║   ██║██║     ██╔══██╗   ║
║   ███████╗██║██╔██╗ ██║██║  ███╗██║   ██║██║     ███████║   ║
║   ╚════██║██║██║╚██╗██║██║   ██║██║   ██║██║     ██╔══██║   ║
║   ███████║██║██║ ╚████║╚██████╔╝╚██████╔╝███████╗██║  ██║   ║
║   ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝   ║
║                                                               ║
║              🚀 DEPLOY COMPLETO - v2.0.0                     ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

REPO_URL="https://github.com/singulAI/SingulAIV1.git"
PROJECT_NAME="SingulAIV1"

echo -e "${CYAN}📋 Informações do Deploy:${NC}"
echo -e "   Repositório: ${GREEN}$REPO_URL${NC}"
echo ""

# Verificar se git está instalado
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git não encontrado. Instalando...${NC}"
    apt-get update && apt-get install -y git
fi

# Configurar Git
echo -e "${YELLOW}⚙️  Configurando Git...${NC}"
git config --global user.name "SingulAI Team"
git config --global user.email "dev@singulai.site"
echo -e "${GREEN}✅ Git configurado${NC}"
echo ""

# Criar estrutura de diretórios
echo -e "${YELLOW}📁 Criando estrutura do projeto...${NC}"
mkdir -p {backend/api,contracts,frontend,docs,scripts,.github/workflows}
mkdir -p backend/api/src/{config,blockchain,staking,timecapsule,legacy}
mkdir -p contracts/{contracts,test,scripts}
mkdir -p frontend/{src,public,components}
mkdir -p frontend/src/{components,pages,hooks,utils,types,services}
echo -e "${GREEN}✅ Estrutura criada${NC}"
echo ""

echo -e "${GREEN}✅ Deploy preparado com sucesso!${NC}"
