---
layout: 20262/event
permalink: /20262/exercicios/E1/Readme
logo: assets/images/logo-ic.png
title: Exercício 1 (E1)
kickoff:
    year: 20262
---

# Exercício 1 (E1) - Análise Léxica


## (1) Análise léxica (implementar em python)

Fazer um analisador léxico para expressões aritméticas com números inteiros e reais
(com '.') e os operadores aritméticos ```+  -  *  e  / ```.

- Implementar um analisador léxico para expressões aritméticas. 
A função de análise léxica deve ser chamar
```yylex()``` e retornar um código inteiro, com o valor do token reconhecido,
por exemplo, se for constante numérica, retorna o valor 1,
se for operador de adição retorna o valor 2, etc.


### Descrição

- O programa recebe uma expressão digitada na entrada padrão, 
apenas uma expressão por linha e, a cada chamada da função yylex(), 
o analisador léxico  retorna o código da categoria do token (valor inteiro) 
e, para constantes númericas, também retorna o lexema (cadeia de caracteres, 
não é preciso converter para int ou float).
- Usar o token ERROR para indicar erro léxico.
- Definir uma função main() que chama uma função yylex() até final de linha (EOL).
- A mensagem de erro deve ser mostrada na saída padrão após o retorno do token ERROR.
- O programa main.c deve gerar a saída conforme mostrado abaixo.

###  Exemplos

### Entrada válida

  - Entrada:  90 * 100 / 18.0 - 48 + 77
  - Saída:

```
<token: 1, atrib: 90>
<token: 4>
<token: 1, atrib: 100>
<token: 5>
<token: 1, atrib: 18.0>
<token: 3>
<token: 1, atrib: 48>
<token: 2>
<token: 1, atrib: 77>
```

### Entrada inválida

  - Entrada:  90 * 100 / .0 
  - Saída:

```
<token: 1, atrib: 90>
<token: 4>
<token: 1, atrib: 100>
<token: 5>
lexical error, char .
<token: 1, atrib: 0>
```

### Erros Léxicos

- Caractere inválido

## Valores de tokens

Usar esses valores de token para uniformizar e facilitar a minha correção.

```

/* token.h */

typedef enum {
        EOL=0,       // 0 - Final de linha
        NUM,         // 1
        PLUS,        // 2
        MINUS,       // 3
        TIMES,       // 4
        DIV,         // 5
        ERROR,       // 6 - Erro léxico
} token_t; 

```
## Testes

Para rodar o flex, compilar e gerar o executável ```e1```:

```text
make compile
```

Para testar:

```text
make test
```

### Testes

* Usar testes de unidade para python.

### Entrega

A entrega do E1 deve ser feita apenas via GitHub,
com sua implementação no arquivo ```e1.l``` (programa flex).

Os arquivos abaixo não devem ser modificados:
- token.h
- main.c
- makefile

---


## (2) Análise léxica com Flex

Considerar a Descrição e os Exemplos da seção anterior.

- Consultar o capítulo 2 do livro do Levine (Flex&Bison).

- Usar o arquivo token.h

/* token.h */

typedef enum {
        EOL=0,       // 0 - Final de linha
        NUM,         // 1
        PLUS,        // 2
        MINUS,       // 3
        TIMES,       // 4
        DIV,         // 5
        ERROR,       // 6 - Erro léxico
} token_t; 

```

### Testes

Para testar, usaremos uma pasta de tests a ser disponibilizada na aula prática.


---

## Entrega

Os exercícios devem ser iniciados em 14/9
e serão discutidos em sala/lab na aula de 16/9.
A entrada será até 23/9 via github (a ser detalhado).


