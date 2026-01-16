# 📝 Gerador de Mensagens de Commit - SingulAI Platform

## 🎯 Visão Geral

Este documento fornece um guia completo para criar mensagens de commit bem estruturadas para o projeto **SingulAI Platform v2.0.0**, seguindo as melhores práticas de **Conventional Commits**.

---

## 🚀 O Que Foi Implementado

### ✅ Estrutura do Projeto

O repositório SingulAI agora possui:

```
SingulAIV1/
├── README.md                 # Documentação principal do projeto
├── LICENSE                   # MIT License
├── .gitignore                # Configuração Git
├── deploy.sh                 # Script de deploy automatizado
├── docs/
│   ├── COMMIT_GUIDE.md       # Guia de mensagens de commit
│   └── DEPLOY.md             # Guia completo de deployment
├── backend/api/              # Backend NestJS (estrutura)
├── contracts/                # Smart Contracts (estrutura)
├── frontend/                 # Frontend React (estrutura)
└── scripts/                  # Scripts de automação
```

### 📊 Informações do Commit Inicial

```
Commit Hash: a732556
Tipo: chore(project)
Assunto: initialize SingulAI Platform v2.0.0 repository
Status: ✅ Commitado com sucesso
```

---

## 📋 Informações Necessárias Para Criar Commits

Ao fazer um commit em SingulAI, você precisa de:

### 1. **Tipo de Mudança**

| Tipo | Descrição | Exemplo |
|------|-----------|---------|
| `feat` | Nova funcionalidade | Avatar minting endpoint |
| `fix` | Correção de bug | Reentrancy vulnerability |
| `docs` | Documentação | API documentation update |
| `style` | Formatação/estilo | Prettier, ESLint |
| `refactor` | Refatoração sem funcional | Code optimization |
| `test` | Testes | Test coverage increase |
| `chore` | Manutenção | Dependency updates |
| `ci` | CI/CD | GitHub Actions |
| `perf` | Performance | Gas optimization |

### 2. **Escopo**

Área afetada do projeto:

- `backend` - Backend API (NestJS)
- `contracts` - Smart Contracts (Solidity)
- `frontend` - Frontend (React)
- `docs` - Documentação
- `infra` - Infraestrutura
- `project` - Projeto geral

### 3. **Assunto**

- Máximo 50 caracteres
- Use imperativo ("add" não "added")
- Comece com maiúscula
- Sem ponto final

### 4. **Corpo**

- Explique **o quê** e **por quê**
- Máximo 72 caracteres por linha
- Deixe uma linha em branco entre assunto e corpo

### 5. **Rodapé**

- Referências de issues: `Closes #123`
- Breaking changes: `BREAKING CHANGE: description`

---

## 🎨 Exemplos Prontos Para Usar

### Exemplo 1: Nova Feature no Backend

```
feat(backend): add user wallet authentication endpoint

Implemented POST /api/v1/auth/verify-wallet endpoint for Web3 authentication.
Validates ownership of wallet address using message signing.
Returns JWT token for subsequent authenticated requests.

Features:
- ECDSA signature verification
- JWT token generation and refresh
- Rate limiting on authentication attempts

Tests:
- Unit tests: 12 passing
- Integration tests: 8 passing
- Coverage: 92%

Closes #45
```

### Exemplo 2: Fix nos Contratos

```
fix(contracts): prevent double spending in staking rewards

Fixed critical vulnerability where rewards could be claimed multiple times.
Implemented checks-effects-interactions pattern and added state validation.

Changes:
- Updated StakingPool.sol claim() function
- Added ReentrancyGuard to all public functions
- Added test cases for edge cases

Security:
- Audited against OpenZeppelin best practices
- No external calls before state changes

BREAKING CHANGE: StakingPool interface updated, redeploy required
```

### Exemplo 3: Documentação

```
docs(api): complete swagger documentation for all endpoints

Added detailed Swagger documentation for 19 API endpoints:
- Blockchain module (3 endpoints)
- SGL Token module (5 endpoints)
- Avatar module (2 endpoints)
- Staking module (3 endpoints)
- Time Capsule module (3 endpoints)
- Legacy module (3 endpoints)

Includes:
- Parameter descriptions and examples
- Response schemas and error codes
- Authentication requirements
- Rate limit information

Closes #67
```

