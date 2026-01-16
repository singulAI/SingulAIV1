# 🚀 SingulAI Platform - v2.0.0

<div align="center">

![SingulAI Banner](https://img.shields.io/badge/SingulAI-Platform-blueviolet?style=for-the-badge&logo=ethereum)
![Version](https://img.shields.io/badge/version-2.0.0-success?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-informational?style=for-the-badge)
![Build](https://img.shields.io/badge/build-passing-brightgreen?style=for-the-badge)

**Revolucionando Legados Digitais com IA e Blockchain**

[🌐 Website](https://singulai.site) • [📚 Documentação](./docs) • [🎯 Roadmap](./docs/ROADMAP.md) • [🐛 Issues](https://github.com/singulAI/SingulAIV1/issues)

</div>

---

## 📖 Índice

- [Sobre](#-sobre-o-projeto)
- [Features](#-features)
- [Arquitetura](#️-arquitetura)
- [Tecnologias](#-tecnologias)
- [Instalação](#-instalação)
- [Estrutura](#-estrutura-do-projeto)
- [API Endpoints](#-api-endpoints)
- [Smart Contracts](#-smart-contracts)

---

## 🎯 Sobre o Projeto

**SingulAI** é uma plataforma revolucionária que combina:
- 🤖 **Inteligência Artificial** para criar avatares digitais únicos
- ⛓️ **Blockchain** (Ethereum) para garantir imutabilidade e transparência
- 🔐 **Criptografia** para proteger dados sensíveis
- 💎 **Tokenização** (SGL) para economia interna

### 🌟 Missão

Preservar legados digitais de forma segura, permanente e acessível às futuras gerações.

---

## ✨ Features

### 🤖 Avatares Digitais IA
- Criação de avatares inteligentes com personalidade única
- Treinamento com memórias, valores e conhecimentos do usuário
- NFT exclusivo para cada avatar (ERC-721)
- Interação em tempo real via chat

### 🔐 Legado Digital
- Sistema seguro de herança digital
- Múltiplos beneficiários
- Condições de desbloqueio customizáveis
- Criptografia end-to-end

### ⏰ Cápsulas do Tempo
- Mensagens programadas para o futuro
- Armazenamento descentralizado (IPFS)
- Prova de autenticidade via blockchain
- Desbloqueio automático por timestamp

### 💎 Token SGL
- Token ERC-20 nativo da plataforma
- Sistema de recompensas por participação
- Governança descentralizada
- Staking com APY variável

---

## 🛠️ Tecnologias

### Backend
| Tecnologia | Versão |
|------------|--------|
| **NestJS** | 10.x |
| **TypeScript** | 5.x |
| **Ethers.js** | 6.x |
| **Swagger** | 7.x |

### Smart Contracts
| Tecnologia | Versão |
|------------|--------|
| **Solidity** | 0.8.19 |
| **Hardhat** | 2.19.x |
| **OpenZeppelin** | 5.x |

### Frontend
| Tecnologia | Versão |
|------------|--------|
| **React** | 18.x |
| **TypeScript** | 5.x |
| **Vite** | 5.x |
| **TailwindCSS** | 3.x |

---

## 📦 Instalação Rápida

### Backend
```bash
cd backend/api
npm install
npm run start:dev
```

### Smart Contracts
```bash
cd contracts
npm install
npx hardhat test
```

### Frontend
```bash
cd frontend
npm install
npm run dev
```

---

## 📁 Estrutura do Projeto

```
SingulAIV1/
├── backend/api/          # NestJS + TypeScript
├── contracts/            # Solidity + Hardhat
├── frontend/             # React + Vite
├── docs/                 # Documentação
├── scripts/              # Automação
├── README.md
├── LICENSE
└── .gitignore
```

---

## 📡 API Endpoints (19 Total)

- **Blockchain**: Health, Status, Wallet Info
- **SGL Token**: Info, Balance, Transfer, Mint, Airdrop
- **Avatares**: Balance, Mint
- **Staking**: Info, User Data, Leaderboard
- **Time Capsules**: Info, User Capsules, Details
- **Legacy**: Info, User Legacies, Details

**Docs**: `http://localhost:3004/api/docs`

---

## 📜 Smart Contracts (Sepolia Testnet)

| Contrato | Endereço |
|----------|----------|
| SGLToken | `0xF281a68ae5Baf227bADC1245AC5F9B2F53b7EDe1` |
| AvatarBase | `0x95F531cafca627A447C0F1119B8b6aCC730163E5` |
| AvatarWalletLink | `0x9F475e5D174577f2FB17a9D94a8093e2D8c9ED41` |
| TimeCapsule | `0x6A58aD664071d450cF7e794Dac5A13e3a1DeD172` |
| DigitalLegacy | `0x0Ee8f5dC7E9BC9AF344eB987B8363b33E737b757` |

---

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/MinhaFeature`)
3. Commit (`git commit -m 'feat: Minha feature'`)
4. Push (`git push origin feature/MinhaFeature`)
5. Abra um Pull Request

### Padrões de Commit
- `feat:` Nova funcionalidade
- `fix:` Correção de bug
- `docs:` Documentação
- `refactor:` Refatoração
- `test:` Testes

---

## 📄 Licença

MIT - Veja [LICENSE](LICENSE) para detalhes.

---

<div align="center">

**⭐ Se este projeto foi útil, considere dar uma estrela!**

Made with ❤️ by SingulAI Team

</div>
