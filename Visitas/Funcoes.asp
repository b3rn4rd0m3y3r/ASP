<%
CONN_STRING = "DRIVER={Microsoft Access Driver (*.mdb)};" _
		& "DBQ=" & "\\Access-se01\Sysmain\AgPres\Cronos.mdb" & ";"

'
' CONVERTE UM NUMERO SEQUENCIAL EM HORA (hh:mm)
' O número zero corresponde a 8:00
' Parametros: número sequencial
'
function NoToHora(valor)
	Hora = ""
	Inteiro = int(Valor/2) + 8
	Resto = (valor/2 - int(valor/2))*2
	Hora = Right("00" & Ltrim(CStr(Inteiro)),2) & ":"
	if Resto = 1 then Hora = Hora & "30" else  Hora = Hora & "00"
	NoToHora = Hora
end function

'
' CONVERTE HORA PARA UM NUMERO SEQUENCIAL
' 8:00 corresponde ao número 0
' Parametros: string da hora (hh:mm)
'
function HoraToNo(valor)
	H = ""
	M = ""
	R = 0
	E_minuto = false
	if valor <> "" then
		L = len(valor)
		for i = 1 to L
			C = mid(valor,i,1)
			if C = ":" then
				E_minuto = true
			else
				if E_minuto then M = M & C else H = H & C
			end if
		next
		if M <> "00" then R = 1
		HoraToNo = (Cint(Ltrim(H)) - 7) * 2 + R - 2
	else
		HoraToNo = -1
	end if
end function

'
' MOSTRA A GRADE DE HORAS DE UM DIA
' Parametros: Tipo da fonte, tamanho da fonte e cor do fundo da tabela
'
function MostraDiaVazio(TpFonte,TamFonte,CorFundo)
	Fs = Ltrim(CStr(TamFonte))
	FsL = Fs + 2
	Hc = Fs + 9
	Rw = "<Table style=""font-size:" & Fs & ";background-color:" & CorFundo & """ border=0 cellspacing=0>"
	Rw = Rw & "<TR><TD><Table>"
	for i = 0 to 25
		Rw = Rw & "<TR>"
		Rw = Rw & "<TD><Label style=""font-size:" & FsL & ";font-family:" & TpFonte & """>" & NoToHora(i) & "</Label></TD>"
		' Rw = Rw & "<TD><Input style=""height:" & Hc & """ type=hidden name=H" & Ltrim(Cstr(i)) & " value=""" & NoToHora(i) & """></TD>"
		Rw = Rw & "<TD><Input type=hidden name=H" & Ltrim(Cstr(i)) & " value=""" & NoToHora(i) & """></TD>"
		'Rw = Rw & "<TD><Input style=""height:" & Hc & ";font-size:" & FsL & ";font-family:" & TpFonte & """ type=text name=T" & Ltrim(Cstr(i)) & " Size=50></TD>"
		Rw = Rw & "<TD><TextArea style=""height:" & Hc & ";font-size:" & FsL & ";font-family:" & TpFonte & """ name=T" & Ltrim(Cstr(i)) & " Size=50 OnFocus=""javascript:this.style.height = " & Hc * 4 & ";"" OnBlur=""javascript:this.style.height = " & Hc & ";""></Textarea></TD>"
		Rw = Rw & "</TR>" & chr(13)
		if i = 12 then Rw = Rw & "</table></TD><TD><Table>"
	next
	Rw = Rw & "</table></TR>"
	Rw = Rw & "</Table>"
	MostraDiaVazio = Rw
end function
'
' MOSTRA UM DIA DA AGENDA NA TELA
' Parametros: Data, ação para o FORM e cor do fundo
'
function MostraDiaTela(vDia, vAcao, vCorFundo,vTamFonte)
	Rw = "<H1>Agenda para o dia " & vDia & "</H1>"
	Rw = Rw & "<Form method=post action=" & vAcao & ">"
	Rw = Rw & "<Table style=""background-color:" & vCorFundo & """><TR><TD>"
	Rw = Rw & MostraDiaVazio("Arial",vTamFonte,vCorFundo)
	Rw = Rw & "</TD></TR><TR><TD align=center><p><input style=""background-color:" & vCorFundo & ";color:white"" type=submit value=Salva></p></TD></TR>"
	Rw = Rw & "</table>"
	Rw = Rw & "</Form>"
	MostraDiaTela = Rw
