<%
function funcLogo(par1, par2)
	Retor = "<Table style=""border:solid 1 dodgerblue;"" border=0 cellpadding=0 cellspacing=0><tr><td style=""padding:2;margin:0;"""
  Retor = Retor & "valign=center><center><SPAN class=blue1a>&nbsp;" & par1 & "&nbsp;</span><SPAN class=blue6a>&nbsp;" & par2 & "&nbsp;</span></center></td></tr></table>"
	funcLogo = Retor
End function
function blogLogo()
	Retor = "<Table style=""border:solid 1 dodgerblue;"" border=0 cellpadding=0 cellspacing=0><tr><td style=""padding:2;margin:0;"""
  Retor = Retor & "valign=center><SPAN class=blue1a>Blog</span><SPAN class=blue6a>PREVIMINAS</span></td></tr></table>"
	blogLogo = Retor
End function
function convenioLogo()
	Retor = "<Table style=""border:solid 1 dodgerblue;"" border=0 cellpadding=0 cellspacing=0><tr><td style=""padding:2;margin:0;"""
  Retor = Retor & "valign=center><SPAN class=blue1a>Convênios</span><SPAN class=blue6a>DVLG</span></td></tr></table>"
	convenioLogo = Retor
End function
function envasaLogo()
	Retor = "<Table style=""border:solid 1 dodgerblue;"" border=0 cellpadding=0 cellspacing=0><tr><td style=""padding:2;margin:0;"""
  Retor = Retor & "valign=center><SPAN class=blue1a>Envas</span><SPAN class=blue6a>adora</span></td></tr></table>"
	envasaLogo = Retor
End function

function cartilhaLogo()
	Retor = "<Table style=""border:solid 1 dodgerblue;"" border=0 cellpadding=0 cellspacing=0><tr><td style=""padding:2;margin:0;"""
  Retor = Retor & "valign=center><SPAN class=blue1a>Comunicados</span><SPAN class=blue6a>&nbsp;SAP</span></td></tr></table>"
	cartilhaLogo = Retor
End function

function InvData(vData)
  S = mid(vData,4,2) & "/" & left(vData,2) & "/" & right(vData,4)
  InvData = S
End function

function InvDataShort(vData)
  S = mid(vData,4,2) & "/" & left(vData,2) & "/" & right(vData,2)
  InvDataShort = S
End function

function Md_dM(vData)
  Dim Pos1,Pos2,Ped1,Ped2,S
  Pos1 = InStr(vData,"/")
  Ped1 = Left(vData,Pos1-1)
  vData = Mid(vData,Pos1+1)
  Pos2 = InStr(vData,"/")
  Ped2 = Left(vData,Pos2-1)
  vData = Mid(vData,Pos2+1)
  S = Ped2 & "/" & Ped1 & "/" & vData
  Md_dM = S
End function

function TiraVirg(vValor)
  S = ""
  Tam = Len(vValor)
  for i = 1 to Tam
	cc = mid(vValor,i,1)
	if cc <> "," then S = S & cc
  next
  TiraVirg = S
End function
'
' Para valores, troca a vírgula por ponto
'
function TiraVirgV(vValor)
  S = ""
  Tam = Len(vValor)
  for i = 1 to Tam
	cc = mid(vValor,i,1)
	if cc = "," then cc = "."
	S = S & cc
  next
  TiraVirgV = S
End function

%>
