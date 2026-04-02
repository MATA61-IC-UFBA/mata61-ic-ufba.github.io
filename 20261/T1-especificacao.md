---
layout: 20261/event
permalink: /20261/trabalhos
logo: assets/images/logo-ic.png
title: Especificação de linguagem de programação
kickoff:
    year: 20261
---

# compL 

+ [Aspectos Léxicos](#aspectos-léxicos)
+ [Aspectos Sintáticos](#aspectos-sintáticos)
+ [Aspectos Semânticos](#aspectos-semânticos)

## Visão Geral

A linguagem compL é uma linguagem simples  usada para o ensino de compiladores em cursos de graduação. A linguagem compL inclui expressões, fluxo de controle básico, funções recursivas e verificação de tipos. 

## Aspectos Léxicos

### 1. Caracteres de espacejamento (_whitespace_)

- Os caracteres de espacejamento são _blank_ (' '), _newline_ ('\n'),  _tab_ ('\t') e _carriage return_ ('\r').

Os caracteres de espacejamento não têm papel significativo em programas compL e devem ser desconsiderados pelo analisador léxico.

- Exemplo 1: 
```a=5;``` e  ```    a =  5;``` 
retornam tokens para ```a```, ```=```, ```5``` e ```;```, 
desconsiderando caracteres de espacejamento.

### 2. Comentários de uma linha

- Apenas comentários de uma linha (_single-line comments_) são válidos. 

Comentários começam com ```//``` e se estendem até o final da linha.
Comentários devem ser descartados pelo analisador léxico.

- Exemplo 2: ```a=5; // comentário no estilo C++```

### 3. Identificadores

- Identificadores são usados como nomes de variáveis e funções. 

São compostos por letras maiúsculas e minúsculas, dígitos decimais e _underscores_.
Identificadores devem começar com uma letra e podem ter até 256 caracteres.
Caracteres maiúsculos e minúsculos em identificadores são diferenciados.

- Exemplo 3: ```i x9 x9_ my_str name4you  NomeCompleto```
- Exemplo 4: ```x9``` e ```X9``` são dois identificadores distintos.

### 4. Palavras-chave (_keywords_)

```
array  boolean  else  false  function  if
integer  print  return  true  void while
``` 

As palavras-chave, sempre escritas em letras minúsculas, são reservadas 
e não podem ser usadas como identificadores. 
 
- Exemplo 5: ```function``` é palavra reservada, porém  ```Function``` não é.

#### Tipos

- Duas palavras reservadas são usadas para representar tipos atômicos da linguagem:
```integer``` e  ```boolean ```.

As palavras reservadas ```true``` e ```false``` são literais do tipo _boolean_.

- A palavra reservada ```array``` é usada na declaração de arrays, único tipo estruturado da linguagem.

### 5. Símbolos especiais

#### Símbolos simples

```
  +  -  *  /  %  !  <  >  =  : ;  ,  (  )  [  ]  {  } 
```

#### Símbolos compostos

```
  <=  >=  ==  !=  
```

### 6. Literais 

#### Tipo ```integer```

Uma constante inteira é uma sequência não-vazia de dígitos decimais.

#### Tipo ```boolean```

Há duas constantes válidas para o tipo ```boolean```: ```false``` e ```true```.

### Erros Léxicos

- símbolo inválido 

```?``` (caractere não é um símbolo válido)

Obs.: ```5abc``` não é erro léxico. 
O analisador deve retornar o token NUM, seguido por token ID.

### Exemplos

```
x: integer;
y: integer = 123;
b: boolean = false;
```

```
x: integer = 65;
y: boolean = true;
if(x?0)  // erro léxico: símbolo inválido
```

```
f: integer = 0;
if (f<100) ...  etc.
```

```
b: array [2] boolean = {true,false};
x: integer = 0;
if(b[0]) x = x+1;     
print x;
```

```

main: function integer () = {
    i: integer = 10;
    while (i > 0) ... etc.  
}
```

---

## Aspectos Sintáticos

TBD.

## Aspectos Semânticos 

TBD.

Adaptado do material didático cedido pelo Prof. Vinicius Petrucci e 
do livro de D. Thain.