### Exemplo 4: Refatoração Frontend

```
refactor(frontend): optimize Web3 wallet connection

Consolidated wallet connection logic using custom hook pattern.
Improved error handling and network switching.

Before:
- Multiple useEffect hooks scattered across components
- Inconsistent error messages
- No retry mechanism

After:
- Single useWallet() hook with all logic
- Standardized error handling
- Automatic retry on network errors
- 40% less code duplication

No breaking changes, fully backward compatible.
```

### Exemplo 5: Testes

```
test(contracts): add comprehensive test suite for avatar contract

Added 32 new test cases for AvatarBase (ERC-721) contract:

Minting:
- Valid mint scenarios (5 tests)
- Authorization checks (4 tests)
- Metadata validation (3 tests)

Transfers:
- Standard transfers (6 tests)
- Approvals (4 tests)
- Safe transfers (3 tests)

Burns:
- Burn functionality (3 tests)
- Event emissions (2 tests)
- Edge cases (2 tests)

Results:
- All 32 tests passing
- Coverage: 95%
- Gas usage within limits

Closes #89
```

### Exemplo 6: Atualizações de Dependências

```
chore(deps): update dependencies to latest stable versions

Updated:
- @nestjs/core: 10.2.0 → 10.3.0
- ethers.js: 6.8.1 → 6.9.2
- hardhat: 2.18.2 → 2.19.0
- react: 18.2.0 → 18.2.1
- vite: 5.0.0 → 5.0.1

Changes:
- No breaking changes detected
- All tests passing
- Security patches included

Testing:
- Full regression testing completed
- 150+ tests passing
- No new vulnerabilities
```

---

## 🔍 Template Genérico

Copie e adapte este template:

```
<type>(<scope>): <subject>

<detailed description of what changed and why>

## Changes
- Change 1
- Change 2
- Change 3

## Impact
- Impact 1
- Impact 2

## Testing
- Test 1 passing
- Test 2 passing

## Checklist
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] No console.log or debug code
- [ ] Breaking changes documented
- [ ] Related issues referenced

Closes #ISSUE_NUMBER
```

---

## ✅ Checklist Antes de Commitar

- [ ] Código compila sem erros
- [ ] Todos os testes passam
- [ ] Nenhum console.log ou debug code
- [ ] Documentação foi atualizada
- [ ] Sem conflitos com main branch
- [ ] Mensagem segue Conventional Commits
- [ ] Uma mudança por commit (atomic commits)
- [ ] Breaking changes claramente documentados

---

## 🛠️ Comandos Git Úteis

```bash
# Ver histórico formatado
git log --oneline --graph --all

# Commits de um escopo específico
git log --oneline --grep="feat(backend)"

# Commits recentes
git log -5 --oneline

# Ver mudanças que serão commitadas
git diff --staged

# Fazer commit com editor (para mensagens longas)
git commit

# Ammend último commit (se ainda não foi enviado)
git commit --amend --no-edit

# Ver detalhes de um commit
git show a732556
```

---

## 📚 Referências

- **Conventional Commits**: https://www.conventionalcommits.org/
- **Commitizen**: http://commitizen.github.io/
- **Git Best Practices**: https://git-scm.com/book/en/v2
- **Project Docs**: [docs/](./docs/)

---

## 📞 Suporte

Para dúvidas sobre mensagens de commit, consulte:

- [docs/COMMIT_GUIDE.md](./docs/COMMIT_GUIDE.md) - Guia detalhado
- [docs/DEPLOY.md](./docs/DEPLOY.md) - Deploy e configuração
- [GitHub Issues](https://github.com/singulAI/SingulAIV1/issues)
- Email: dev@singulai.site

---

**Última atualização**: Janeiro 16, 2025
**Versão do Projeto**: 2.0.0
**Status**: ✅ Pronto para desenvolvimento
