# SingulAI Platform - AI Coding Agent Instructions

> Last updated: January 16, 2026 | Project: SingulAI Platform v2.0.0

## 🎯 Project Overview

**SingulAI** combines AI, Blockchain, and Cyptography to preserve digital legacies via smart avatars, time capsules, and an ERC-20 token economy. The architecture separates concerns across three tiers:
- **Backend**: NestJS + Express + ethers.js (ports 3000-3004)
- **Smart Contracts**: Solidity 0.8.19 on Ethereum/Sepolia testnet (Hardhat)
- **Frontend**: React 18 + Vite + TailwindCSS + Web3-react

## 📐 Architecture Patterns

### Monorepo Structure
- `backend/api/` - NestJS-style backend (currently minimal Express setup)
- `contracts/` - Solidity contracts + Hardhat configuration
- `frontend/` - React Vite application
- `docs/` - Conventional Commits guides, deployment docs
- `scripts/` - Automation utilities

### Data Flow
1. Frontend connects via Web3 wallet (MetaMask integration via @web3-react)
2. Backend provides REST API for off-chain operations (wallet info, health checks)
3. Smart contracts handle on-chain state (tokens, avatars, legacies, time capsules)
4. ethers.js is the bridge layer for blockchain interactions

### Key Smart Contracts (Sepolia Testnet)
- **SGLToken** (`0xF281a68ae5Baf227bADC1245AC5F9B2F53b7EDe1`) - ERC-20 native token
- **AvatarBase** (`0x95F531cafca627A447C0F1119B8b6aCC730163E5`) - ERC-721 avatars
- **TimeCapsule** (`0x6A58aD664071d450cF7e794Dac5A13e3a1DeD172`) - Delayed message contracts
- **DigitalLegacy** (`0x0Ee8f5dC7E9BC9AF344eB987B8363b33E737b757`) - Inheritance contracts
- **AvatarWalletLink** (`0x9F475e5D174577f2FB17a9D94a8093e2D8c9ED41`) - Avatar-to-wallet mapping

## 🛠️ Development Workflows

### Backend Setup
```bash
cd backend/api
npm install
npm run dev          # Uses node src/main.ts (plain Node, not NestJS yet)
npm test             # node --test src/**/*.test.js
npm test:watch       # node --watch --test src/**/*.test.js
npm build            # echo messages only - placeholder
npm start            # node dist/main.js (production)
```

### Smart Contracts
```bash
cd contracts
npm install
npm test             # Runs Chai/Hardhat tests from ./test
npm test:watch       # Watch mode for tests
npm run compile      # Compile Solidity contracts
npm run deploy       # Deploy to local hardhat network
npm run deploy:sepolia # Deploy to Sepolia testnet (requires SEPOLIA_RPC_URL, PRIVATE_KEY, ETHERSCAN_API_KEY in .env)
npm run verify       # Verify contracts on Etherscan
```

### Frontend Development
```bash
cd frontend
npm install
npm run dev          # Vite dev server
npm run build        # Production build
npm run test         # Vitest runner
npm run test:ui      # Vitest UI interface
npm run test:run     # Run tests once
npm run lint         # ESLint on src (ts, tsx)
npm run type-check   # tsc --noEmit for type safety
```

### Full Deployment
- `./deploy.sh` - Automated setup script (creates directories, configures Git)
- Requires: git, Node.js 18+
- Output: Colored ASCII art banner on success

## 📝 Conventional Commits Standard

**All commits must follow this format:**
```
<type>(<scope>): <subject>

<body>
<footer>
```

### Commit Types
- `feat` - New feature
- `fix` - Bug fix (security issues get priority)
- `docs` - Documentation updates
- `refactor` - Code refactoring (no feature changes)
- `test` - Add/update tests
- `chore` - Dependencies, build tooling
- `ci` - GitHub Actions, CI/CD
- `perf` - Performance optimization

### Scopes (Pick One)
- `backend` - NestJS/Express API
- `contracts` - Solidity smart contracts
- `frontend` - React application
- `docs` - Documentation
- `infra` - Infrastructure/deployment
- `project` - Repository-level changes

### Examples
```
feat(backend): add JWT authentication middleware
fix(contracts): resolve reentrancy in staking pool
docs(api): update Swagger endpoints for blockchain calls
refactor(frontend): optimize Web3 connection logic
test(contracts): add SGLToken transfer tests
chore(deps): update ethers.js to 6.9.0
perf(contracts): optimize gas in avatar minting
```

## 🧪 Testing Patterns

