# Variáveis de Ambiente

> Entendendo melhor como funciona e como usar as variáveis de ambiente em projetos Django

## [1/2] 🤔 O que são variaveis de ambiente?

Variáveis de Ambientes como o nome pressuponhe, são variaveis que estão definidas apenas no **ambiente de desenvolvimento**. geralmente são variaveis **importantes** para o funcionamento do sistema, e que não podem ser disponibilizadas de qualquer forma.

## [2/2] 🔧 Como usa-lás no django

Para usarmos variaveis de ambiente em projetos **Django**, precisamos realizar algumas etapas:

1. fazer a instalação da lib **dotenv**;
2. criar um arquivo chamado **.env**, onde terá todas as variaveis de ambiente do seu projeto;
3. Fazer a importação do modulo **load_dotenv** da lib **dotenv**;
4. "ativar" a leitura do arquivo **.env** usando o metodo **load_dotenv()**;
5. Resgatando o valor da variavel de ambiente com o método **os.getenv('<nome_da_variavel_de_ambiente>')**