#!/bin/bash

BW_EMAIL=" "
BW_PASSWORD=" "
FOLDER_ID=" "


session=$(echo "$BW_PASSWORD" | bw login "$BW_EMAIL" --raw)
export BW_SESSION="$session"

json=$(bw get template item --session "$BW_SESSION")

notesContent=""
if [[ -f .env ]]; then
    while IFS= read -r line; do
        [[ -z "$line" || "$line" == \#* ]] && continue
        notesContent+="$line"
        
        if [[ $line == projetoName=* ]]; then
            projetoName=${line#projetoName=}
            projetoName=$(echo "$projetoName" | xargs)
        fi
    done < .env
else
    echo " Cria ai o .env bagual'."
fi

json=$(echo "$json" | jq --arg senha "$BW_PASSWORD" --arg projetoName "$projetoName" --arg notesContent "$notesContent" --arg folderId "$FOLDER_ID" '
  .type = 2 | 
  .secureNote = { type: 0 } | 
  .notes = $notesContent | 
  .name = $projetoName | 
  .folderId = $folderId |
  .fields += [{ "name": "senha", "value": $senha, "type": 1 }]
')

jsonEncoded=$(echo "$json" | bw encode)

bw create item "$jsonEncoded" --session "$BW_SESSION"
bw logout --session "$BW_SESSION"
