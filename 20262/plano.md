---
layout: 20262/event
permalink: /20262/plano
logo: assets/images/logo-ic.png
title: Plano de Aulas
kickoff:
    year: 20262
---

# Plano de Aulas

## Semestre: 2026.2

- SEG , 16:40h - PAF1 - Sala 6
- QUA , 16:40h - Smart Class III

## Atividades


| Semana | Tema | Referência Thain | Observações | 
|---|---|---|
| 1 | O que é um compilador/interpretador/tradutor | Cap. 1–2 | |
| 2 | Análise léxica I — tokens, expressões regulares | Cap. 3 | *M1* |
| 3 | Análise léxica II — autômatos finitos, Flex na prática (lab) | Cap. 3 | E1 |
| 4 | Análise sintática I — gramáticas livres de contexto, ambiguidade | Cap. 4 | — |
| 5 | Análise sintática II — *top-down*/*bottom-up*, panorama LL/LR | Cap. 4–5 | E2 |
| 6 | Bison na prática + construção da AST (lab) | Cap. 5–6 | **M2** — analisador léxico + sintático |
| 7 | AST — representação, padrão *visitor*, percursos; revisão | Cap. 6 | — |
| 8 | Semântica I — sistemas de tipos (estático × dinâmico, forte × fraco, nominal × estrutural) | Cap. 7 (ampliado) | — |
| 9 | Semântica II — tabela de símbolos, escopo léxico × dinâmico, checagem estática vs. verificação em tempo de execução | Cap. 7 (ampliado) |  |
| 10 | Semântica III — inferência de tipos básica; estudo de caso Python/tipagem gradual | Complementar | *M3* - verificação de tipos |
| 11 | Estratégias de execução — interpretação em árvore, ambientes e *closures* | Complementar (Crafting Interpreters, Parte II) |  |
| 12 | Representação de valores em tipagem dinâmica (*tagged values*/*boxing*), erros de tipo em tempo de execução | Complementar | — |
| 13 | Geração dinâmica de código — bytecode e máquina virtual de pilha; compilação de AST para bytecode | Complementar (Crafting Interpreters, Parte III) | **M4** — interpretador/VM funcional |
| 14 | Panorama de geração de código nativo/JIT e coleta de lixo (conceitual); otimizações leves | Cap. 9–12 (compactado) | — |
| 15 | Apresentações finais e avaliação por pares | — | **Entrega final** |


<!--
### Parte I

