# Commit Message Generator - SingulAI Platform

Não posso acessar repositórios diretamente através dessa interface, mas vou fornecer um guia completo para gerar mensagens de commit adequadas para o projeto **SingulAI Platform v2.0.0**.

## 📋 Informações Necessárias para um Commit Ideal

Antes de criar uma mensagem de commit, você precisa de:

1. **Tipo de mudança** (feat, fix, docs, refactor, test, chore, etc.)
2. **Escopo** (qual parte do código foi afetada: backend, frontend, contracts, etc.)
3. **Descrição curta** (máximo 50 caracteres)
4. **Descrição detalhada** (o que mudou e por quê)
5. **Referências de issues** (se aplicável)
6. **Breaking changes** (se houver)

---

## 🎯 Formato Padrão de Commit (Conventional Commits)

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Componentes:

- **type**: feat | fix | docs | style | refactor | test | chore | ci | perf
- **scope**: backend, contracts, frontend, docs, infra
- **subject**: Descrição imperativa, sem ponto final, máx 50 chars
- **body**: Detalhes do que mudou (opcional)
- **footer**: Breaking changes, closes issues (opcional)

---

## 📚 Exemplos de Boas Mensagens de Commit

### Exemplo 1: Nova Feature - Backend

```
feat(backend): add JWT authentication middleware

Implemented bearer token validation for protected API routes.
Added middleware to verify JWT tokens on blockchain and staking endpoints.
Includes automatic token refresh mechanism for improved UX.

Closes #45
```

### Exemplo 2: Fix - Smart Contracts

```
fix(contracts): resolve reentrancy vulnerability in staking pool

Fixed potential reentrancy attack in unstake() function by implementing
checks-effects-interactions pattern. Updated all vulnerable functions to
follow secure coding practices.

Reviewed with OpenZeppelin best practices.
BREAKING CHANGE: Staking contract interface updated
```

### Exemplo 3: Documentação

```
docs(api): update swagger documentation for blockchain endpoints

Added detailed parameter descriptions and response examples for:
- GET /api/v1/blockchain/wallet/:address
- POST /api/v1/blockchain/sgl/transfer
- POST /api/v1/blockchain/avatar/mint

Included authentication requirements and error codes.
```

### Exemplo 4: Refatoração - Frontend

```
refactor(frontend): optimize wallet connection flow

Refactored Web3 integration to use ethers.js v6 pattern
- Consolidated provider initialization logic
- Improved error handling for network switches
- Added retry logic for failed connections

No functional changes, improves maintainability by 30%
```

### Exemplo 5: Testes

```
test(contracts): add comprehensive staking pool tests

Added 25 new test cases for SGLToken staking:
- Deposit/withdrawal validations
- Reward calculation accuracy
- Edge cases for airdrop distribution
- Gas optimization verification

Coverage increased to 95%
```

### Exemplo 6: Chore/Maintenance

```
chore(deps): update dependencies to latest stable versions

Updates:
- @nestjs/core: 10.2.x → 10.3.0
- ethers.js: 6.8.x → 6.9.2
- hardhat: 2.18.x → 2.19.x

All tests passing, no breaking changes detected
```

---

## 🎨 Template de Commit Detalhado para SingulAI

```
<type>(<scope>): <subject>

## Descrição
[O que foi mudado e por quê?]

## Mudanças Principais
- [Mudança 1]
- [Mudança 2]
- [Mudança 3]

## Impacto
- [Impacto 1]
- [Impacto 2]

## Testes
- [Teste 1]
- [Teste 2]

## Checklist
- [ ] Testes adicionados
- [ ] Documentação atualizada
- [ ] Sem breaking changes
- [ ] Código revisar

Closes #ISSUE_NUMBER
```

---

## 📊 Exemplos Específicos para SingulAI

### Para o Backend API (NestJS)

```
feat(blockchain): implement ERC-721 avatar minting endpoint

Added new endpoint POST /api/v1/blockchain/avatar/mint to create NFT avatars.
Integrated with OpenZeppelin ERC-721 contract for secure minting.
Includes validation for owner address and metadata URI storage on IPFS.

- Added AvatarController.mintAvatar() method
- Created AvatarMintDto validation DTO
- Added unit tests with 90% coverage

Closes #123
```

### Para Smart Contracts

```
feat(contracts): add automated reward distribution for staking

Implemented TimeLock pattern for secure reward distribution in StakingPool.
Added automatic APY adjustment based on total staked amount.
Integrated with SGLToken for reward transfers.

- Modified StakingPool contract (added 150 lines)
- Added 8 new test cases
- Gas optimized: reduced deployment cost by 12%

Audited against OpenZeppelin best practices
BREAKING CHANGE: StakingPool interface updated for APY management
```

### Para Frontend (React)

```
feat(frontend): add Web3 wallet connection UI

Implemented connect wallet functionality using ethers.js v6.
Added MetaMask and WalletConnect support with error handling.
Integrated with Zustand for state management.

Components added:
- ConnectWalletButton.tsx
- WalletProvider.tsx
- useWallet() custom hook

Closes #78
```

---

## ⚡ Dicas para Boas Mensagens

✅ **Faça:**
- Use imperativo ("add" não "added")
- Comece com letra maiúscula
- Máximo 50 caracteres no subject
- Explique o "porquê", não o "o quê"
- Referencie issues relevantes
- Descreva breaking changes claramente

❌ **Evite:**
- Múltiplos assuntos em um commit
- Commits genéricos ("fix bug", "update")
- Falta de contexto
- Mensagens vazias ou sem sentido
- Misturar múltiplos tipos de mudança

---

## 🔍 Checklist Antes de Fazer Commit

- [ ] Código passa em todos os testes
- [ ] Sem console.log ou debug statements
- [ ] Documentação atualizada (JSDoc, README)
- [ ] Sem conflitos com main branch
- [ ] Commits bem organizados (um por feature)
- [ ] Mensagem segue Conventional Commits
- [ ] Breaking changes claramente documentados
- [ ] Referências de issues corretas

---

## 📝 Comandos Git Úteis

```bash
# Ver histórico com formato customizado
git log --oneline --graph --all

# Fazer commit com editor aberto
git commit

# Fazer commit com mensagem multilinha
git commit -m "feat(scope): summary

Detailed description here
More details..." 

# Ammend último commit
git commit --amend --no-edit

# Ver mudanças antes de commitar
git diff --staged
```

---

**Para o projeto SingulAI, sempre mantenha o foco em clareza, segurança (especialmente em contratos) e rastreabilidade das mudanças.**
