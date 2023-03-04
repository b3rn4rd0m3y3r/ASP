<%
NCampos = 10
Provedor = "Provider=Microsoft.Jet.OLEDB.4.0;"
DataSource = "Data Source=C:\inetpub\wwwroot\visitas\MTC_Atleta.mdb;"
Mode = "Mode=Share Deny None;"
CONN_STRING = Provedor & DataSource & Mode
FLAG_Adiciona = "S"
FLAG_Apaga = "S"
FLAG_Edita = "N"
FLAG_Pesquisa = "S"
'*
'* Campos para envio de Email
'*
I_PARA = 3
I_NOME = 2
I_RAMAL = 4
Banner = ""
NomeTabela = "VisitasEstacoes"
Titulo = "&nbsp;&nbsp;&nbsp; "
Tit_Esq = "Visitas"
Tit_Dir = "Estações"
'*
'* Mensagens
'*
MSG_ADD = "<H1>INCLUSÃO</H1><P>Registro incluído.</P><P></P><P>Obrigado. Fim da operação.</P>"
MSG_EDIT = "<P>Registro alterado.<BR>Obrigado. Fim da operação.</P>"
MSG_DELE = "<P>Registro apagado.<BR>Obrigado. Fim da operação.</P>"
ADOCON = "ADODB.Connection"
ADOREC = "ADODB.Recordset"
if VarType(Arr) = 1 then
	Dim Arr()
end if
if VarType(Posicao) = 1 then
	Dim Posicao()
end if
if VarType(PosCont) = 1 then
	Dim PosCont()
end if
if VarType(Conteudo) = 1 then
	Dim Conteudo()
end if
ReDim Arr(NCampos,9)
ReDim Conteudo(NCampos)
ReDim Posicao(NCampos,2)
ReDim PosCont(NCampos,2)
Esq = 0
Top = 1
Arr(0,0) = "Id" : Arr(0,1) = "Id" : Arr(0,2) = "6" : Arr(0,3) = "6" : Arr(0,4) = ""
Arr(1,0) = "TpPedido" : Arr(1,1) = "Tipo de Pedido" : Arr(1,2) = "20" : Arr(1,3) = "20" : Arr(1,4) = "'":Arr(1,5) = "S"
Arr(1,6) = "<SELECT id=TpPedido name=TpPedido>"
Arr(1,6) = Arr(1,6) + "<Option value=""Grupo"">Grupo</Option>"
Arr(1,6) = Arr(1,6) + "<Option value=""Individual"">Individual</Option>"
Arr(1,6) = Arr(1,6) + "</SELECT>":Arr(1,9) = "1"
Arr(2,0) = "Nome" : Arr(2,1) = "Nome" : Arr(2,2) = "50" : Arr(2,3) = "50" : Arr(2,4) = "'":Arr(2,9) = "1"
Arr(3,0) = "Email" : Arr(3,1) = "Email" : Arr(3,2) = "50" : Arr(3,3) = "50" : Arr(3,4) = "'":Arr(3,5) = "S":Arr(3,7) = "Obrigatório":Arr(3,9) = "1"
Arr(4,0) = "Telefone" : Arr(4,1) = "Telefone" : Arr(4,2) = "10" : Arr(4,3) = "10" : Arr(4,4) = "'":Arr(4,5) = "S":Arr(4,7) = "Obrigatório":Arr(4,9) = "1"
Arr(5,0) = "LocalVisita" : Arr(5,1) = "Local da Visita" : Arr(5,2) = "50" : Arr(5,3) = "50" : Arr(5,4) = "'":Arr(5,5) = "S"
Arr(5,6) = "<SELECT id=LocalVisita name=LocalVisita>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""aguinaldo.costa"" data-email2=""visita.morroredondo"" data-email3=""josiene.perdigao"" value=""ETA Morro Redondo"">ETA Morro Redondo</Option>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""leandro.moura"" data-email2=""visita.etaf"" data-email3=""bruno.almeida"" value=""ETAF Pampulha"">ETAF Pampulha</Option>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""jesse.rodrigues"" data-email2=""visita.eteonca"" data-email3=""olendino.moraes"" value=""ETE Onça"">ETE Onça</Option>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""antonio.padua"" data-email2=""visita.etevespasiano"" data-email3=""evandro.amorim"" value=""ETE Vespasiano"">ETE Vespasiano</Option>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""fernando.jardim"" data-email2=""visita.laboratoriocentral"" data-email3=""cristina.santos"" value=""Laboratório Central"">Laboratório Central</Option>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""andre.costa"" data-email2=""visita.ceambarreiro"" data-email3=""tereza.bernardes"" value=""CEAM Barreiro"">CEAM Barreiro</Option>"
Arr(5,6) = Arr(5,6) + "<Option data-email1=""bernardo.meyer"" data-email2=""publicidade"" data-email3=""solange.costa"" value=""Teste"">Teste de Script</Option>"
Arr(5,6) = Arr(5,6) + "</SELECT>":Arr(5,9) = "1"

Arr(6,0) = "Mensagem" : Arr(6,1) = "Mensagem" : Arr(6,2) = "50" : Arr(6,3) = "250" : Arr(6,4) = "'": Arr(6,6) = "TEXTAREA":Arr(6,9) = "1"
Arr(7,0) = "Email1" : Arr(7,1) = "Email 1" : Arr(7,2) = "50" : Arr(7,3) = "50" : Arr(7,4) = "'":Arr(7,5) = "N":Arr(7,9) = "2"
Arr(8,0) = "Email2" : Arr(8,1) = "Email 2" : Arr(8,2) = "50" : Arr(8,3) = "50" : Arr(8,4) = "'":Arr(8,5) = "N":Arr(8,9) = "2"
Arr(9,0) = "Email3" : Arr(9,1) = "Email 3" : Arr(9,2) = "50" : Arr(9,3) = "50" : Arr(9,4) = "'":Arr(9,5) = "N":Arr(9,9) = "2"

%>
