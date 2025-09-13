function doGet(e) {
  return HtmlService.createHtmlOutputFromFile('Index').setTitle('App de Ressuprimento');
} # O nome das colunas, bem como matrículas e nomes de colaboradores, foram alterados para proteger dados sensíveis 
e garantir conformidade com a Lei Geral de Proteção de Dados (LGPD)#
// mapa de matrícula para nomes (adicionar mais conforme necessário)
var matriculaToNome = {
  '58110101': 'Lucas Almeida Costa',
  '58110102': 'Mariana Silva Pereira',
  '58110103': 'Rafael Santos Oliveira',
  '58110104': 'Camila Ferreira Lima',
  '58110105': 'Gabriel Souza Mendes',
  '58110106': 'Ana Clara Ribeiro Santos',
  '58110107': 'Pedro Costa Almeida',
  '58110108': 'Juliana Oliveira Ferreira',
  '58110109': 'Felipe Lima Barbosa',
  '58110110': 'Laura Mendes Silva',
  '58110111': 'Thiago Pereira Costa',
  '58110112': 'Beatriz Almeida Ribeiro',
  '58110113': 'Vinicius Santos Lima',
  '58110114': 'Isabela Ferreira Mendes',
  '58110115': 'Matheus Oliveira Souza',
  '58110116': 'Sofia Costa Pereira',
  '58110117': 'Daniel Lima Almeida',
  '58110118': 'Clara Ribeiro Santos',
  '58110119': 'Bruno Mendes Ferreira',
  '58110120': 'Lívia Silva Oliveira'
};

function atualizarStatus(linha, novoStatus, matricula) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('Ressupppicking');
  linha = parseInt(linha);
  if (isNaN(linha) || linha < 1) {
    Logger.log('Erro: Linha inválida: ' + linha);
    throw new Error('Linha inválida: ' + linha);
  }
  
  // Obtém o nome do colaborador ou usa a matrícula se o nome não estiver na base ainda
  var colaborador = matriculaToNome[matricula] || matricula;
  
  // Força como texto usando as aspas para evitar formatação para numero
  sheet.getRange(linha + 1, 6).setValue(novoStatus); // Coluna F (status)
  sheet.getRange(linha + 1, 7).setValue("'" + colaborador); // Coluna G (colaborador,formatado como texto)
}

function getPosicoesFiltradas(ala, prioridade) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheetByName('Ressupppicking');
  var data = sheet.getDataRange().getValues();
  var posicoes = [];

  for (var i = 1; i < data.length; i++) {
    var alaAtual = data[i][1]; // para caso de alterações, a variavelde data.lenght começa em 0,sendo 0:coluna A,1:coluna B etc...
    var status = data[i][5]; // Coluna F
    var prioAtual = data[i][4].toString().toUpperCase(); // Coluna E
    if (status === '' && alaAtual == ala && prioAtual.includes('URGENTE ' + prioridade)) {
      posicoes.push({
        linha: i,
        posicao: data[i][0], // Coluna A
        idProduto: data[i][2], // Coluna C
        quantidade: data[i][3] // Coluna D
      });
    }
  }

  posicoes.sort(function(a, b) {
    return a.posicao.localeCompare(b.posicao);
  });

  Logger.log('Posições retornadas: ' + JSON.stringify(posicoes));
  return posicoes;
}