end function

'
' MOSTRA A GRADE DE HORAS DE UM DIA COM OS DADOS
' PARAMETRO Global: Arranjo T() com os compromissos e N() com os níveis
' Parametros: Tipo da fonte, tamanho da fonte e cor do fundo da tabela
'
function MostraDiaCheio(TpFonte,TamFonte,CorFundo)
	Fs = Ltrim(CStr(TamFonte))
	FsL = Fs + 2
	Hc = Fs + 9
	IndiceCont = ""
	Cab = "<TR style=""background-color:lightsteelblue;height:" & Hc & ";font-size:" & FsL + 1 & ";font-family:" & TpFonte & ";font-weight:bold""><TD valign=top>Hora</TD><TD></TD><TD></TD><TD valign=top align=center>D e s c r i ç ã o</TD><TD valign=top>Nível</TD></TR>"
	Rw = "<Table border=0 style=""font-size:" & Fs & ";background-color:" & CorFundo & """ border=0 cellspacing=0 cellpadding=0>"
	Rw = Rw & "<TR><TD valign=top><Table>" & Cab
	for i = 0 to 25
		Rw = Rw & "<TR>"
		Rw = Rw & "<TD valign=top><Label style=""background-color:lightsteelblue;font-size:" & FsL & ";font-family:" & TpFonte & """>" & NoToHora(i) & "</Label></TD>"
		Rw = Rw & "<TD><Input type=hidden name=I" & Ltrim(Cstr(i)) & " value=""" & Id(i) & """></TD>"
		Rw = Rw & "<TD><Input type=hidden name=H" & Ltrim(Cstr(i)) & " value=""" & NoToHora(i) & """></TD>"
		'Rw = Rw & "<TD><Input style=""height:" & Hc & ";font-size:" & FsL & ";font-family:" & TpFonte & """ type=text name=""T" & Ltrim(Cstr(i)) & """ value=""" & T(i) & """ Size=50></TD>"
		Rw = Rw & "<TD valign=top><TextArea style=""width:230;height:" & Hc & ";font-size:" & FsL & ";font-family:" & TpFonte & """ name=T" & Ltrim(Cstr(i)) & " Size=50 OnFocus=""javascript:this.style.height = " & Hc * 4 & ";"" OnBlur=""javascript:this.style.height = " & Hc & ";"">" & T(i) & "</Textarea></TD>"
		Rw = Rw & "<TD valign=top><Input style=""height:" & Hc & ";font-size:" & FsL & ";font-family:" & TpFonte & """ type=text name=""N" & Ltrim(Cstr(i)) & """ value=""" & N(i) & """ Size=1></TD>"
		Rw = Rw & "</TR>" & chr(13)
		if i = 12 then Rw = Rw & "</table></TD><TD  valign=top><Table>" & Cab
	next
	Rw = Rw & "</table></TR>"
	Rw = Rw & "</Table>"
	MostraDiaCheio = Rw
end function

'
' MOSTRA UM DIA CHEIO DA AGENDA NA TELA
' Parametros: Data, ação para o FORM e cor do fundo
'
function MostraDiaCheioTela(vDia, vAcao, vCorFundo, vTamFonte)
	Rw = "<META HTTP-EQUIV=""Refresh"" content=""10;URL=/dvpi/portalpres/mainAgenda.asp?action=display&dia=" & vDia & """>"
	Rw = "<H1>Agenda para o dia " & Server.HTMLEncode(vDia) & " [" & Session("Intra_Nome") & "]</H1>"
	Rw = Rw & "<Form method=post action=" & vAcao & ">"
	Rw = Rw & "<Table style=""background-color:" & vCorFundo & """><TR><TD>"
	Rw = Rw & MostraDiaCheio("Arial",vTamFonte,vCorFundo)
	Rw = Rw & "</TD></TR><TR><TD align=center><p><input style=""background-color:" & vCorFundo & ";color:white"" type=submit value=Salva></p></TD></TR>"
	Rw = Rw & "</table>"
	Rw = Rw & "</Form>"
	MostraDiaCheioTela = Rw
end function

