<%
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
%>
