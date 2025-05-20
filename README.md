# Robot Framework - Testes de API com Restful-Booker
Testes automatizados desenvolvida com o **Robot Framework** e a **RequestsLibrary**, voltada para testar os endpoints da API pública [Restful-Booker](https://restful-booker.herokuapp.com/). O objetivo é validar funcionalidades de um sistema de reservas de hotel, utilizando uma abordagem modular, legível e eficaz para testes de APIs REST.
As automações cobrem cenários completos como autenticação, criação, atualização e busca de reservas, incluindo verificações de respostas esperadas.

## Tecnologias Utilizadas
- Python 3.8+
- Robot Framework
- RequestsLibrary

## Instalação
Necessário Python instalado em sua máquina - execute os comandos abaixo:
pip install robotframework
pip install robotframework-requests

## Estrutura do Projeto
- `tests/`: contém os cenários de teste.
- `resources/`: palavras-chave customizadas e variáveis reutilizáveis.
- `output/`: diretório onde são gerados os relatórios de execução.

## Execução dos testes
Para rodar todos os testes e gerar os relatórios de execução, utilize o comando:
robot --outputdir output tests/
Os resultados serão salvos na pasta output, com os arquivos log.html, report.html e output.xml

🧪 Autor
Desenvolvido por Michel Policeno — entusiasta de automação de testes e qualidade de software.
Meu linkedin: https://www.linkedin.com/in/michel-policeno-85a866212/
