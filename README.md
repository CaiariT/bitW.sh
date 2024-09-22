# bitW.sh
Destinado a salvar as variaveis de ambiente nas notas seguras do bitwarden


## USO

Basicamente ao subir um projeto para o github, se você tiver o arquivo bitW.sh no projeto, você precisa ter uma conta no bitwarden, executando ./bitW.sh no terminal as informações do seu .env vão para nota segura.





## Instalação 

Se voce quiser usarvai precisar instalar duas ferramentas 

jq para manipulação de JSON
```bash
    choco install jq.
```
[Sobre JQ json](https://jqlang.github.io/jq/download/)

E tambem a necessidade de usar o CLI do bitwarden 
```bash
    choco install bitwarden-cli

    npm install -g @bitwarden/cli
``` 
[Sobre bitwarden CLI](https://bitwarden.com/download/#downloads-command-line-interface)



## Variáveis de Ambiente

Para rodar esse projeto, você vai precisar adicionar as seguintes variáveis de ambiente no seu arquivo .sh

`BW_EMAIL=" "`

`BW_PASSWORD=" "`

`FOLDER_ID=" "`

No caso é adicionado o id de uma pasta que sera inserido as notas seguras.