function GravaEvento(vId, vSeq, vData, vHora, vEvento, vNivel, vUsu)
	'
	' Procura registro
	'
		'
		' Se não existir, inclui
		'
		strSQL = ""
		' Compromisso preenchido
		if vEvento = "" then
			if vId <> "" then
				' Apaga o compromissos
				strSQL = "DELETE FROM Eventos Where Id = " & vId
			end if
		else
			if vId = "" then
				strSQL = "INSERT INTO Eventos (NoSeq, Usu, DtFolha, Hora, Descri, Nivel,CorFundo) SELECT " & vSeq & ",'" & vUsu & "',#" & vData & "#,#" & vHora & "#,'" & vEvento & "'," & vNivel & ",'" & Session("CorFundo") & "'"
			else
				strSQL = "UPDATE Eventos SET Descri = '" & vEvento & "',Nivel = " & vNivel & " Where Id = " & vId
			end if
		end if
		' Response.write strSQL
		if strSQL <> "" then
			Set conn = CreateObject("ADODB.Connection")
			' CONN_STRING = "DRIVER={Microsoft Access Driver (*.mdb)}; " & "DBQ=" & "\\Access-se01\Sysmain\AgPres\Cronos.mdb"
			conn.open CONN_STRING
			conn.execute strSQL, adAffectAll, adExecuteNoRecords
			conn.close
			Set conn = Nothing
		end if
end function

'
' Carrega um registro nos arrays Id(), T(), N()
'
function CarregaEvento(vData,vUsu)
			Set conn = CreateObject("ADODB.Connection")
			' CONN_STRING = "DRIVER={Microsoft Access Driver (*.mdb)}; " & "DBQ=" & "\\Access-se01\Sysmain\AgPres\Cronos.mdb"
			conn.open CONN_STRING
			Set rs = CreateObject("ADODB.Recordset")
			strSQL = "Select * FROM Eventos Where DtFolha = #" & vData & "# AND Usu = '" & vUsu & "'"
			rs.Open strSQL, CONN_STRING,3,3
			Do while not rs.eof
				NoSeq = rs("NoSeq")
				Id(NoSeq) = rs("Id")
				T(NoSeq) = rs("Descri")
				N(NoSeq) = rs("Nivel")
				rs.MoveNext
			Loop
			rs.close
			conn.close
			Set conn = Nothing
			Set rs = Nothing
end function

'
' Lista os compromissos de todas as agenda se o nivel for menor ou inferior ao do usuário logado
' para uma data.
'
function OutrasAgendas(vData, vNivel)
		Set conn = CreateObject("ADODB.Connection")
		CONN_STRING = "DRIVER={Microsoft Access Driver (*.mdb)}; " & "DBQ=" & "\\Access-se01\Sysmain\AgPres\Cronos.mdb"
		conn.open CONN_STRING
		Set rs = CreateObject("ADODB.Recordset")
		strSQL = "Select * FROM Eventos Where DtFolha = #" & vData & "# AND Nivel <= " & vNivel & " ORDER BY Usu, Hora"
		' Response.write strSQL & "<BR>"
		rs.Open strSQL, CONN_STRING,3,3
		Rw = "<center><Table cellspacing=0 cellpadding=2 border=0><TH>Usuário<TH>Hora<TH>Evento"
		Cor = "lightblue"
		Do while not rs.eof
			Cor = rs("corFundo")
			Usu = rs("Usu")
			Evento = rs("Descri")
			Hora = rs("Hora")
			Rw = Rw & "<TR style=""background-color:" & Cor & """><TD style=""border-bottom-color:lightgrey;border-bottom-style:solid;border-bottom-width:1;"" width=""10%"">" & Usu & "</TD><TD style=""border-bottom-color:lightgrey;border-bottom-style:solid;border-bottom-width:1;"" width=""10%"">" & Hora & "</TD>"
			Rw = Rw & "<TD style=""border-bottom-color:lightgrey;border-bottom-style:solid;border-bottom-width:1;"" width=""50%""><textarea cols=80 rows=3>" & Evento & "</textarea></TD></TR>"
			rs.MoveNext
		Loop
		Rw = Rw & "</Table></center>"
		rs.close
		conn.close
		Set conn = Nothing
		Set rs = Nothing
		OutrasAgendas = Rw
end function

%>