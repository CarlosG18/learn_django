# Automatização na criação de um projeto e Apps

> Criando uma automação para configurações padrões na criação de um novo projeto em django.

## 🎯 Objetivo

Percebi que sempre quando inicio um projeto em django, perco muito tempo realizando configurações que são sempre padrões e que precisam de um certo tempo para serem realizadas, além da possibilidade de esquecer algo por ser tantos detalhes a se lembrar. por este motivo, criei um pequeno script para automatizar toda a parte de configuração inicial que é nescessario para a criação de um novo projeto e da criação de um app em django.

## 🔍 Como usar?

Aqui estará passo a passo de como ultilizar o codigo feito, lembrando que o sistema operacional que utilizei foi o **linux (mint)**, então possa ser que alguns comandos sejam diferentes:

### 📁 faça o clone deste repositório

1. abra o seu terminal e use o seguinte comando:

```bash
git clone https://github.com/CarlosG18/learn_django.git
```

2. Conceda autorização de execução para os arquivos:

entre no diretorio `/learn_django/codes/auto/` e use o seguinte comando:

```bash
chmod +x dirs.sh
chmod +x create_app.sh
chmod +x ajust_setup.sh
```

### 📝 Realize algumas edições

1. edite o arquivo `.bashrc`:

você pode usar o **vscode** ou usar o **Vim** para edita-ló. use o comando:

```bash
code ~/.bashrc
```

Neste arquivo você irá colocar "atalhos" para facilitar o uso da automação:

```bash
alias init_django='source <diretorio>/dirs.sh'
alias ajust_setup='<diretorio>/ajust_setup.sh'
alias create_app='<diretorio>/create_app.sh'
```

substitua o `<diretorio>` pelo caminho ao qual os arquivos da automação estão disponiveis. use o comando `pwd` para isso.

Com o arquivo `.bashrc` devidamente alterado. use o comando abaixo para carregar os atalhos:

```bash
source ~/.bashrc
```

### 👨‍💻 Usando os comandos 

Com isso feito já podemos usar os atalhos para simplificar nossa vida. são eles:

**iniciar um projeto**:
```bash
init_django <nome_do_diretorio>
```

**criar um app**:
```bash
create_app <nome_do_app> <nome_do_app_primeira_letra_maiuscula>
```

**fique a vontade para alterar algo que em seu projeto se encaixa melhor! 🫡**
