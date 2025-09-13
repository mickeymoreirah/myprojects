
# App de Ressuprimento

## Visão Geral
Este projeto é um aplicativo web desenvolvido por em google apps script(ou GAps) para facilitar a movimentação de produtos no estoque. Ele permite que colaboradores registrem o status das posições do estoque (como finalizado, vazio,parcial,etc..) enquanto atualiza uma planilha do sheets em tempo real. O objetivo é otimizar o processo de ressuprimento/armazenagem, garantindo que o setor de picking tenha acesso a informaçoes atualizadas para coletar produtos com eficiência,a escolha do appscript para criação é devido a não liberação do uso de python para quem não é da equipe t.i,oque exige tempo e alguma burocracia, entretanto o appscript mostrou-se formidável na execução desse e de outros projetos envolvendo planilhas.
A idéia original veio após erros envolvendo falta de atualização de folhas,não preenchimento de posições/posições já validadas anteriormente entre outros.
créditos e agradecimentos a minha supervisora flávia por me apoiar e fornecer idéias para os projetos quando encontro um bloqueio.

## Funcionalidades
- Seleção de ala e prioridade: Após abrir o web app no coletor,o usuário seleciona uma ala (nesse caso de 70 a 85,mas pode ser alteardo conforme necessário) e uma prioridade  para visualizar posições de estoque pendentes.
- atualização em tempo real da planilha: Os status das posições são atualizados diretamente na planilha, refletindo mudanças imediatamente.
- Registro do colaborador que movimentou ou desceu a posição: A matrícula do colaborador é registrada na planilha.
- Interface simples: o formulário web é intuitivo: ele exibe as posições ainda pendentes,oque permite que a mesma posição não seja visitada de novo.

## Conformidade com a LGPD
Para proteger dados sensíveis e garantir conformidade com a Lei Geral de Proteção de Dados (LGPD), os nomes das colunas na planilha, as matrículas e nomes dos colaboradores foram alterados. Dados reais foram substituídos por valores fictícios para evitar a exposição de informações pessoais ou corporativas. Este projeto foi preparado para ser compartilhado publicamente, respeitando as diretrizes de privacidade.

## Estrutura do Projeto
- `Index.html`: Contém o frontend do aplicativo, com um formulário para inserir a base de matrículas, selecionar ala e prioridade, e uma lista para exibir posições pendentes com botões para atualização dos status.
- `Code.gs`: Contém a lógica do backend do GApS.

## Como Usar
1. Configurar o GApS:
   - Crie um novo projeto no APPSCRIPT a partir de uma planilha
   - Copie e cole o conteúdo de `Index.html` e `Code.gs` nos respectivos arquivos.
   - Configure uma planilha do google com uma aba de nome "Ressupppicking",se o nome for diferente,alterações devem ser feitas na linha 30 e 46 do arquivo .gs e as colunas:
     - Coluna A: Posição
     - Coluna B: Ala (na planilha original,essa coluna possui uma formula de ext.text com a coluna de posição,fazendo com que uma posição,por ex:x100101,x100102;se torne uma rua ou ala: ALA 001(ajustar se necessario))
     - Coluna C: ID do Produto
     - Coluna D: Quantidade
     - Coluna E: Prioridade (formato "URGENTE 0", "URGENTE 1" ou "URGENTE 2")
     - Coluna F: Status (inicialmente vazio para posições pendentes)
     - Coluna G: Colaborador
2. Implantar:
   - No GApS, clique em Implantar>Nova implantação>Aplicativo da web.
   - Configure como a execução funciona e quem pode executar..
   - Copie o URL do aplicativo para acessar a interface.
3. Usar o App:
   - Insira uma matrícula
   - Selecione uma ala e uma prioridade.
   - Clique em "Iniciar" para ver as posições pendentes.
   - Clique nos botões de status para atualizar a planilha em tempo real.

## Licença
Este projeto é fornecido como exemplo e pode e deve ser adaptado conforme necessário. Não inclui nenhuma licença específica, mas é bom sempre revisar as políticas de uso do google apps script e garantir conformidade com a LGPD para implementações reais.

