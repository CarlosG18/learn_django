# check-list para inicia um projeto em django

> check-list para criar um projeto em django

- ao iniciar um projeto use o seguinte comando:
```bash
$ django-admin startproject [nome_do_projeto]
```

- para criar uma aplicação, entre dentro da pasta do projeto criada anteriormente `cd [nome_do_projeto]`. nela use o seguinte comando para criar um app:
```bash
$ python manage.py startapp [nome_do_app]
```

- você precisará colocar os apps criados no arquivo de configuração do seu projeto `nome_do_projeto/settings.py`. nesse arquivo na parte `INSTALLED_APPS` e colocar da seguinte maneira:

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

## ajustando as configurações de url

Em cada app criado, você terá que criar um novo arquivo chamado `urls.py`. nele você terá que colocar as urls do determinado app. um exemplo do arquivo `polls/urls.py`:

```python
from django.urls import path

app_name = "polls"
urlpatterns = [
  path("", <view>, name="[nome_do_url]"),
]
```

no diretorio de seu projeto, no arquivo `urls.py`, importe o metodo include e coloque no path. veja um exemplo com o app polls:

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('polls/', include('polls.urls')),
]
```

- o arquivo `__init__.py` geralmente em branco é usado para tratar um diretório como um pacote.

- no arquivo de configuração de seu projeto `settings.py` existe o `DEBUG`. é recomendado que na produção essa variável seja atribuida como *false*, pois ela em *true* facilita na depuração, porém da brechas a invasões. portanto, durante  desenvolvimento dos códigos ela pode esta ativa.

**trocando a url raiz**: para trocar a url raiz use a RedirectView de uma generic view no arquivo `urls.py` do seu projeto. exemplo

```python 
from django.views.generic import RedirectView

urlpatterns = [
  path('', RedirectView.as_view(url='catalog/')),
]
```