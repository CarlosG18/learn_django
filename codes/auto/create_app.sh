#!/bin/bash

#criando um app em django
python3 manage.py startapp $1
mv $1 ./apps
cd apps/$1
touch urls.py

echo "from django.urls import path
from . import views

app_name = '$1'
urlpatterns = [
    
]" > urls.py

awk 'NR != 6' apps.py > novo_arquivo.txt && mv novo_arquivo.txt apps.py

echo "    name = 'apps.$1'" >> apps.py

cd ../../setup

awk '/urlpatterns/{print "from django.urls import path, include\n"}1' urls.py > arquivo_temporario && mv arquivo_temporario urls.py

awk '/]/{print "    path('\'''\'', include('\''apps.'$1'.urls'\'')),"}1' urls.py > arquivo_temporario && mv arquivo_temporario urls.py

awk 'NR != 26' urls.py > novo_arquivo.txt && mv novo_arquivo.txt urls.py

awk 'NR != 26' urls.py > novo_arquivo.txt && mv novo_arquivo.txt urls.py

awk '/django.contrib.staticfiles/{print "    '\''apps.'$1'.apps.'$2'Config'\'',"}1' settings.py > arquivo_temporario && mv arquivo_temporario settings.py

echo "APP $1 CRIADO E CONFIGURADO COM SUCESSO!"
