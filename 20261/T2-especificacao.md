---
layout: 20261/event
permalink: /20261/T2-especificacao
logo: assets/images/logo-ic.png
title: Especificação de linguagem de programação
kickoff:
    year: 20261
---

# compL

+ [Aspectos Léxicos](./T1-especificacao)
+ [Aspectos Sintáticos](#aspectos-sintáticos)

---

## Aspectos Sintáticos

Um programa compL é uma sequência de declarações,
sendo que cada declaração pode ser 
declaração de função, declaração de protótipo de função 
ou declaração de variável global com inicialização opcional.
As declarações de função não podem ser aninhadas.

O corpo de uma função é definido entre chaves '{' e '}'.
No corpo de uma função, pode-se declarar variáveis locais, 
incluindo do tipo array, com inicialização opcional e 
comandos.

Comandos básicos incluem atribuição, return, print, if, if-else ou while.
Um bloco é uma sequência de declarações locais 
e/ou comandos -- entre chaves, '{' e '}'.
Pode-se declarar variáveis locais a um bloco mas não funções.

### Declaração de variável 

- Uma declaração de variável consiste de 
um identificador, seguido por ':', pelo seu tipo e por ';'.
O tipo pode ser simples (integer ou boolean) ou estruturado (array). 
Não há variável 'void'
- A variável de tipo simples pode ser inicializada na declaração; nesse caso, o tipo declarado será seguido por '=', por um valor do tipo e por ';'.
- A definição do tipo estruturado "array" inicia-se pela 
palavra reservada ```array```,  seguida pelo seu 
tamanho (um valor do tipo integer entre colchetes) 
e pelo tipo base de seus elementos.
- A variável do tipo "array" pode ser inicializada na declaração; 
nesse caso, o tipo declarado será seguido por '=', 
por um sequência de valores (entre chaves e separados por vírgula) 
de um tipo simples, e por ';'.

#### Exemplos

```
x: boolean;
y: integer = 123;
z: boolean = false;
a: array [10] integer; 
b: array [3] boolean = {true,false,false};
```

### Declaração de função

- Uma declaração de função em compL começa pelo seu nome,
seguido por ':', seguido pela palavra-chave ```function```, 
pelo tipo (ou _void_), 
por uma lista de parâmetros entre '(' e '), o símbolo '=' e, por fim,
por _código entre {}_. 
- A função pode ter tipo atômico simples ou _void_ (ver printarray).
- A lista de parâmetros pode ser vazia, ou conter um ou mais parâmetros separados por ','
<!--
- A passagem de parâmetros do tipo integer é boolean é por valor, 
e para arrays é por referência.
-->
- A declaração de um parâmetro de tipo simples é similar a declaração de variável simples.
- A declaração de um parâmetro do tipo array não deve indicar a dimensão do array (ver printarray).
- Parâmetros não podem ser inicializados na declaração da função.

```
square: function integer ( x: integer ) = {
    return x*x;
}

```

```
// printarray com while

printarray: function void
 ( a: array [] integer, size: integer ) = {
    i: integer = 0;
    while (i<size) {
        print a[i]; 
        i = i + 1;
    }
} 

```

### Blocos

Um bloco é um trecho de código entre chaves '{' e '}'.
Não há ';' (ponto-e-vírgula) após '}'.
O trecho de código compL pode incluir declarações de variáveis locais  
e obrigatoriamente um ou mais comandos (ver função  _printarray_).
Declarações de variáveis devem preceder __todos__ os comandos do bloco.

### Comandos

Comandos básicos em compL incluem
comando de atribuição, return, print, if, if-else, e while.
Comandos básicos são separados por ';'.
No caso de if, if-else e while com blocos, 
não se deve colocar ';' após '}' (ver _printarray_ acima).

O comando _print_ não é considerado como chamada de função 
e recebe uma lista de expressões separadas por ','.

- Exemplo: ```print temp, total;```

### Expressões

compL possui vários operadores aritméticos encontrados na linguagem C, 
com o mesmo significado, associatividade e nível de precedência.
São operadores de compL, da maior para a menor precedência:

```
[] f()           // array, chamada de função
- !              // menos, not (unários)
* /              // multiplicação, divisão
+ -              // adição, subtração
< <= > >= == !=  // comparação
=                // atribuição
```

---

### Créditos

Adaptado do material didático cedido pelo Prof. Vinicius Petrucci e 
do livro de D. Thain.

