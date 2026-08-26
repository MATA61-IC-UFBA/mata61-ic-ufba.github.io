---
marp: true
theme: default
paginate: true
size: 16:9
---

# Compiladores
## Aula 1 — Introdução e o Mapa do Território

Baseado nos capítulos 1 e 2 de *Crafting Interpreters* (Robert Nystrom)
[craftinginterpreters.com](https://craftinginterpreters.com/)

---

## Agenda de hoje

1. Por que estudar implementação de linguagens?
2. Como esta disciplina vai funcionar
3. O mapa do território: as fases de um compilador/intérprete
4. Front end, middle end, back end
5. Atalhos: single-pass, tree-walk, transpiladores, JIT
6. Compilador × Intérprete: não é uma dicotomia

---

## Por que estudar isso? (1/3)
### Pequenas linguagens estão em toda parte

- Para cada linguagem de propósito geral bem-sucedida, existem milhares de linguagens de nicho.
- Chamamos hoje de **DSLs** (*domain-specific languages*): linguagens de configuração, templates, linguagens de script embutidas, formatos de marcação.
- Praticamente todo projeto grande de software acaba precisando construir ou manter um parser/analisador próprio, mesmo quando reaproveita algo pronto.

*(Nystrom, Cap. 1 — [craftinginterpreters.com/introduction.html](https://craftinginterpreters.com/introduction.html))*

---

## Por que estudar isso? (2/3)
### É um excelente exercício de programação

- Implementar uma linguagem é um teste real de habilidade: recursão, árvores, grafos, tabelas de hash — tudo aparece, e de verdade.
- É como treinar corrida com peso no tornozelo: quando você tira o peso, tudo o mais fica mais fácil.
- Você sai desta disciplina um programador mais forte, mesmo que nunca mais escreva outro compilador.

---

## Por que estudar isso? (3/3)
### Desmistificar a "mágica"

- Compiladores costumam parecer arte arcana, reservada a "magos" da computação.
- Na prática: é só código. As pessoas que constroem linguagens são pessoas comuns.
- Meta da disciplina: tirar o mistério e te dar intuição real de como uma linguagem "vive e respira".

---

## Como esta disciplina vai funcionar

A dupla de intérpretes do livro do Nystrom inspira a estrutura do nosso semestre:

| Livro (Nystrom) | Nossa disciplina |
|---|---|
| *jlox* — intérprete em árvore, em Java, foco em corretude | **Opção A** do projeto: interpretador em árvore para nossa linguagem dinâmica |
| *clox* — VM de bytecode, em C, foco em desempenho | **Opção B** do projeto: compilador para bytecode + máquina virtual (desafio extra) |

Front-end (léxica, sintática, AST) continua com Thain e Flex/Bison; a execução dinâmica segue essa segunda trilha.

---

## Transição: o Mapa do Território

> "É preciso ter um mapa, por mais tosco que seja. Do contrário, você vagueia por toda parte." — J.R.R. Tolkien

Antes de programar qualquer coisa, vamos entender **as fases** que praticamente toda implementação de linguagem percorre — dos anos 1950 até hoje.

*(Nystrom, Cap. 2 — [craftinginterpreters.com/a-map-of-the-territory.html](https://craftinginterpreters.com/a-map-of-the-territory.html))*

---

## A metáfora da montanha

```
   significado do programa (topo)
        ▲                    ▼
        │                    │
   análise estática     geração de código
        │                    │
     parsing              VM/runtime
        │                    │
     scanning            (execução)
        ▲
   texto-fonte (base)
```

- **Subida:** do texto bruto até uma representação onde o *significado* do programa fica visível.
- **Descida:** desse significado até algo que uma máquina (real ou virtual) sabe executar.

---

## Fase 1 — Análise Léxica (*Scanning*)

- Também chamada de *lexing*.
- Um **scanner**/**lexer** agrupa a sequência linear de caracteres em unidades maiores: os **tokens**.
- Tokens podem ser de um caractere (`(`, `,`) ou vários (`123`, `"oi!"`, `min`).
- Espaços em branco e comentários geralmente são descartados aqui.

*(Você já viu isso na prática com Flex — esta é a mesma fase, com outro vocabulário.)*

---

## Fase 2 — Análise Sintática (*Parsing*)

- A sintaxe ganha uma **gramática**: regras para compor expressões e comandos maiores a partir de partes menores.
- Um **parser** transforma a sequência achatada de tokens em uma estrutura de árvore: **árvore de análise** ou **árvore sintática abstrata (AST)**.
- O parser também é responsável por reportar **erros de sintaxe**.
- Curiosidade histórica: muitas técnicas de parsing vêm da IA, de tentativas de fazer computadores entenderem linguagem humana — que se mostrou "bagunçada" demais, mas serviu perfeitamente para gramáticas de linguagens de programação.

---

## Fase 3 — Análise Estática

Depois de saber a estrutura sintática, ainda não sabemos o que os nomes significam.

- **Binding / resolution**: para cada identificador, descobrir onde ele foi definido — aqui entra o conceito de **escopo**.
- Se a linguagem é **estaticamente tipada**, é aqui que fazemos a **checagem de tipos**.
- Esse é o topo da montanha: temos uma visão completa do que o programa *significa*.

*(Esta fase será o coração da nossa Unidade 2 — vamos aprofundar bem além do que Nystrom cobre aqui.)*

---

## Onde guardamos o que aprendemos?

Toda essa informação semântica precisa ser armazenada em algum lugar:

1. Como **atributos** na própria árvore sintática (campos preenchidos depois do parsing).
2. Em uma **tabela de símbolos** — uma tabela de consulta indexada por identificadores.
3. Transformando a árvore em uma **estrutura de dados totalmente nova** que expressa a semântica mais diretamente.

---

## Front end, middle end, back end

- Tudo até a análise estática é o **front end** — específico da linguagem-fonte.
- Tudo relacionado à arquitetura de destino é o **back end**.
- No meio, fica o **middle end**: um nome "charmoso, mas espacialmente paradoxal" (Wulf) para as fases que foram inventadas depois — representação intermediária e otimização.

---

## Representação Intermediária (IR)

- Um formato que não é nem a linguagem-fonte, nem a linguagem-destino: uma "interface" entre as duas.
- Vantagem: com *N* linguagens-fonte e *M* arquiteturas-destino, uma IR compartilhada evita escrever *N × M* compiladores completos — basta *N* front ends e *M* back ends.

---

## Otimização

- Uma vez entendido o *significado* do programa, podemos trocá-lo por outro programa **semanticamente equivalente**, porém mais eficiente.
- Exemplo clássico — **constant folding**:

```
pennyArea = 3.14159 * (0.75 / 2) * (0.75 / 2);
// vira, em tempo de compilação:
pennyArea = 0.4417860938;
```

- Nem toda linguagem investe pesado aqui: Lua e CPython geram código pouco otimizado e concentram esforço no *runtime*.

---

## Descendo a montanha: Geração de Código

- Última etapa: converter o programa para algo que a máquina realmente executa.
- Decisão importante: gerar instruções para uma **CPU real** ou para uma **máquina virtual**?
  - **Código nativo**: rapidíssimo, mas trabalhoso de gerar e amarrado a uma arquitetura específica.
  - **Bytecode** (ou *p-code*): instruções para uma máquina hipotética, mais próximas da semântica da linguagem, portáveis entre arquiteturas.

---

## Máquina Virtual (VM)

- Se o compilador gera bytecode, alguém precisa executá-lo: a **máquina virtual**.
- Um programa que emula um chip hipotético em tempo de execução.
- Mais lento que rodar código nativo direto (cada instrução é simulada), mas ganha **simplicidade e portabilidade** — basta um compilador C para rodar em qualquer plataforma.
- É exatamente o caminho que vamos explorar na Unidade 3 (Opção B do projeto).

---

## Runtime

- Depois que o programa está pronto para executar, ainda precisamos de serviços em tempo de execução:
  - Coleta de lixo (se a linguagem gerencia memória automaticamente).
  - Representação do tipo de cada objeto (para testes como "isso é uma lista?").
- Em linguagens compiladas para código nativo, o runtime é embutido no executável.
- Em linguagens como Java, Python e JavaScript, o runtime mora dentro do interpretador/VM.

---

## Atalhos e rotas alternativas (1/4)
### Compiladores de passagem única (*single-pass*)

- Intercalam parsing, análise e geração de código — sem nunca montar uma AST.
- Restrição forte: você precisa saber tudo o que precisa no momento em que vê a expressão.
- Por isso Pascal exige declarações de tipo no início do bloco, e C exige declaração antecipada de funções.

---

## Atalhos e rotas alternativas (2/4)
### Interpretadores em árvore (*tree-walk*)

- Começam a executar logo após o parsing, percorrendo a AST nó a nó.
- Comuns em projetos didáticos e linguagens pequenas — não muito usados em linguagens de propósito geral por serem mais lentos.
- **Esta é a Opção A do nosso projeto final.**

---

## Atalhos e rotas alternativas (3/4)
### Transpiladores

- Em vez de gerar código de baixo nível, o back end produz **código-fonte válido em outra linguagem** de nível similar.
- Também chamados de *compiladores fonte-a-fonte*.
- Exemplo histórico: linguagens que compilam para C para rodar em qualquer lugar com UNIX; hoje, linguagens que compilam para JavaScript para rodar no navegador.

---

## Atalhos e rotas alternativas (4/4)
### Compilação just-in-time (JIT)

- No computador do usuário final, o programa é compilado para código nativo **no momento em que é carregado**.
- Usado pela JVM (HotSpot), pelo CLR da Microsoft e pela maioria dos interpretadores de JavaScript.
- JITs sofisticados monitoram (*profile*) o código em execução e recompilam os trechos mais usados com otimizações mais agressivas.

---

## Compilador × Interpretador: a falsa dicotomia

- **Compilar** é uma *técnica de implementação*: traduzir uma linguagem-fonte para outra forma (geralmente de nível mais baixo). Gerar bytecode é compilar. Transpilar também é compilar.
- Dizer que uma implementação **"é um compilador"** significa que ela traduz, mas não executa — quem executa é o usuário.
- Dizer que **"é um interpretador"** significa que ela executa o código-fonte imediatamente.

---

## Fechando o mapa: para onde vamos

| Fase do mapa | Onde veremos na disciplina |
|---|---|
| Scanning / Parsing / AST | Unidade 1 (Flex, Bison — livro do Thain) |
| Análise estática | Unidade 2 — aprofundada: tipos, escopo, checagem estática × dinâmica |
| IR, otimização, codegen nativo | Panorama conceitual (1–2 aulas), sem implementação extensa |
| Tree-walk interpreter / bytecode + VM | Unidade 3 — coração do projeto final |

---

## Próxima aula

- Retomamos o pipeline com foco na **análise léxica**: tokens, expressões regulares e a implementação de um scanner com Flex.
- Leitura sugerida para casa: Thain, capítulos 1–2 (panorama geral) — para comparar com a visão de Nystrom vista hoje.

### Referências
- Robert Nystrom, *Crafting Interpreters* — Cap. 1, "Introduction": [craftinginterpreters.com/introduction.html](https://craftinginterpreters.com/introduction.html)
- Robert Nystrom, *Crafting Interpreters* — Cap. 2, "A Map of the Territory": [craftinginterpreters.com/a-map-of-the-territory.html](https://craftinginterpreters.com/a-map-of-the-territory.html)
- Douglas Thain, *Introduction to Compilers and Language Design*: [dthain.github.io/books/compiler](https://dthain.github.io/books/compiler/)
