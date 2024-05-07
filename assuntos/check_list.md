# check-list para iniciar um projeto em django

> check-list para criar e configurar um projeto em django

## [1/7] 🚀 Criando um ambiente virtual

é uma boa prática desenvolver nossa aplicação django usando um ambiente virtual. para isso vamos usar o **virtualenv**. primeiro precisamos instala-ló:

```bash
$ pip install virtualenv
```

com o virtualenv instalado, podemos criar nosso ambiente virtual e ativa-lo atraves dos comandos abaixo:

```bash
$ virtualenv venv
$ source ./venv/bin/activate
```

**⚠️ OBS**: Lembrando que estou usando o sistema operacional **LINUX**, ou seja, se você estiver usando um SO diferente, possa ser que os comandos para ativar o ambiente virtual sejam outros.

## [2/7] 🐍 Instalando o Django e iniciando um projeto

Com o ambiente virtual ativado, vamos instalar o **Django**:

```bash
$ pip install django
```

**⚠️ OBS**: sempre que voce instalar alguma lib com o comando `pip` é recomendavel reescrever o arquivo **requirements.txt** com o comando:

```bash
$ pip freeze > requirements.txt
```

Para iniciar um projeto em **Django** use o seguinte comando:
```bash
$ django-admin startproject [nome_do_projeto]
```

## [3/7] ⚙️ Habilitando variaveis de Ambiente 

### 🤔 O que são variaveis de ambiente?

Variáveis de Ambientes como o nome pressuponhe, são variaveis que estão definidas apenas no **ambiente de desenvolvimento**. geralmente são variaveis **importantes** para o funcionamento do sistema, e que não podem ser disponibilizadas de qualquer forma.

### 🔧 Como usa-lás no django

Para usarmos variaveis de ambiente em projetos **Django**, precisamos realizar algumas etapas:

1. faça a instalação da lib **python-dotenv**;
2. crie um arquivo chamado **.env**, onde terá todas as variaveis de ambiente do seu projeto;
3. Faça a importação do modulo **load_dotenv** da lib **dotenv**;
4. Ative a leitura do arquivo **.env** usando o metodo **load_dotenv()**;
5. Resgate o valor da variavel de ambiente com o método **os.getenv('<nome_da_variavel_de_ambiente>')**

Sabendo disso, faça o processo para a variavel `SECRET_KEY` que se encontra no arquivo `settings.py` no diretorio principal do seu projeto.

## [4/7] 🛠️ Criando uma Aplicação

Para criar uma aplicação, entre dentro da pasta onde terá o arquivo chamado `manage.py`. nela use o seguinte comando para criar um app:
```bash
$ python manage.py startapp [nome_do_app]
```

você precisará colocar os apps criados no arquivo de configuração do seu projeto `nome_do_projeto/settings.py`. nesse arquivo na parte `INSTALLED_APPS` e colocar da seguinte maneira:

```python
INSTALLED_APPS = [
  '[nome_do_app].apps.[Nome_do_app]Config',
  '[nome_do_app1].apps.[Nome_do_app1]Config',
  '[nome_do_app2].apps.[Nome_do_app2]Config',
  ...
]
```

apos colocar todos os apps criados no arquivo de configuração do seu projeto, nos podemos rodar o comando:

```bash
$ python manage.py migrate
```

este comando criará todas as tabelas necessárias para seu projeto no seu banco de dados.

## [5/7] 🔗 Ajustando as configurações de url

Em cada app criado, você terá que criar um novo arquivo chamado `urls.py`. nele você terá que colocar as urls do determinado app. um exemplo do arquivo `polls/urls.py`:

```python
from django.urls import path

app_name = "polls"
urlpatterns = [
  path("", <view>, name="[nome_do_url]"),
]
```

no diretorio de seu projeto, no arquivo `urls.py`, importe o metodo **include** e coloque no path. veja um exemplo com o app polls:

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('polls/', include('polls.urls')),
]
```

**trocando a url raiz**: para trocar a url raiz use a **RedirectView** de uma generic view no arquivo `urls.py` do seu projeto. exemplo

```python 
from django.views.generic import RedirectView

urlpatterns = [
  path('', RedirectView.as_view(url='catalog/')),
]
```

## [6/7] 🚫 Criando o .gitignore

Outra boa prática de desenvolvimento é criar um arquivo **.gitignore** para evitar está enviando coisas inapropriadas para o seu repositorio remoto no github. no nosso caso, usamos a ferramenta online [gitignore.io](https://www.toptal.com/developers/gitignore) para está criando um `template` base para o nosso projeto em **django**.

**⚠️ OBS**: Uma boa prática quando se esta em um time de desenvolvimento é não enviar os arquivos de migrações para o github. vamos ver como fazer isso.

como o modelo de arquivo de migração do django possui o seguite formato: **xxxx_** podemos ignora-ló usando a seguinte expressão no arquivo `.gitignore`:

```.gitignore
[0-9][0-9][0-9][0-9]_*
```

## [7/7] ⏰ Ajustando o horario e a linguagem

No arquivo `settings.py` do diretorio principal do seu projeto altere as seguintes variaveis para ajustar a linguagem e o horario para os correspondentes do BRASIL:

```python
LANGUAGE_CODE = 'pt-br'
TIME_ZONE = 'America/Sao_Paulo'
```

