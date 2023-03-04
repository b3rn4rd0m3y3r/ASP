<!DOCTYPE Html>
<HEAD>
<meta charset="iso-8859-1">
<meta http-equiv="x-ua-compatible" content="IE=10">
<!-- LINK rel=stylesheet href="modelo.css" -->
<!-- LINK rel=stylesheet href="complemento.css" -->
<LINK rel=stylesheet href="Envasadora.css">
<LINK rel=stylesheet href="jdpicker.css">
<STYLE>
	A {font-family: Arial Narrow,Arial; text-decoration:none; font-size:12;}
	B.gt {font-size: 140%;font-weight:bold;}
	BODY {
		color: #004D91;
		font-family: Arial;
		font-size: 14px;
		background: url('_Topos/CampPopTeatro2023.png');
		background-size:1200px;
		background-position: center top;
		background-repeat: no-repeat;
		}
	DIV.label {width:150px;font-size: 100%;}
	DIV.label::first-letter {font-size: 140%;}
	FORM {
		margin-top: 300px;
		/*
		background: -moz-linear-gradient(-45deg,  lightsteelblue 0%, aliceblue 50%, antiquewhite 63%, white 100%);
		background: -webkit-gradient(linear, left top, right bottom, color-stop(0%,lightsteelblue), color-stop(50%,aliceblue), color-stop(63%,antiquewhite), color-stop(100%,white));
		background: -webkit-linear-gradient(-45deg,  lightsteelblue 0%,aliceblue 50%,antiquewhite 63%,white 100%); 
		background: -o-linear-gradient(-45deg,  lightsteelblue 0%,aliceblue 50%,antiquewhite 63%,#7db9e8 100%); 
		background: -ms-linear-gradient(-45deg,  lightsteelblue 0%,aliceblue 50%,antiquewhite 63%,white 100%);
		background: linear-gradient(135deg,  lightsteelblue 0%,aliceblue 50%,antiquewhite 63%,white 100%);
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='lightsteelblue', endColorstr='white',GradientType=1 ); 
		*/
		}
	H1 { 
		color: #004D91;
		font-size: 36px;
		
		/*
		-webkit-animation: defont 18s; 
		-moz-animation:     defont 18s;
		-o-animation:          defont 18s; 
		animation:               defont 18s infinite; 
		*/
		}
	H1 SPAN {		
		background: white;
		border: solid 1px green;
		}
	H1 > B {font-size: 40px;}
	H2 { font-family: Arial Narrow,Verdana;background-color: transparent;padding:5;width:100%;border-style:none none solid none;color: #004D78;font-size: 16px;font-weight: bold;}
	H3 { font-family: Arial Narrow,Verdana; }
	INPUT[type="text"] {
		border-style: solid;
		border-width: 1px;
		border-color: #004D91 lightskyblue lightskyblue #004D91 ;
		}
	INPUT.obrig[type="text"] {
		background: ;
		}
	INPUT.button {			 
		height: 30px; 
		width: 80px;
		background: aliceblue; /* For browsers that do not support gradients */
		background: -webkit-linear-gradient(#004D91, aliceblue); /* For Safari 5.1 to 6.0 */
		background: -o-linear-gradient(#004D91, aliceblue); /* For Opera 11.1 to 12.0 */
		background: -moz-linear-gradient(#004D91, aliceblue); /* For Firefox 3.6 to 15 */
		background: linear-gradient(#004D91, aliceblue); /* Standard syntax */
		-moz-border-radius: 20px 20px 20px 20px; 
		-webkit-border-radius: 20px 20px 20px 20px; 
		border-radius: 20px 20px 20px 20px;
		border-style: solid;
		border-width: 2px;
		border-color: antiquewhite yellow lightgrey gray;
		color: black;
		font-weight: bold;
		padding: 3px;
		text-decoration: none;
		}
	INPUT.btnLink {cursor:pointer;background-color:transparent;border-style:solid none solid none;border-width: 1;border-color: black; color:black;}
	INPUT.espec {cursor:pointer;background-color:crimson;border-style:solid dotted solid dotted;border-width: 1;border-color: black;  color: yellow; font: 14px Arial; font-weight:bold;}
	INPUT.exec {background-color: #004D91; color: white;font-weight:bold;letter-spacing: 0.2em;}
	
	TD.fId {background-color: royalblue; color: white;}
	TD.fDtInfo {background-color: lightsalmon; color: black;}
	TD.fDtDistrib {background-color: goldenrod; color: midnightblue;}
	TD.inc {border-right-style: solid;border-right-color:lightgrey;border-right-width: 1;}
	TH.mao {cursor:pointer;}
	.cinza {background-color: lightgrey;}
	.grad {
		/*
		background: aliceblue;
		background: -webkit-linear-gradient(#004D91, aliceblue);
		background: -o-linear-gradient(#004D91, aliceblue); 
		background: -moz-linear-gradient(#004D91, aliceblue);
		background: linear-gradient(#004D91, aliceblue);
		*/
		}
	/* Códigos da animação */
	@-webkit-keyframes example {
		from {color: lightgrey;}
		to {color: #004D91;}
		}
	@-moz-keyframes example {
		from {color: lightgrey;}
		to {color: #004D91;}
		}
	@-o-keyframes example {
		from {color: lightgrey;}
		to {color: #004D91;}
		}
	@keyframes example {
		from {color: lightgrey;}
		to {color: #004D91;}
		}
	/* Segunda animação */
	@-webkit-keyframes dois {
		from {color:#004D91;}
		to {color: lightgrey ;}
		}
	@-moz-keyframes dois {
		from {color:#004D91;}
		to {color: lightgrey ;}
		}
	@-o-keyframes dois {
		from {color:#004D91;}
		to {color: lightgrey ;}
		}
	@keyframes dois {
		from {color:#004D91;}
		to {color: lightgrey ;}
		}
	/* Terceira Animação */
	@keyframes degrau {
		0%   {color: lightgrey;}
		15%  {color: gray;}
		30%  {color: lightsteelblue;}
		40%  {color: steelblue;}
		50% {color: #004D91; }
		60%  {color: steelblue;}
		70%  {color: lightsteelblue;}
		85%  {color: gray;}
		}
	/* Quarta Animação */
	@keyframes defont {
		0%   {color: #00AD91;}
		5%   {}
		10%  {color: #008D91;}
		15%   {}
		20%  {color: #007D91;}
		25%   {}
		30%  {color: #006D91;}
		35%   {}
		40%  {color: #005D91;}
		45%   {}
		50% {color: #004D91;}
		55%   {}
		60%  {color: #005D91;}
		65%   {}
		70%  {color: #006D91;}
		75%   {}
		80%  {color: #007D91;}
		85%   {}
		90%  {color: #008D91;}
		95%  {}
		}
	#loadFig {margion: 0px; padding: 0px;}
</STYLE>
<SCRIPT type="text/javascript" src="jquery-1.8.3.js"></script>
<SCRIPT type="text/javascript" src="jquery.tablesorter.js"></script>
<SCRIPT type="text/javascript" src="jquery.jdpicker.js"></script>
<SCRIPT type="text/javascript">
function init() { 
        $('TABLE[id=Resultset]').tablesorter(  ); 

    } 
function manda(){
	re = /[ 0-9a-zA-ZçÇ\Á\Ã\Â\Ê\É\Ô\Ó\Õ\Í\ã\õ\á\é\í\ó\ú\ô\!\@\#\$\%\&\*\(\)\-\+\{\[\}\]\/\?\:\<\>\,\.]/gi;
	var Ass = document.getElementById("Mensagem");
	mensagem = Ass.value;
	var m = new Array();
	m = mensagem.match(re);
	alert(m);
	var s = "";
	/*
		Colocar aqui o loop das variáveis de aplicação: QD_responsavel_prio<n>_<i> = <demanda>_<status>
	*/
	for(i=0;i<m.length;i++){
		if(m[i] != "," ){
			s = s + m[i];
		} else {
			s = s + "&#44;";
			}
		}

	Ass.value = s;
	// Email escolhido
	var Local = document.getElementById("LocalVisita");
	var emails = Local.selectedOptions[0].dataset;
	var oEmail1 = document.getElementById("Email1");
	var oEmail2 = document.getElementById("Email2");
	var oEmail3 = document.getElementById("Email3");
	oEmail1.value = emails.email1+"@copasa.com.br";
	oEmail2.value = emails.email2+"@copasa.com.br";
	oEmail3.value = emails.email3+"@copasa.com.br";
	return true;
	}
</script>
</HEAD>
<BODY OnLoad="init();"><!-- #Include file="FuncoesData.inc" --><%'*'* SCRIPT: Marcação de visitas às estações da Copasa'* Data....: 18/01/2023'*
'* Funções
'*
CODE_STATUS_USR = Request("CodUsr")
'*
'* TÍTULO DO SORTEIO
'*
TituloSorteio = "[Visita] Estacoes Tratamento"
function mandEmail(mPara, mDtCad, mNome, mRamal, mOficina)
	Response.write "<br>" & mPara & "<br>"
	Set Mail = Server.CreateObject("Persits.MailSender") 
	Mail.Host = "10.1.13.149" ' Specify a valid SMTP server
	Mail.AddAddress mPara
	'Mail.Username = "12841@copasa.com.br"
	'Mail.Password = "xxxxxxx"
	Mail.From = "publicidade@copasa.com.br" ' Specify senders address
	Mail.FromName = "Imprensa" ' Specify sender's name
	'Mail.TLS = false
	'Mail.Port = 25
	' Name is optional
	Mail.AddReplyTo "imprensa@copasa.com.br"
	'Mail.AddAttachment "\\10.1.13.101\publico\Informacoes\DVPE\Logomarcas\Logo Copasa Preta.jpg"
	Mail.Subject = TituloSorteio
	Mail.Body = TituloSorteio & Chr(13) & Chr(10) & _
	"Confirmamos o seu registro de intenção para a Visita à " & mOficina & Chr(13) & Chr(10) & _
	"Nome: " & mNome  & Chr(13) & Chr(10) & _
	"AGUARDE INSTRUÇÕES PELA INTRANET."

	On Error Resume Next
	Mail.Send
	If Err <> 0 Then
	     Response.Write "Error encountered: " & Err.Description
	End If
	mandEmail = mPara
end function
'*'* Declarações iniciais
'* Comum
'*Dim RwDim SCRIPT_NAMEDim Conn,rsTaskDim strSQL, iRecordIdSession.LCID = 1046

'*
'* Dia Anterior
'*
iAno = Year(date-1)
iMes = Month(date+-1)
iDia = Day(date-1)
Ano = CStr(iAno)
Mes = CStr(iMes)
Dia = CStr(iDia)
Amanha = Dia & "/" & Mes & "/" & Ano
'*
'* Data Corrente
'*
iAno = Year(date)
iMes = Month(date)
iDia = Day(date)
Ano = CStr(iAno)
Mes = CStr(iMes)
Dia = CStr(iDia)
Hoje = Dia & "/" & Mes & "/" & Ano
'*
'* Dia Seguinte
'*
iAno = Year(date+1)
iMes = Month(date+1)
iDia = Day(date+1)
Ano = CStr(iAno)
Mes = CStr(iMes)
Dia = CStr(iDia)
Amanha = Dia & "/" & Mes & "/" & Ano
'*
'* SCRIPT
'*
SCRIPT_NAME = Request.ServerVariables("SCRIPT_NAME")'*
'* Particular desta script
'*
' Testa o IP para fazer a triagem da unidade de produção
IPdoCliente = Request.ServerVariables("REMOTE_ADDR")
ECercadinho = "10.1.30"
EMorredondo = "10.211.5"
ESpca = "10.10.1"

%>          <!--
		NESTE PONTO DEVE-SE TROCAR O NOME DO ARQUIVO DTD
		O ARQUIVO DTD FICA NO CAMINHO:
		
		I:\Inetpub\wwwroot\PortalSpca\Objetos\DTDs
		
		O DRIVE I: ESTÁ MAPEADO PARA:
		
		\\intranet-se01\sitedvpi
		
		
	 -->
	<!-- #Include file="VisitasEstacoes.inc" --><%

if FLAG_Pesquisa = "S" then
	BACK_TO_LIST_TEXT = "<BR><INPUT class=btnLink type=button value=""&laquo;&laquo; VOLTAR"" OnClick=""javascript: history.go(-2)"">"
	BACK_TO_ENTRY = "<BR><INPUT class=btnLink type=button value=""&laquo;&laquo; VOLTAR"" OnClick=""javascript: history.go(-1)"">"
	BACK_TO_POS_EDIT = "<BR><A style=""cursor:pointer;"" noref OnClick=""javascript: history.go(-2)"">&laquo;&laquo; VOLTAR</a>"
else
	BACK_TO_LIST_TEXT = ""
	BACK_TO_ENTRY = ""
	BACK_TO_POS_EDIT = ""
end if
'* '* Estrutura CASE'*Select Case Lcase(Trim(Request.QueryString("action")))'*'* Ação Add
'*     Case "add"	if CODE_STATUS_USR = 1 or CODE_STATUS_USR = 4 then 
		if Banner = "" then
	     %>			<!-- H1 class="grad"><img src="Logocopa.jpg">&nbsp;&nbsp;&nbsp;<span><%= Titulo %>&nbsp;&nbsp;&nbsp;</span></H1> <b>IP:<%= IPdoCliente %></b -->
	     <% else %>
			<IMG src="<%= Banner %>">
	     <% end if %>
	     <center>	     <form action="<%= SCRIPT_NAME %>?action=addSave&CodUsr=<%= CODE_STATUS_USR %>" method="post" onSubmit="return manda();">
	     <table border=0><tr>
		<td>		     <table width=100%>			     <%
			'*
			'* Trava a Aplicação para outro cadastro
			'*
			'* Testa primeiro
			'*
			'for each v in Application.Contents
			'	if Left(v,3) = "UD_" AND Application(v) = "*" then
			'		Response.write("Atualização sendo processada. <A href=""" & SCRIPT_NAME & "?action=add"">Tente novamente</a>")
			'		Response.end
			'	end if
			'next
			'*
			'* LOCK depois
			'*
			App = "UD_" & IPdoCliente
			Application(App) = "*"
			'* Fim LOCK
			For I = 1 to NCampos - 1
				Response.write "<TR><TD><DIV class=label>" & Arr(I,1) & ":" & "</DIV></TD><TD>"
				if Arr(I,6) = "TEXTAREA" then
					Response.write "<TEXTAREA id=" & Arr(I,0) & " name=" & Arr(I,0) & " cols=" & Arr(I,2) & " rows=" & Arr(I,3) / Arr(I,2) + 1 
					if CODE_STATUS_USR < 4 then
						if Arr(I,9) <> CODE_STATUS_USR then
							Response.write " READONLY class=cinza "
						end if
					end if
					Response.write "></TEXTAREA>" '</TD></TR>"
				else
					if Left(Arr(I,6),6) = "<SELEC" then
						'Response.write(Arr(I,6))
						Response.write Left(Arr(I,6), 8)
						if CODE_STATUS_USR < 4 then
							if Arr(I,9) <> CODE_STATUS_USR then
								Response.write " READONLY class=cinza "
							end if
						end if
						Response.write Mid(Arr(I,6), 9,2000)
					else
						'Response.write("<Input type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Arr(I,8) & """>") '</TD></TR>")
						Response.write("<Input ")
						'if Arr(I,4) = "#" then
						'	Response.write(" class=jdpicker ")
						'end if
						if CODE_STATUS_USR < 4 then
							if Arr(I,9) <> CODE_STATUS_USR then
								Response.write " READONLY class=cinza "
							end if
						end if
						if Arr(I,5) = "S" then
							Response.write(" placeholder=""Obrigatório"" ")
						end if
						Response.write(" type=text id=" & Arr(I,0) & " name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Arr(I,8) & """>") '</TD></TR>")
					end if
				end if
				Response.write "&nbsp;&nbsp;<SPAN style=""color:red;"">" & Arr(I,7) & "</SPAN></TD></TR>"
			Next
			%>
			     <TR>
				     <TD colspan=2><input class=exec type=submit value="Grava"></TD>
				</TR>			</table>
			<!-- img src="MarcasHanna.jpg" -->
		 </td>
		 <!-- td valign=top>
		 <% if Banner <> "" then %>
		 <IMG src="<%= Banner %>">
		 <% else %>
		 &nbsp;
		 <% end if %>
		 </td -->    
		</tr>
		</table>
			     </form>		
		<div id="loadFig">
			<!-- img src="../Graficos/Teatro.gif" -->
		</div>
	     </center>     <%
     else
	Response.write "Usuário não autorizado a INCLUIR serviços."
     end if     'Response.Write(BACK_TO_ENTRY)'* Ação AddSave     Case "addsave"
	if Banner = "" then
     %>
		<H1 class="grad"><img src="Logocopa.jpg"><%= Titulo %> (<%= IPdoCliente %>)</H1>
     <% else %>
		<IMG src="<%= Banner %>">
     <% end if     Set conn = Server.CreateObject(ADOCON)
     conn.Open CONN_STRING
     For I = 1 to NCampos - 1
	Conteudo(I) = Request.Form(Arr(I,0))
     Next
	'* Teste de existência
     '* Conexão
     Set rsTask = Server.CreateObject(ADOREC)
     strSQLs = "SELECT Id, Matr FROM " & NomeTabela & " WHERE Matr = '" & Request("Matr") & "' OR Matr = '" & CStr(CDbl(Request("Matr"))*1) & "'"
     'Response.write strSQLs
     'rsTask.Open strSQLs,conn,3,3
     'if not (rsTask.BOF AND rsTask.EOF) then
	'     Response.write("<P align=center><SPAN style=""color:red"">Matrícula já participa.</SPAN></P>") 
	'	rsTask.close
	'     conn.close
	'     Response.Write "<A href=""" & SCRIPT_NAME & "?action=add&CodUsr=" & CODE_STATUS_USR  & """>Volte e tente novamente.</A>"
	'     Response.end
	'     Response.Write(BACK_TO_POS_EDIT )	     
     'end if
      'rsTask.close
	'* Fim Teste
     strSQL = "INSERT INTO " & NomeTabela
     strSQL = strSQL & " (" 
     II = 0
     For I = 1 to NCampos - 1
        if ( Conteudo(I) <> "" ) or ( Arr(I,5) = "S" ) then
	   if II = 0 then
		strSQL = strSQL & " " & Arr(I,0)
	   else
		strSQL = strSQL & ", " & Arr(I,0) 
	   end if
	   II = II + 1
	end if
     Next
     strSQL = strSQL & ", NoIP, DtCad) SELECT "     
     II = 0
     For I = 1 to NCampos - 1
        if  ( Conteudo(I) <> "" ) or ( Arr(I,5) = "S" ) then
	   if II = 0 then
		strSQL = strSQL & " "
	   else
		strSQL = strSQL & ", " 
	   end if
	   if Arr(I,4) = "#" then
		ContData = CDate(Conteudo(I))
		strSQL = strSQL & Arr(I,4) & Month(ContData) & "/" & Day(ContData) & "/" & Year(ContData) & Arr(I,4)
	   else
		strSQL = strSQL & Arr(I,4) & Conteudo(I) & Arr(I,4)
	   end if
	   II = II + 1
	end if
     Next
     strSQL = strSQL & ", '" & IpdoCliente & "',CDate('" & Hoje & "')" 
     Response.write strSQL
     'Response.end
     conn.Execute strSQL, adAffectAll, adCmdText Or adExecuteNoRecords
     conn.close
	'*
	'* Libera LOCK
	'*
	App = "UD_" & IPdoCliente
	Application(App) = ""
	'* Fim Libera LOCK
	'*
	'* Envia email
	'*
	if Conteudo(I_PARA) <> "" then
		varEmail = mandEmail(Conteudo(I_PARA), Hoje, Conteudo(I_NOME), Conteudo(I_RAMAL), Conteudo(5))
		Response.write "<br>" & Conteudo(I_PARA) & "<br>"
		varEmail1 = mandEmail(Conteudo(7), Hoje, Conteudo(I_NOME), Conteudo(I_RAMAL), Conteudo(5))
		varEmail2 = mandEmail(Conteudo(8), Hoje, Conteudo(I_NOME), Conteudo(I_RAMAL), Conteudo(5))
		varEmail3 = mandEmail(Conteudo(9), Hoje, Conteudo(I_NOME), Conteudo(I_RAMAL), Conteudo(5))
	end if
     Response.Write(MSG_ADD)     'Response.Write(BACK_TO_LIST_TEXT )     %>     <%
'* Ação view
	Case "view"
     iRecordId = Request.QueryString("id")
     If IsNumeric(iRecordId) Then
        iRecordId = CLng(iRecordId)
     Else
        iRecordId = 0
     End If
     strSQL = "Select * FROM " & NomeTabela & " WHERE Id = " & iRecordId & ";"
     Set conn = Server.CreateObject(ADOCON)
     conn.Open CONN_STRING
	Set rsTask = Server.CreateObject(ADOREC)
	rsTask.Open strSQL,conn,3,3
     ' Carrega conteudos 
     For I = 0 to NCampos - 1
           if not IsNull(rsTask.Fields(Arr(I,0))) then
               Conteudo(I) = rsTask.Fields(Arr(I,0))
            else
               Conteudo(I) = ""
            end if
     Next     

	rsTask.Close
     conn.close
%>
     <H1><%= Titulo %></H1>
     
     <table>
<%
     For I = 0 to NCampos - 1
	if Arr(I,6) = "TEXTAREA" then
		'Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><TEXTAREA  id=" & Arr(I,0) & " name=" & Arr(I,0) & " cols=" & Arr(I,2) & " rows=" & Arr(I,3) / Arr(I,2) + 1 & ">" & Conteudo(I) & "</TEXTAREA>" '</TD></TR>"
		Response.write "<TR><TD><DIV class=label>" & Arr(I,1) & ":" & "</DIV></TD><TD><TEXTAREA  id=" & Arr(I,0) & " name=" & Arr(I,0) & " cols=" & Arr(I,2) & " rows=" & Arr(I,3) / Arr(I,2) + 1 & ">" & Conteudo(I) & "</TEXTAREA>" '</TD></TR>"
	else
		if Left(Arr(I,6),6) = "<SELEC" then
			Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD>"
			TamanhoSel = Len(Arr(I,0)) + 14
			Response.write Left(Arr(I,6),TamanhoSel) & "<Option value=""" & Conteudo(I) & """>" & Conteudo(I) & Mid(Arr(I,6),TamanhoSel+1,1200)
		else
			'Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Conteudo(I) & """" & ">" '</TD></TR>"
			Response.write "<TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input "
			if Arr(I,4) = "#" then
				Response.write(" class=jdpicker ")
			end if
			Response.write " type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Conteudo(I) & """" & ">" '</TD></TR>"
		end if
	end if     
	'Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input type=text name=""" & Arr(I,0) & """ size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Conteudo(I) & """" & "></TD></TR>"
     Next
%>
     </table>

<%'* Ação Edit     Case "edit"     iRecordId = Request.QueryString("id")     If IsNumeric(iRecordId) Then        iRecordId = CLng(iRecordId)     Else        iRecordId = 0     End If     strSQL = "Select * FROM " & NomeTabela & " WHERE Id = " & iRecordId & ";"     Set conn = Server.CreateObject(ADOCON)
     conn.Open CONN_STRING
	Set rsTask = Server.CreateObject(ADOREC)	rsTask.Open strSQL,conn,3,3
     ' Carrega conteudos 
     For I = 0 to NCampos - 1
           if not IsNull(rsTask.Fields(Arr(I,0))) then               Conteudo(I) = rsTask.Fields(Arr(I,0))            else               Conteudo(I) = ""            end if
     Next     
	rsTask.Close
     conn.close%>
     <H1 class="grad"><img src="Logocopa.jpg"><%= Titulo %> (<%= IPdoCliente %>)</H1>
     <form action="<%= SCRIPT_NAME %>?action=editsave&Id=<%= Request("Id") %>&CodUsr=<%= CODE_STATUS_USR %>" method="post"  onSubmit="manda();">
     <table>
<%
     For I = 0 to NCampos - 1
	if Arr(I,6) = "TEXTAREA" then
		Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><TEXTAREA  id=" & Arr(I,0) & " name=" & Arr(I,0) & " cols=" & Arr(I,2) & " rows=" & Arr(I,3) / Arr(I,2) + 1 
		if CODE_STATUS_USR < 4 then
			if Arr(I,9) <> CODE_STATUS_USR then
				Response.write " READONLY class=cinza "
			end if
		end if
		Response.write ">" & Conteudo(I) & "</TEXTAREA>" '</TD></TR>"
	else
		if Left(Arr(I,6),6) = "<SELEC" then
			Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD>"
			TamanhoSel = Len(Arr(I,0)) + 13
			if Modo = "DISABLED" then
				Acresc = " disabled=""disabled"""
			else
				Acresc = ""
			end if
			if CODE_STATUS_USR < 4 then
				if Arr(I,9) <> CODE_STATUS_USR then
					'Response.write " READONLY class=cinza "
					Acresc = " READONLY class=cinza "
				end if
			end if
			Response.write Left(Arr(I,6),TamanhoSel) & Acresc & "><Option value=""" & Conteudo(I) & """>" & Conteudo(I) & Mid(Arr(I,6),TamanhoSel+2,1200)
		else
			'Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Conteudo(I) & """" & ">" '</TD></TR>"
			Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input "
			if Arr(I,4) = "#" then
				Response.write(" class=jdpicker ")
			end if
			if CODE_STATUS_USR < 4 then
				if Arr(I,9) <> CODE_STATUS_USR then
					Response.write " READONLY class=cinza "
				end if
			end if
			Response.write " type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Conteudo(I) & """" & ">" '</TD></TR>"
		end if
	end if     
	'Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input type=text name=""" & Arr(I,0) & """ size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & " value=""" & Conteudo(I) & """" & "></TD></TR>"
     Next
%>     <TR><TD>&nbsp;</TD><TD><input class=exec type=submit value="Grava"></TR>     </table>     </form>     <%     Response.Write(BACK_TO_ENTRY)'* Ação EditSave     Case "editsave"          iRecordId = Request.QueryString("Id")     For I = 1 to NCampos - 1
	Conteudo(I) = Request.Form(Arr(I,0))
     Next
     Set conn = Server.CreateObject(ADOCON)
     conn.Open CONN_STRING
     strSQL = "UPDATE " & NomeTabela & " SET "
      ii = 0 
     For I = 1 to NCampos - 1
        if ( Conteudo(I) <> "" ) or ( Arr(I,5) = "S" ) then
		if ii > 0 then
			strSQL = strSQL & ", "
		end if
		ii = ii + 1
		
		if Arr(I,4) = "#" then
			ContData = CDate(Conteudo(I))
			strSQL = strSQL & Arr(I,0) & " = " & Arr(I,4) & Month(ContData) & "/" & Day(ContData) & "/" & Year(ContData) & Arr(I,4)
		else
			strSQL = strSQL & Arr(I,0) & " = " & Arr(I,4) & Conteudo(I) & Arr(I,4)
		end if
	end if
     Next
     strSQL = strSQL & " WHERE Id = " & iRecordId 
     Response.write strSQL
     conn.Execute strSQL, adAffectAll, adCmdText Or adExecuteNoRecords
     conn.close
	'*
	'* Libera LOCK
	'*
	App = "UD_" & IPdoCliente
	Application(App) = ""
	'* Fim Libera LOCK
     Response.Write(MSG_EDIT)     Response.Write(BACK_TO_POS_EDIT )     %><%'* Ação Dele
     Case "predele"	iRecordId = Request.QueryString("id")	If IsNumeric(iRecordId) Then		iRecordId = CLng(iRecordId)	Else		iRecordId = 0	End If
	%>
	<P>Confirma a deleção do Registro ?&nbsp;<A href="<%= SCRIPT_NAME %>?action=dele&id=<%= Request("Id") %>">Sim</a></p>
	<%
     Response.Write(BACK_TO_LIST_TEXT )	     Case "dele"	iRecordId = Request.QueryString("id")	If IsNumeric(iRecordId) Then		iRecordId = CLng(iRecordId)	Else		iRecordId = 0	End If	Set conn = Server.CreateObject(ADOCON)
        conn.Open CONN_STRING
	strSQL = "Delete * FROM " & NomeTabela & " Where Id = " & iRecordId	conn.Execute strSQL, adAffectAll, adExecuteNoRecords
	conn.close
      Response.Write(MSG_DELE)     Response.Write(BACK_TO_LIST_TEXT )     %>     <%'* Ação List     Case "list"		'* Teste de pesquisa genérica
		if Request("botao") = "Geral" then
			FraseHttp = SCRIPT_NAME & "?action=listcross&TpLancto=" & Request.Form("TpLancto") & "&PIT=" & Request.Form("PIT") & "&Produto=" & Request.Form("Produto") & "&Campanha=" & Request.Form("Campanha") & "&Meio=" & Request.Form("Meio") 
			FraseHttp = FraseHttp & "&Tipo=" & Request.Form("Tipo") & "&AP=" & Request.Form("AP") & "&MesInsercao=" & Request.Form("MesInsercao")& "&Praca=" & Request.Form("Praca")& "&Veiculo=" & Request.Form("Veiculo")
			FraseHttp = FraseHttp & "&Situacao=" & Request.Form("Situacao") & "&PI=" & Request.Form("PI") & "&SAP=" & Request.Form("SAP") & "&FormaPagto=" & Request.Form("FormaPagto")
			Response.redirect FraseHttp
		end if
		  c = 0
		  For I = 0 to NCampos
			if Request("botao") = Arr(I,0) then
				c = I
				Exit for
			end if
		  Next
		  strSQL = "SELECT * FROM " & NomeTabela & " Where "

		  if Arr(c,4) = "#" then
			strSQL = strSQL & Request("botao") & " "
		  else
			strSQL = strSQL & " Ucase(" & Request("botao") & ") "
		  end if
		  Select Case Arr(c,4)
			Case "'"
				strSQL = strSQL & " Like '%"
			Case "#"
				strSQL = strSQL & " >= " 'Tirei #
			Case ""
				strSQL = strSQL & " = "			
		  End Select
		  if Arr(c,4) = "#" then
			ContData = CDate(Request.Form(Request("botao")))
			strSQL = strSQL & "CDate(""" & Day(ContData) & "/" & Month(ContData) & "/" & Year(ContData) & """)"
		  else
			strSQL = strSQL & Request(Request.Form("botao"))
		  end if
		  Select Case Arr(c,4)
			Case "'"
				strSQL = strSQL & "%'"
			Case "#"
				strSQL = strSQL & " AND " & Request("botao") & " <= "  'Tirei # 2 vezes
				ContData = CDate(Request.Form(Request("botao") & "1"))
				strSQL = strSQL & "CDate(""" & Day(ContData) & "/" & Month(ContData) & "/" & Year(ContData) & """)"
		  End Select


	'strSQL = strSQL & " AND IsNull(flagDVRP) = -1 AND IsNull(flagDVRC) = -1 "
	'strSQL = strSQL & " ORDER BY Municipio"
	  Response.write strSQL
	  
         Set conn = Server.CreateObject(ADOCON)
         conn.Open CONN_STRING
	          Set rsTask = Server.CreateObject(ADOREC)         rsTask.Open strSQL,conn,3,3
%>          <H1 class=grad><img src="LogoCopa.jpg"><%= Titulo %></H1>          <table id="Resultset" border=1 cellspacing=0 cellpadding=2>
	<THEAD><TR>
     <%
     For I = 0 to NCampos - 1
	if Arr(I,6) <> "TEXTAREA" then
		Response.write "<TH class=mao>" & Arr(I,1) & "</TH>"
	end if
     Next
     Response.write("<TH class=mao>Edita</TH><TH>Deleta</TH><TH class=mao>Inclui</TH></TR></THEAD><TBODY>")
          SomaProd = 0
	  Do While Not rsTask.EOF
             Response.write("<TR>")
	     For I = 0 to NCampos - 1
	    'For I = 0 to 15
		if Arr(I,6) <> "TEXTAREA" then
			if Arr(I,6) = "Link" then
				Link = rsTask.Fields(Arr(I,0)).Value
				'if IsNull(Link) = -1 OR Link = "" then
				'	Link = "xxxxxxx"
				'end if
				'if Mid(Link, Len(Link)-3, 1) = "." then
					Response.write("<TD class=f" & Arr(I,0) & "  align=left><A href=""" & rsTask.Fields(Arr(I,0)).Value & """>PLANO</A></TD>")
				'else
				'	Response.write("<TD class=f" & Arr(I,0) & "  align=left>&nbsp;</TD>")
				'end if
			else
				if Arr(I,4) = "'" then
					Response.write("<TD class=f" & Arr(I,0) & " align=left>" & rsTask.Fields(Arr(I,0)).Value & "</TD>")
				else
					Response.write("<TD class=f" & Arr(I,0) & " align=right>" & rsTask.Fields(Arr(I,0)).Value & "</TD>")
				end if
			end if
		end if
	     Next
      %>	<TD>
	<% if FLAG_Edita = "S" then %>
	<a href="<%= SCRIPT_NAME %>?action=edit&id=<%= rsTask.Fields("Id").Value %><%= Dummy %>&CodUsr=<%= CODE_STATUS_USR %>">Edita</a>
	<% end if %>
	</TD>
	<TD>
	<% if FLAG_Apaga = "S" then %>
	<a href="<%= SCRIPT_NAME %>?action=dele&id=<%= rsTask.Fields("Id").Value %><%= Dummy %>&CodUsr=<%= CODE_STATUS_USR %>">Deleta</a>
	<% end if %>
	</TD>
	<TD>
	<% if FLAG_Adiciona = "S" then %>
	<a href="<%= SCRIPT_NAME %>?action=add&id=<%= rsTask.Fields("Id").Value %><%= Dummy %>&CodUsr=<%= CODE_STATUS_USR %>">Inclui</a>
	<% end if %></TD>             </TR>          <%             rsTask.MoveNext          Loop
	  rsTask.Close          %>
          </TBODY></table>                    <%          conn.close
	'*
	'* Libera LOCK
	'*
	App = "UD_" & IPdoCliente
	Application(App) = ""
	'* Fim Libera LOCK
	  Response.Write(BACK_TO_ENTRY )
'* Ação List
	Case "listcross"
		'*
		'* Identifica os campos preenchidos
		'*
		c = 0
		strSQL = "SELECT * FROM " & NomeTabela & " Where Id > 0 "
		For I = 0 to NCampos
			if Request(Arr(I,0)) <> "" AND Request(Arr(I,0)) <> "N/A" then
				c = I
				strSQL = strSQL & " AND "
				if Arr(I,4) = "#" then
					strSQL = strSQL & Arr(I,0) & " "
				else
					strSQL = strSQL & " Ucase(" & Arr(I,0) & ") "
				end if
				Select Case Arr(I,4)
					Case "'"
						strSQL = strSQL & " Like '%"
					Case "#"
						strSQL = strSQL & " >= " 'Tirei #
					Case ""
						strSQL = strSQL & " = "			
				End Select
				  if Arr(I,4) = "#" then
					ContData = CDate(Request(Arr(I,0)))
					strSQL = strSQL & "CDate(""" & Day(ContData) & "/" & Month(ContData) & "/" & Year(ContData) & """)"
				  else
					if Arr(I,4) = "'" then
						strSQL = strSQL & UCase(Request(Arr(I,0)))
					else
						strSQL = strSQL & Request(Arr(I,0))
					end if
				  end if
				  Select Case Arr(I,4)
					Case "'"
						strSQL = strSQL & "%'"
					Case "#"
						strSQL = strSQL & " AND " & Arr(I,0) & " <= "  'Tirei # 2 vezes
						ContData = CDate(Request(Arr(I,0) & "1"))
						strSQL = strSQL & "CDate(""" & Day(ContData) & "/" & Month(ContData) & "/" & Year(ContData) & """)"
				  End Select
			end if
		Next
	'strSQL = strSQL & " AND IsNull(flagDVRP) = -1 AND IsNull(flagDVRC) = -1 "
	strSQL = strSQL & " ORDER BY Municipio"
	  Response.write strSQL
         Set conn = Server.CreateObject(ADOCON)
          conn.Open CONN_STRING
         Set rsTask = Server.CreateObject(ADOREC)
         rsTask.Open strSQL,conn,3,3
%>
          <H1><%= Titulo %></H1>
          <table id="Resultset" border=1 cellspacing=0 cellpadding=2>
	<THEAD><TR>
     <%
     For I = 0 to NCampos - 1
	if Arr(I,6) <> "TEXTAREA" then
		Response.write "<TH class=mao>" & Arr(I,1) & "</TH>"
	end if
     Next
     Response.write("<TH class=mao>Edita</TH><TH>Deleta</TH><TH class=mao>Inclui</TH></TR></THEAD><TBODY>")
          SomaProd = 0
	  Do While Not rsTask.EOF
             Response.write("<TR>")
	     For I = 0 to NCampos - 1
		if Arr(I,6) <> "TEXTAREA" then
			if Arr(I,6) = "Link" then
				Link = rsTask.Fields(Arr(I,0)).Value
				'if IsNull(Link) = -1 OR Link = "" then
				'	Link = "xxxxxxx"
				'end if
				'if Mid(Link, Len(Link)-3, 1) = "." then
					Response.write("<TD class=f" & Arr(I,0) & "  align=left><A href=""" & rsTask.Fields(Arr(I,0)).Value & """>PLANO</A></TD>")
				'else
				'	Response.write("<TD class=f" & Arr(I,0) & "  align=left>&nbsp;</TD>")
				'end if
			else
				if Arr(I,4) = "'" then
					Response.write("<TD class=f" & Arr(I,0) & " align=left>" & rsTask.Fields(Arr(I,0)).Value & "</TD>")
				else
					Response.write("<TD class=f" & Arr(I,0) & " align=right>" & rsTask.Fields(Arr(I,0)).Value & "</TD>")
				end if
			end if
		end if
	     Next
      %>
	<TD>
	<% if FLAG_Edita <> "N" then %>
	<a href="<%= SCRIPT_NAME %>?action=edit&id=<%= rsTask.Fields("Id").Value %><%= Dummy %>&DiaConsulta=<%= DiaConsulta %>">Edita</a>
	<% end if %>
	</TD>
	<TD>
	<% if FLAG_Apaga <> "N" then %>
	<a href="<%= SCRIPT_NAME %>?action=predele&id=<%= rsTask.Fields("Id").Value %><%= Dummy %>&DiaConsulta=<%= DiaConsulta %>">Deleta</a>
	<% end if %>
	</TD>
	<TD>
	<% if FLAG_Adiciona <> "N" then %>
	<a href="<%= SCRIPT_NAME %>?action=add&id=<%= rsTask.Fields("Id").Value %><%= Dummy %>&DiaConsulta=<%= DiaConsulta %>">Inclui</a>
	<% end if %></TD>
             </TR>
          <%
             rsTask.MoveNext
          Loop
	  rsTask.Close
          %>
          </TBODY></table>
          
          <%
          conn.close
	  Response.Write(BACK_TO_ENTRY )   Case Else        %>
	<H1 class="grad"><img src="Logocopa.jpg"><%= Titulo %> (<%= IPdoCliente %>)</H1>
	<center>
	        <Table style="border-style: solid;border-width: 0 0 2 0;border-color: lightgrey;" cellspacing="0" width="75%">
	<tr><td VALIGN=TOP class=inc align=center>
	<% if FLAG_Adiciona <> "N" then %>
	<H2>INCLUSÃO</H2>
	<FORM method=post action="<%= SCRIPT_NAME %>?action=add&CodUsr=<%= CODE_STATUS_USR %>">	<INPUT type=submit value="Adiciona"><P>Pressione este botão para incluir um novo lançamento.</P>	</FORM>

	<% end if %>        </TD></tr><tr><TD valign=top align=center>
	<%
	
	if FLAG_Pesquisa = "S" then
	%>
	<H2>PESQUISAS</H2>
	<FORM name="frmPesq" method=post action="<%= SCRIPT_NAME %>?action=list&CodUsr=<%= CODE_STATUS_USR %>">	<Table width=100% border=0>	     <%
	     For I = 0 to NCampos - 1
		if Left(Arr(I,6),6) = "<SELEC" then
			Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD>" & Arr(I,6)
		else
			'Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & ">"
			Response.write "<TR><TD><LABEL>" & Arr(I,1) & ":" & "</LABEL></TD><TD><Input "
			if Arr(I,4) = "#" then
				Response.write(" class=jdpicker ")
			end if
			Response.write " type=text name=" & Arr(I,0) & " size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & ">"
		end if
		if Arr(I,4) = "#" then
			Response.write " até <Input "
			if Arr(I,4) = "#" then
				Response.write(" class=jdpicker ")
			end if
			Response.write " type=text name=" & Arr(I,0) & "1 size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & ">"
			'Response.write " até <Input type=text name=" & Arr(I,0) & "1 size=" & Arr(I,2) & " maxlength=" & Arr(I,3) & ">"
		end if
		Response.write "</TD><TD><Input class=button type=submit name=Botao value=""" & Arr(I,0) & """>"
		Response.write "</TD></TR>"
	     Next
	     %>
	     <TR><TD colspan=2 align=center><Input class=espec type=submit name="Botao" value="Geral"></TD></TR>
	</Table>
	</TD></TR>
	</Table>	</FORM>
	<% end if %>
	</center>        <%End Select%>
</BODY>