### Backend Tests
- Location: `backend/api/src/**/*.test.js`
- Framework: Node.js built-in `test` module + `assert`
- Pattern: Validation of JWT tokens, wallet addresses (regex checks), health endpoints

### Contract Tests
- Location: `contracts/test/*.test.js`
- Framework: Chai assertions + Hardhat ethers
- Pattern: Deploy in `beforeEach`, test token transfers, access control, avatar linking
- Key imports: `ethers.getSigners()`, `ethers.parseEther()`, `expect().to.equal()`

### Frontend Tests
- Framework: Vitest + @testing-library/react
- Focus: Component rendering, user interactions, wallet connection

## 🔐 Environment Configuration

### Required `.env` Variables
```
# Backend
PORT=3004
BLOCKCHAIN_RPC_URL=https://sepolia.infura.io/v3/YOUR_KEY

# Smart Contracts (deploy/verify)
SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/YOUR_KEY
PRIVATE_KEY=0x...
ETHERSCAN_API_KEY=YOUR_KEY

# Frontend
VITE_CONTRACT_ADDRESS=0x...
VITE_RPC_URL=https://sepolia.infura.io/v3/YOUR_KEY
```

Never commit `.env` files (protected by `.gitignore`).

## 📚 Project-Specific Conventions

### Code Organization
- Backend follows modular structure: `config/`, `blockchain/`, `staking/`, `timecapsule/`, `legacy/`
- Frontend uses component-based structure: `components/`, `pages/`, `hooks/`, `utils/`, `services/`, `types/`
- Contracts follow OpenZeppelin patterns (ReentrancyGuard, AccessControl, ERC-721/ERC-20 standards)

### Blockchain Integration
- Always use ethers.js v6.x for provider/signer interactions
- Validate addresses with regex: `/^0x[a-fA-F0-9]{40}$/`
- Use `ethers.parseEther()` for decimal conversions (not string manipulation)
- Implement access control for sensitive operations (minting, transfers)

### API Documentation
- 19 total endpoints documented in README.md
- Categories: Blockchain, SGL Token, Avatars, Staking, Time Capsules, Legacy
- Swagger docs available at `http://localhost:3004/api/docs` (when backend running)

## 🔍 Key Files to Know

- [README.md](../README.md) - Complete project overview, features, API endpoints
- [docs/COMMIT_GUIDE.md](../docs/COMMIT_GUIDE.md) - Detailed commit conventions
- [docs/PROJECT_SUMMARY.md](../docs/PROJECT_SUMMARY.md) - Architecture summary
- [docs/DEPLOY.md](../docs/DEPLOY.md) - Deployment procedures
- [contracts/hardhat.config.js](../contracts/hardhat.config.js) - Solidity compiler settings
- [backend/api/package.json](../backend/api/package.json) - Backend dependencies
- [frontend/package.json](../frontend/package.json) - Frontend dependencies
- [EXAMPLE_COMMIT.md](../EXAMPLE_COMMIT.md) - Commit format examples

## ⚠️ Critical Considerations

1. **Testnet Only**: Contracts are on Sepolia testnet; never use mainnet without audit
2. **Wallet Security**: Never log private keys; use environment variables exclusively
3. **Gas Optimization**: Solidity 0.8.19 has optimizer enabled (200 runs); test gas costs before deployment
4. **Breaking Changes**: Mark with `BREAKING CHANGE:` footer in commit messages
5. **Dependencies**: Keep ethers.js, React, and Hardhat versions aligned with package.json
6. **Reentrancy**: All fund-moving functions must implement checks-effects-interactions pattern

## 📦 Quick Reference: Core Dependencies

| Package | Version | Role |
|---------|---------|------|
| express | 4.18.2 | Backend web framework |
| ethers | 6.9.0 | Blockchain interactions |
| react | 18.2.0 | Frontend UI |
| hardhat | 2.19.0 | Contract compilation & testing |
| @openzeppelin/contracts | 4.9.3 | Reusable contract patterns |
| vite | 5.0.0 | Frontend build/dev |

## 🎓 When Stuck

1. **Blockchain interactions** → Check [docs/PROJECT_SUMMARY.md](../docs/PROJECT_SUMMARY.md) data flow section
2. **Commit format** → Reference [docs/COMMIT_GUIDE.md](../docs/COMMIT_GUIDE.md) or [EXAMPLE_COMMIT.md](../EXAMPLE_COMMIT.md)
3. **Smart contract structure** → Look at test files in `contracts/test/` for usage patterns
4. **Frontend wallet setup** → Examine @web3-react integration in `frontend/src/services/`
5. **Deployment** → Run `./deploy.sh` or check [docs/DEPLOY.md](../docs/DEPLOY.md)
