#!/bin/bash

cd setup

awk '/# Build paths inside the project like this:/{print "from dotenv import load_dotenv\nimport os\n\nload_dotenv()"}1' settings.py > arquivo_temporario && mv arquivo_temporario settings.py

awk '/# SECURITY WARNING: don'\''t run with debug turned on in production!/{print "SECRET_KEY = os.getenv('\''SECRET_KEY'\'')"}1' settings.py > arquivo_temporario && mv arquivo_temporario settings.py

awk '/True,/{print "        '\''DIRS'\'': [os.path.join(BASE_DIR, '\''core/templates'\'')],"}1' settings.py > arquivo_temporario && mv arquivo_temporario settings.py

awk '/USE_I18N = True/{print "LANGUAGE_CODE = '\''pt-br'\''\n\nTIME_ZONE = '\''America/Sao_Paulo'\''"}1' settings.py > arquivo_temporario && mv arquivo_temporario settings.py

awk '/# Default primary key field type/{print "STATIC_ROOT = os.path.join(BASE_DIR, '\''static'\'')\nSTATICFILES_DIRS = [os.path.join(BASE_DIR, '\''core/static'\'')]\n\nMEDIA_URL = '\''/media/'\''\nMEDIA_ROOT = os.path.join(BASE_DIR, '\''core/static/img/'\'')\n\n"}1' settings.py > arquivo_temporario && mv arquivo_temporario settings.py

awk 'NR != 62' settings.py > novo_arquivo.txt && mv novo_arquivo.txt settings.py

awk 'NR != 111' settings.py > novo_arquivo.txt && mv novo_arquivo.txt settings.py

awk 'NR != 112' settings.py > novo_arquivo.txt && mv novo_arquivo.txt settings.py

echo "# configurações de envio de email
#EMAIL_BACKEND = str(os.getenv('EMAIL_BACKEND'))
#EMAIL_HOST = str(os.getenv('EMAIL_HOST'))
#EMAIL_USE_TLS = os.getenv('EMAIL_USE_TLS')
#EMAIL_PORT = os.getenv('EMAIL_PORT')
#EMAIL_HOST_USER = str(os.getenv('EMAIL_HOST_USER'))
#EMAIL_HOST_PASSWORD = str(os.getenv('EMAIL_HOST_PASSWORD'))" >> settings.py

#ajustando o urls.py
echo "urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)" >> urls.py

awk '/urlpatterns =/{print "from django.conf.urls.static import static\nfrom django.urls import path, include\nfrom django.conf import settings\n\n"}1' urls.py > arquivo_temporario && mv arquivo_temporario urls.py

awk 'NR != 18' urls.py > novo_arquivo.txt && mv novo_arquivo.txt urls.py

awk 'NR != 18' urls.py > novo_arquivo.txt && mv novo_arquivo.txt urls.py

cd ..