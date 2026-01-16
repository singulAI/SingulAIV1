# 🚀 Guia de Deploy - SingulAI Platform

## Informações Gerais

- **Versão**: 2.0.0
- **Rede Blockchain**: Sepolia Testnet
- **Backend**: NestJS (Node 18+)
- **Frontend**: React + Vite
- **Contratos**: Solidity 0.8.19

---

## 📋 Pré-requisitos

```bash
# Backend
node >= 18.0.0
npm >= 9.0.0
git >= 2.0.0

# Blockchain
A carteira com ETH Sepolia para gas fees
Chaves privadas armazenadas com segurança
```

---

## 🔧 Variáveis de Ambiente

### Backend API (backend/api/.env)

```env
# SERVER
PORT=3004
NODE_ENV=production
API_PREFIX=api/v1

# BLOCKCHAIN
RPC_URL=https://sepolia.infura.io/v3/YOUR_INFURA_KEY
CHAIN_ID=11155111
NETWORK_NAME=sepolia

# CONTRACT ADDRESSES
SGL_TOKEN_ADDRESS=0xF281a68ae5Baf227bADC1245AC5F9B2F53b7EDe1
AVATAR_BASE_ADDRESS=0x95F531cafca627A447C0F1119B8b6aCC730163E5
AVATAR_WALLET_LINK_ADDRESS=0x9F475e5D174577f2FB17a9D94a8093e2D8c9ED41
TIME_CAPSULE_ADDRESS=0x6A58aD664071d450cF7e794Dac5A13e3a1DeD172
DIGITAL_LEGACY_ADDRESS=0x0Ee8f5dC7E9BC9AF344eB987B8363b33E737b757

# API CONFIG
CORS_ORIGIN=*
RATE_LIMIT=100
RATE_LIMIT_TTL=60000

# SECURITY
JWT_SECRET=your-jwt-secret-here
JWT_EXPIRATION=24h
```

### Smart Contracts (contracts/.env)

```env
# HARDHAT
NETWORK=sepolia
FORK=false

# DEPLOYMENT
PRIVATE_KEY=your-wallet-private-key
ETHERSCAN_API_KEY=your-etherscan-key

# INFURA
INFURA_PROJECT_ID=your-infura-key
```

### Frontend (frontend/.env)

```env
VITE_API_URL=http://localhost:3004/api/v1
VITE_RPC_URL=https://sepolia.infura.io/v3/YOUR_INFURA_KEY
VITE_CHAIN_ID=11155111
VITE_EXPLORER_URL=https://sepolia.etherscan.io
```

---

## 📦 Instalação Local

### 1. Backend API

```bash
cd backend/api

# Instalar dependências
npm install

# Copiar env
cp .env.example .env
# Editar .env com suas variáveis

# Desenvolvimento
npm run start:dev

# Build para produção
npm run build

# Iniciar em produção
npm run start:prod
```

**Endpoints**:
- API: http://localhost:3004
- Swagger: http://localhost:3004/api/docs
- Health: http://localhost:3004/api/v1/blockchain/health

### 2. Smart Contracts

```bash
cd contracts

# Instalar dependências
npm install

# Copiar env
cp .env.example .env

# Compilar contratos
npx hardhat compile

# Executar testes
npx hardhat test

# Cobertura de testes
npx hardhat coverage

# Deploy em Sepolia
npx hardhat run scripts/deploy.js --network sepolia

# Verificar contrato no Etherscan
npx hardhat verify --network sepolia 0xCONTRACT_ADDRESS
```

### 3. Frontend

```bash
cd frontend

# Instalar dependências
npm install

# Copiar env
cp .env.example .env

# Desenvolvimento
npm run dev

# Build para produção
npm run build

# Preview do build
npm run preview
```

**URL**: http://localhost:5173

---

## 🌐 Deploy em Produção

### Backend (VPS)

```bash
# 1. SSH no servidor
ssh user@your-server.com

# 2. Clonar repositório
git clone https://github.com/singulAI/SingulAIV1.git
cd SingulAIV1/backend/api

# 3. Instalar dependências
npm install --production

# 4. Copiar variáveis
cp .env.example .env
# Editar .env

# 5. Build
npm run build

# 6. Usar PM2 para manter rodando
npm install -g pm2
pm2 start dist/main.js --name "singulai-api"
pm2 save
pm2 startup

# 7. Nginx reverse proxy
# /etc/nginx/sites-available/singulai
server {
    listen 80;
    server_name api.singulai.site;

    location / {
        proxy_pass http://localhost:3004;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

# Habilitar
sudo ln -s /etc/nginx/sites-available/singulai /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### Smart Contracts (Deploy Final)

```bash
cd contracts

# Verificar rede
npx hardhat network list

# Deploy em Sepolia
npx hardhat run scripts/deploy.js --network sepolia

# Resultado: Salve os endereços dos contratos!
```

### Frontend (Vercel/Netlify)

#### Vercel
```bash
npm install -g vercel
vercel login
vercel
# Seguir as instruções
```

#### Netlify
```bash
npm run build
# Fazer upload de dist/ para Netlify
```

---

## ✅ Checklist de Deploy

- [ ] Todas as variáveis de ambiente configuradas
- [ ] Testes passando (npm run test)
- [ ] Build sem erros
- [ ] Contatos inteligentes compilados e testados
- [ ] Frontend construído (npm run build)
- [ ] URLs corretas no .env
- [ ] SSL configurado (HTTPS)
- [ ] Rate limiting ativado
- [ ] CORS configurado corretamente
- [ ] Backup de chaves privadas feito com segurança
- [ ] Monitoramento ativado (PM2, Sentry, etc)
- [ ] Logs sendo gravados
- [ ] Banco de dados conectado (se aplicável)

---

## 🔐 Segurança

✅ **Faça:**
- Guarde chaves privadas com segurança (use .env)
- Use HTTPS em produção
- Implemente rate limiting
- Adicione autenticação em endpoints sensíveis
- Valide todas as entradas de usuário
- Use variáveis de ambiente para secrets

❌ **Não faça:**
- Comite chaves privadas
- Exponha RPC URLs públicas
- Desabilite validação CORS
- Use senhas fracas para JWT
- Deixe logs com informações sensíveis

---

## 📊 Monitoramento

### Logs
```bash
# Ver logs em tempo real
pm2 logs singulai-api

# Salvar logs
pm2 logs singulai-api > api.log
```

### Health Checks
```bash
# Verificar saúde da API
curl http://api.singulai.site/api/v1/blockchain/health

# Verificar status da rede
curl http://api.singulai.site/api/v1/blockchain/status
```

---

## 🐛 Troubleshooting

### "Cannot find module"
```bash
rm -rf node_modules package-lock.json
npm install
```

### Porta já em uso
```bash
# Linux/Mac
lsof -i :3004
kill -9 <PID>

# Windows
netstat -ano | findstr :3004
taskkill /PID <PID> /F
```

### Erro de RPC
- Verificar URL do RPC no .env
- Verificar conexão de internet
- Tentar outro provedor de RPC (Alchemy, etc)

### Erro de contrato
- Verificar endereço do contrato
- Verificar se o contrato existe na rede
- Verificar ABI do contrato

---

## 📞 Suporte

- **GitHub Issues**: https://github.com/singulAI/SingulAIV1/issues
- **Email**: dev@singulai.site
- **Docs**: https://singulai.site

---

**Última atualização**: Janeiro 2025
**Versão**: 2.0.0