| **Dia**  | **Data** | **Assunto**                                             | **Atividade** | **Entrega** |
| 1   |  19/8  | Sem aula                |           |         |
| 2   |  24/8  | SemComp 2026            |           |         |
| 3   |  26/8  | Introdução à Compilação |           |         |
| 5   |  31/8  | Aula cancelada          |           |         |
| 6   |  02/9  | [Conceitos básicos de análise léxica](https://www.dropbox.com/scl/fi/fwa19tjod44apseln3iyb/ch03-2ed-Scanning-Thain-Compiler-Book.pdf?rlkey=bpwxzp7g1zxpsqbmwtlui40ow&st=wlp28u3v&dl=0) | Leitura do Cap. 3 | | 
|        |        | Revisão: Expressões regulares (ER) e Autômatos Finitos |          | | 
| 7   | Feriado | | | | 
| 8   |  09/9   | Implementação de analisadores léxicos. [Flex](https://www.dropbox.com/scl/fi/ew65m7cu5wf7yh0bogyy2/ch2-en-1ed-Levine-Flex_Bison-2009-flex.pdf?rlkey=eiwpswu2m3qcs2r7rr184y6in&st=d48feb9r&dl=0) | Exercício 1 - Calculadora: aspectos léxicos | |
| 9   |  14/9  | [Conceitos básicos de análise sintática](https://www.dropbox.com/scl/fi/3euqwn6nj0i8i1kp6n9x5/ch04-2ed-Parsing-Thain-Compiler-Book-1-conceitos.pdf?rlkey=wsps861hfih1e9vi8p8rsm250&st=r0163khx&dl=0) | Apresentação da especificação de T1 | |
| 10  |  16/9  | Implementação de T1 | | |
|     |        |                     | | | 
| 6   |  07  | Análise sintática descendente. [Análise LL(1)](https://www.dropbox.com/scl/fi/m0ea8mzhtj20dxnw934o8/ch04-2ed-Parsing-Thain-Compiler-Book-2-top-down_LL.pdf?rlkey=4t59393k5zp7ckpaflvzyftlx&st=9wi6wlg6&dl=0) | | |
| 7   |  09  | Bison I | Exercício 2 - Calculadora: integração com Flex | Entrega de T1 |
| 8   |  14  | Análise sintática ascendente. [Análise LR](https://www.dropbox.com/scl/fi/9l9xq909fqs7qh2r2nds6/ch04-2ed-Parsing-Thain-Compiler-Book-3-bottom-up_LR.pdf?rlkey=ith3jam7mob5weec5l3ncxe0a&st=b9u6vag0&dl=0) | Apresentação da especificação de T2 | |
| 9   |  16  | [Bison II](https://www.dropbox.com/scl/fi/61dprj5q710uaw9p1kvi0/ch05-2ed-Syntax_in_Practice-Thain-Compiler-Book-bison.pdf?rlkey=qjqgljs0t0clnf7f86nnpkbws&st=a86ugdlk&dl=0) | Exercício 3 - Calculadora: Validador | | 
| 10  |  21  | [Árvore Sintática Abstrata](https://www.dropbox.com/scl/fi/m9min59utff46u1tkinmj/ch06-2ed-AST-Thain-CompilerBook.pdf?rlkey=fgc9g79auq0jdvf3fanps8fh8&st=a50bivo3&dl=0) | | |
| 11  |  23  | Bison III - Ações semânticas | Exercício 4 - Calculadora: Interpretador | |
| 12  |  28  | Implementação de T2 | | |
| 13  |  30/9  | Prova 1 | | |
| 14  |  05/10 |  | Apresentação da especificação de T3 | Entrega de T2 |

### Parte II

| **Dia**  | **Data** | **Assunto**                                             | **Atividade** | **Entrega** |
| 15  |  07/10 | Bison III - Ações semânticas | Exercício 4 - Calculadora: Interpretador | |
| 16  |  12 | Análise Semântica | | |
| 17  |  14  | Bison IV | Exercício 5 - Calculadora: Avaliador | | 
| 18  |  19  | Tabela de símbolos | | |
| 19  |  21  | Aula prática - T3 | | |
| 20  |  26  | Sistema de Tipos | Entrega de T3;  Apresentação da especificação de T4 | |
| 21  |  28/10 | Verificação de Tipos | Exercício 6 - Calculadora: Avaliador com tipos | |
| 22  |  02/11 | Atributos de linguagens de programação | | | 
| 23  |  04/11 | Aula Prática - T4 | | | 
| 24  |  09 | Representação Intermediária | | |
| 25  |  11 | Aula prática - T4 | | | 
| 26  |  16 | Ambientes de Referência | Entrega de T4; Apresentação da especificação de T5; Quiz 3 | |

### Parte III

| **Dia**  | **Data** | **Assunto**                                             | **Atividade** | **Entrega** |
| 27 | 18 | Linguagens de Montagem | Exercício 7 - Calculadora executável | | 
| 28 | 23 | Geração de Código | Apresentação da especificação de T5 | |
| 29 | 25 | Aula Prática - T5 | | |
| 30 | 30//11 | Otimização de Código | | |
| 31 | 02 | Aula Prática - T5 | | |
| 32 | 07 | Fechamento | Entrega de T5 | |
| 33 | 09 | Discussão | | |
| 34 | 14 | Discussão | | |
| 35 | 16 | Discussão | | |

-->

* Final do semestre: 19/12/2026

<!--

|  formação de equipes; apresentação do projeto | Cap. 1–2 | Definição da linguagem-alvo pela equipe |


-->
