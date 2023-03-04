/*
Funcoes.js
Este arquivo contém funções de uso geral que devem ser utilizadas para tarefas comuns como consistência de matrícula, CPF, cálculo de datas, etc.
Qualquer nova função considerada de uso geral deve ser incluída aqui.
Para utilizar esse arquivo inserir a constante CFuncoesJSTag no cabeçalho (HEAD) da página ASP
Dúvidas/sugestões - Alexander Flávio de Oliveira
*/
//
// Função Block()
// Descrição: Formata uma string em um tamanho específico de acordo com o tipo (Númerico ou Alfanumérico)
// Programador: Alexander Flávio de Oliveira
// Entrada:
// 	sDado = valor do campo a ser formatado (string)
// 	iTamanho = tamanho que o campo deve ter (numérico)
// 	sTipo = tipo do campo: (A=Alfanumérico e N=Numérico) (caracter)
// Saída: O valor do campo formatado. Se o tipo for alfanumérico, alinhado à esquerda com espaços à direita
// se o tipo for numérico, alinhado à direita com zeros à esquerda.
function Block(sDado,iTamanho,sTipo) {
	//sDado = "" + sDado; MUNIZ
	//alert ("sDado: " + sDado);
	sDado = String(sDado);
	iTamanho = parseInt(iTamanho);
	sTipo = sTipo.toUpperCase();
	for (var i=sDado.length; i < iTamanho; i++) {
	if (sTipo == "A")
		sDado += " "
	else
		sDado = "0" + sDado;
	}
	return sDado;
}
//
// Função Trim()
// Descrição: Retira espaços em branco do início e do fim da string
// Programador: Alexander Flávio de Oliveira
// Entrada: string a ser processada
// Saída: string processada
function Trim(s) {
	var strAux = new String(s);
	var strimed;
	for (var cont=(strAux.length - 1);((cont>=0) && (strAux.charAt(cont) == " "));cont--) {}
	strimed = strAux.substring(0,(cont+1));
	return strimed;
}
//
// Função AllTrim - (pode ser substituída pelo uso da opção nospace do validation form quando a necessidade for formatar um campo)
// Programador: Alexander Flávio de Oliveira
// Retira todos espaços em branco da string
// Entrada: string a ser processada
// Saída: string processada
function AllTrim(s) {
	var strimed = "";
	for (var cont=0;cont<=s.length;cont++) {
		if (s.charAt(cont) != " ") {
			strimed = strimed + s.charAt(cont);
		}
	}
	return strimed;
}
//
// Função isCGC
// Descrição: Verifica se CGC é válido
// Entrada: CGC (string)
// Saída: True ou False
function isCGC(x) {
	strNum = "";
	if ((x == "") | (isNaN(x)))
		return (false);
	l = x.length;
	for (i = 0; i < (14 - l); i++)
		x = '0' + x;
	l = x.length;
	for (i = 0; i < l; i++) {
		caracter = x.substring(i,i+1)
		if ((caracter >= '0') && (caracter <= '9'))
			strNum = strNum + caracter;
	}
	strMul = "6543298765432";
	iValido = 1;
	if(strNum.length != 14)
		return(false);
	iSoma = 0;
	strNum_base = strNum.substring(0,12);
	iLenNum_base = strNum_base.length - 1;
	iLenMul = strMul.length - 1;
	for(i = 0;i < 12; i++)
		iSoma = iSoma +
			parseInt(strNum_base.substring((iLenNum_base-i),(iLenNum_base-i)+1),10) *
			parseInt(strMul.substring((iLenMul-i),(iLenMul-i)+1),10)
			iSoma = 11 - (iSoma - Math.floor(iSoma/11) * 11);
		if(iSoma == 11 || iSoma == 10)
			iSoma = 0;
		strNum_base = strNum_base + iSoma;
		iSoma = 0;
		iLenNum_base = strNum_base.length - 1
		for(i=0; i < 13; i++)
			iSoma = iSoma +
				parseInt(strNum_base.substring((iLenNum_base-i),(iLenNum_base-i)+1),10) *
				parseInt(strMul.substring((iLenMul-i),(iLenMul-i)+1),10)
				iSoma = 11 - (iSoma - Math.floor(iSoma/11) * 11);
		if(iSoma == 11 || iSoma == 10)
			iSoma = 0;
		strNum_base = strNum_base + iSoma;
		if(strNum != strNum_base)
			return(false);
	return(true);
}
//
// Função isMatric()
// Descrição: Valida matrícula de empregados
// Entrada: Matrícula (string) sem máscara
// Saída: True ou False
function isMatric(pMatric) {
var
  i,j,dig1,dig2,vres,vsobra,vmatx,vaux;
  pMatric = AllTrim(pMatric);
  vmatx = Block(pMatric,6,"n");
  vaux = "";
  j = 6;
  vres = 14;
  for (i=0;i<=4;i++)
    {
     vres = vres + (j * (parseInt(vmatx.substr(i,1))));
     j--;
    }
   vsobra = (vres % 11);
   dig1 = parseInt(vmatx.substr(5,1));
   dig2 = 11 - vsobra;
   if (dig2 >= 10)
     {
      vaux = String(dig2).substr(1,1);
      dig2 = parseInt(vaux);
     }
   if (dig1 != dig2)
     {
      alert("Matrícula Inválida")
      return(false);
     }
   return(true);
}
//
// Função wordCounter()
// Descrição: Esta função conta as palavras digitadas em um textarea, exibe quantas palavras ainda podem ser digitadas e impede a digitação quando atinge
// o máximo definido.
// Entrada:
// 	field = textarea (objeto)
// 	countfield = input text que exibirá o restante de palavras (objeto)
// 	maxlimit = máximo de palavras
// Saída: Alteração do campo countfield e bloqueio de digitação uma vez alcançado o maxlimit.
function wordCounter(field, countfield, maxlimit) {
	wordcounter=0;
	for (x=0;x<field.value.length;x++) {
		if (field.value.charAt(x) == " " && field.value.charAt(x-1) != " ") {
			wordcounter++; // Counts the spaces while ignoring double spaces, usually one in between each word.
		}
		if (wordcounter > 250) {
			field.value = field.value.substring(0, x);
		}
		else {
			countfield.value = maxlimit - wordcounter;
		}
	}
   }
//
// Função textCounter()
// Descrição: Esta função conta os caracteres digitados em um textarea, exibe quantos caracteres ainda podem ser digitados e impede a digitação quando atinge
// o máximo definido.
// Entrada:
// 	field = textarea (objeto)
// 	countfield = input text que exibirá o restante de caracteres (objeto)
//	 maxlimit = máximo de caracteres
// Saída: Alteração do campo countfield e bloqueio de digitação uma vez alcançado o maxlimit.
function textCounter(field, countfield, maxlimit) {
	if (field.value.length > maxlimit) {
		field.value = field.value.substring(0, maxlimit);
	}
	else {
		countfield.value = maxlimit - field.value.length;
	}
}
//
// Função comparaDatas()
// Programador: Alexander Flávio de Oliveira
// Descrição: Esta função faz comparação entre duas datas
// Entrada:
// d1 = primeira data
// s1 = string nome da primeira data
// d2 = segunda data
// s2 = string nome da segunda data
// c = comparador (<,<=,=,>,>=)
// od1 = objeto do form que servirá de base para realce e foco em caso de erro.
function comparaDatas(d1,s1,d2,s2,c,od1) {
	//alert("Funcao comparaDatas\nd1: " + d1 + "\ns1: " + s1 + "\nd2: " + d2 + "\ns2: " + s2 + "\nc: " + c);
	var msg;
	var di;
	var df;
	var partes;
	if (d1 == "" || s1 == "" || d2 == "" || s2 == "" || c == "") {
		alert("Função comparaDatas() - Parâmetros insuficientes.");
		return false;
	}

	if (typeof d1 == "object") {
		di = d1;
		di.setHours(0,0,0,0);
	}
	else {
		partes = d1.split("/");
		di = new Date(partes[2], (partes[1] - 1), partes[0], 00, 00, 00, 00);
	//	di = new Date(d1.substr(6, 4), ((d1.substr(3, 2)) - 1), d1.substr(0, 2), 00, 00, 00, 00);
	}
	if (typeof d2 == "object") {
		df = d2;
		df.setHours(0,0,0,0);
	}
	else {
		partes = d2.split("/");
		df = new Date(partes[2], (partes[1] - 1), partes[0], 00, 00, 00, 00);
	//	df = new Date(d2.substr(6,4),((d2.substr(3,2)) - 1),d2.substr(0,2),00,00,00,00);
	}
	if (c =="=") {
		c = c + "="
	}
	if (!(eval(di.valueOf() + c + df.valueOf()))) {
		if (typeof od1 == "object") {
			od1.paint();
			od1.focus();
		}
		msg = ("A '" + s1 + "' deve ser  " + c + "  a '" + s2 + "'. Por favor, verifique.");
		msg = (substitui(msg,(new Array(" > "," >= "," < "," <= "," == ")),(new Array("maior que","maior ou igual","menor que","menor ou igual","igual")),"g",""));
		alert(msg);
		return false;
	}
	return true;
}
//
// Função isEntreDatas()
// Programador: Alexander Flávio de Oliveira
// Descrição: Esta função verifica se uma data está em um intervalo de duas datas
// Entrada:
// p1 = data início do intervalo
// s1 = string contendo o nome da data início do intervalo
// p2 = data final do intervalo
// s2 = string contendo o nome da data final do intervalo
// d  = data a ser verificada
// sd = string contendo o nome da data a ser consistida
// od = objeto do form que servirá de base para realce e foco em caso de erro.
function isEntreDatas(p1,s1,p2,s2,d,sd,od) {
	//alert("Funcao isEntreDatas\np1:"+p1+"\ns1:"+s1+"\np2:"+p2+"\ns2:"+s2+"\nd:"+d+"\nsd:"+sd+"\ncampo data:"+od.value);

	if (p1 == "" || p2 == "" || d == "" || sd == "") {
		alert("Função isEntreDatas() - Parâmetros insuficientes.");
		return false;
	}

	if (s1 == "") {
		s1 == "Data Inicial";
	}

	if (s2 == "") {
		s2 == "Data Final";
	}

	if (!(comparaDatas(p1,s1,p2,s2,"<=","") && comparaDatas(d,sd,p1,s1,">=",od) && comparaDatas(d,sd,p2,s2,"<=",od))){
		return false;
	} else {
		return true;
	}
}
//
//
function abreJanelaSimples(f,w,h) {
	window.open(f,"nova","toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=" + w + ",height=" + h);
}
//
function abreJanela(f,w,h,t, l) {
	window.open(f,"nova","toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,scrollbars=no,width=" + w + ",height=" + h + ",top=" + t + ",left=" + l);
}
//
// Função substitui()
// Programador: Alexander Flávio de Oliveira
// Descrição: Esta função substitui várias substrings em uma string
// Entrada:
// 	sString = String a ser trabalhada
// 	aDe = Array contendo as substrings a serem substituídas
//	aPara = Array contendo as substrings para substituir
//	escopo = g se a substituição será feita em toda a string ou apenas nas primeiras ocorrências
//	ignore_case =  i para ignorar a diferença entre maiúsculas e minúsculas
// Saída: A função retornará a string passada como parâmetro alterada de acordo com os parâmetros
// OBS: a quantidade de ocorrências dos vetores aDe e aPara devem ser iguais bem como as posições de cada par de substrings (DE/PARA).
function substitui(sString,aDe,aPara,escopo,ignore_case) {
	escopo = escopo.toLowerCase();
	ignore_case = ignore_case.toLowerCase();
	for (var i = 0; i < aDe.length; i++) {
		myRegExp = new RegExp(aDe[i],escopo,ignore_case);
		sString = sString.replace(myRegExp,aPara[i]);
	}
	return sString;
}

//
// Função retornaData()
// Programador: Alexander Flávio de Oliveira
// Descrição: Esta função recebe uma data do tipo string e retorna um objeto Date com a hora zerada
// Entrada:
// 	sData = Recebe uma string data formatada dd/mm/aaaa
// Saída: A função retornará um objeto Date com a hora zerada
function retornaData(sData) {
	var aData;
	var dData;
	aData = sData.split("/");  // array com as partes da data (dd,mm,aaaa)
	if (aData.length !=3) {
		return false;
	}
	dData = new Date(aData[2],(aData[1]-1),aData[0],00,00,00);
	return dData;
}
//
// Função montaData()
// Programador: Alexander Flávio de Oliveira
// Descrição: Esta função recebe uma data do tipo Date e retorna uma string formatada dd/mm/aaaa
// Entrada:
// 	dData = Recebe uma uma data do tipo Date
// Saída: A função retornará uma string data formatada dd/mm/aaaa
function montaData(dData) {
	var sData;	// string auxiliar para montar a data no formato dd/mm/aaaa - data
	var sDD; 	// string auxiliar para montar a data no formato dd/mm/aaaa - dia
	var sMM; 	// string auxiliar para montar a data no formato dd/mm/aaaa - mes
	var sAAAA; 	// string auxiliar para montar a data no formato dd/mm/aaaa - ano
	sDD = Block(dData.getDate(),2,"N");
	sMM = Block((dData.getMonth()+1),2,"N");
	sAAAA = Block(dData.getFullYear(),4,"N");
	sData = sDD +"/"+ sMM +"/"+ sAAAA;
	//alert("montaData - sData: " + sData);
	return sData;
}
//
// Função: calculaDatas( )
// Programador: Alexander Flávio de Oliveira
// calcula da seguinte maneira:
// recebe data1 e dias, soma-os e retorna data2
// recebe data2 e dias, subtrai-os e retorna data1
// recebe data1 e data2, subtrai-os e retorna dias
// Apenas dois dos parametros devem estar preenchidos
// sData1 e sData2 - Datas formatadas dd/mm/aaaa no tipo string tanto para entrada quanto para saída
// dias - Qtde de dias no tipo inteiro
function calculaDatas(sData1,sData2,dias) {
        //alert("sdata1");
	if ((((sData1!="") && (sData2!="") && (dias!=""))) || ((sData1=="") && (sData2=="") && (dias==""))) {
		alert("Função calculaDatas()\nExcesso de Parâmetros");
		return "Erro: Excesso de Parâmetros";
	}
	var dData1; 	// objeto data auxiliar
	var dData2; 	//objeto data auxiliar
	if ((sData1!="") && (sData2!="")) {
		// Recebe data1 e data2 e retorna qtde dias
		// Cria um objeto data auxiliar
		dData1 = retornaData(sData1);
		dData2 = retornaData(sData2);
		// Converter dias para milésimos e Calcular a data2
		dias = ((dData2 - dData1) /1000 /60 /60 /24);
		// Montar a a data2 no formato dd/mm/aaaa
		sData2 = montaData(dData2);
		return dias;
	} else {
		// Recebe data1 de qtde dias, soma e retorna data2
		if ((sData1!="") && (dias!="")) {
			// Cria um objeto data auxiliar
			dData1 = retornaData(sData1);
			//alert("dData1:"+dData1);
			// Converter dias para milésimos e Calcular a data2
			dData2 = new Date((dData1.getTime() + (dias*24*60*60*1000)));
			// Montar a a data2 no formato dd/mm/aaaa
			sData2 = montaData(dData2);
			return sData2;
		} else {
			// Recebe data2 de qtde dias, subtrai e retorna data1
			if ((dias!="") && (sData2!="")) {
				// Cria um objeto data auxiliar
				dData2 = retornaData(sData2);
				// Converter dias para milésimos e Calcular a data2
				dData1 = new Date(dData2.getTime() - dias*24*60*60*1000);
				// Montar a a data2 no formato dd/mm/aaaa
				sData1 = montaData(dData1);
				return sData1;
			} else {
				alert("Função calculaDatas()\nInsuficiência de Parâmetros");
				return "Erro: Insuficiência de Parâmetros";
			}
		}
	}
}
//
// Função: extenso(Numero)
// Descrição: Recebe um número e o retorna por extenso
// Programador: Alexander Flávio de Oliveira
// Entrada: Um número inteiro positivo. Máximo: 999999999999999
// Saída: string com o número por extenso
function extenso(Numero) {
	// Declara as variáveis da função
	var i,j,k;					// variáveis auxiliares de índice
	var iNumero, sNumero, sNumeroaux = "";
	var sExtenso;
	var sExtensoaux = "";
	// Extensos das partes
	var aExtenso = new Array(3);	// Tabela de extensos - 0=Unidade - 1=Dezena  -  2=Centena

	var aGrupoDesc = new Array(5);	// Grupos de milhar
	var aGrupo = new Array(2);		// Cada Parte Inteira e decimal
	var aParte = new Array();
	var iParte;

	// Faz a validação do argumento
	sNumero = new String(Numero);
	iNumero = parseInt(sNumero);
	if ((sNumero=="") || (iNumero < 0) || (iNumero > 999999999999999)) {
		alert("Função extenso - Erro: Argumento Inválido!");
		return false;
	}
	// Define cada ocorrência dos vetores como novos Arrays
	for (i=0; i<3; i++) {
		aExtenso[i] = new Array(20);
	}
	for (i=0; i<5; i++) {
		aGrupoDesc[i] = new Array(2);
	}
	// Define matrizes com extensos parciais
	aExtenso[0][0] = "";
	aExtenso[0][1] = "um ";
	aExtenso[0][2] = "dois ";
	aExtenso[0][3] = "três ";
	aExtenso[0][4] = "quatro ";
	aExtenso[0][5] = "cinco ";
	aExtenso[0][6] = "seis ";
	aExtenso[0][7] = "sete ";
	aExtenso[0][8] = "oito ";
	aExtenso[0][9] = "nove "
	aExtenso[0][10] = "dez ";
	aExtenso[0][11] = "onze ";
	aExtenso[0][12] = "doze ";
	aExtenso[0][13] = "treze ";
	aExtenso[0][14] = "quatorze ";
	aExtenso[0][15] = "quinze "
	aExtenso[0][16] = "dezesseis ";
	aExtenso[0][17] = "dezessete ";
	aExtenso[0][18] = "dezoito ";
	aExtenso[0][19] = "dezenove ";
	aExtenso[0][20] = "vinte ";

	aExtenso[1][0] = "";
	aExtenso[1][1] = "dez ";
	aExtenso[1][2] = "vinte ";
	aExtenso[1][3] = "trinta ";
	aExtenso[1][4] = "quarenta ";
	aExtenso[1][5] = "cinquenta ";
	aExtenso[1][6] = "sessenta ";
	aExtenso[1][7] = "setenta ";
	aExtenso[1][8] = "oitenta ";
	aExtenso[1][9] = "noventa ";
	aExtenso[1][10] = "cem ";

	aExtenso[2][0] = "";
	aExtenso[2][1] = "cento ";
	aExtenso[2][2] = "duzentos ";
	aExtenso[2][3] = "trezentos ";
	aExtenso[2][4] = "quatrocentos ";
	aExtenso[2][5] = "quinhentos ";
	aExtenso[2][6] = "seiscentos ";
	aExtenso[2][7] = "setecentos ";
	aExtenso[2][8] = "oitocentos ";
	aExtenso[2][9] = "novecentos ";

	aGrupoDesc[0][0] = "";
	aGrupoDesc[0][1] = "";
	aGrupoDesc[1][0] = "mil ";
	aGrupoDesc[1][1] = "mil ";
	aGrupoDesc[2][0] = "milhão ";
	aGrupoDesc[2][1] = "milhões ";
	aGrupoDesc[3][0] = "bilhão ";
	aGrupoDesc[3][1] = "bilhões ";
	aGrupoDesc[4][0] = "trilhão ";
	aGrupoDesc[4][1] = "trilhões ";

	for (j=0,i=(sNumero.length-1);i>=0;i--,j++) {
		if (((j%3)==0)&&(j>0)) {
			sNumeroaux = "/" + sNumeroaux;
		}
		sNumeroaux = sNumero.substr(i,1) + sNumeroaux;
	}
	aParte = sNumeroaux.split("/");		// Separa as partes inteira e decimal
	for (k=0,j=(aParte.length-1); j>=0; j--,k++) {
		iParte = aParte[j];
		sExtenso = ""
		// Trabalha os grupos
		for (i=0;((i<3) && (iParte>0)); i++) {
			resto = parseInt(iParte%10);
			iParte = parseInt(iParte/10);
			if ((resto>0)&&((iParte==1)||(iParte==11))&&(i==0)) {
				if (iParte==1) {
					sExtenso = aExtenso[i++][resto+10] + sExtenso;
					iParte = 0;
				} else {
					sExtenso = "e "+ aExtenso[i++][resto+10] + sExtenso;
				}
			} else {
				if ( (resto>0)&&(i<2)&&(iParte>0) ) {
					sExtenso = ("e " + aExtenso[i][resto] + sExtenso);
				} else {
					if ((resto==0)&&(iParte==10)&&(i==0)) {
						sExtenso = "cem ";
						iParte = 0;
					} else {
						sExtenso = aExtenso[i][resto] + sExtenso;
					}
				}
			}
		}
		if (sExtenso.length>0) {
			sExtensoaux = sExtenso + aGrupoDesc[k][(sExtenso=="um "?0:1)] + sExtensoaux;
		}
	}
	return sExtensoaux;
}
//
// Função extensoValor(sValor)
// Descrição: Recebe um valor e o retorna por extenso
// Programador: Alexander Flávio de Oliveira
// Entrada: Um valor no formato zzzzzzzzzzzzzz9,99
// Saída: string com o valor por extenso (reais)
//
function extensoValor(sValor) {
	var sExtenso = "";
	var aParte = sValor.split(",");
	var aDe = new Array(6);
	var aPara = new Array(6);
	if (aParte.length>1) {
		iReais = parseInt(aParte[0]);
		iCentavos = parseInt(aParte[1]);
		if (iReais > 0) {
			aDe[0] = "milhões reais";
			aDe[1] = "milhão reais";
			aDe[2] = "bilhões reais";
			aDe[3] = "bilhão reais";
			aDe[4] = "trilhões reais";
			aDe[5] = "trilhão reais";
			aPara[0] = "milhões de reais";
			aPara[1] = "milhão de reais";
			aPara[2] = "bilhões de reais";
			aPara[3] = "bilhão de reais";
			aPara[4] = "trilhões de reais";
			aPara[5] = "trilhão de reais";
			sExtenso = extenso(aParte[0]) + (iReais==1?"real":"reais") + (iCentavos>0?" e ":"");
			sExtenso = substitui(sExtenso,aDe,aPara,'g','i');
		}
		if (iCentavos>0) {
			sExtenso = sExtenso + extenso(aParte[1]) + (iCentavos==1?"centavo":"centavos");
		}
		return sExtenso;
	} else {
		return false;
	}
}
//
// ***********************************************************
// Javascript function library
// Name:		aptfree.js
// Created by:	Affordable Production Tools
// Web site:		http://www.aptools.com
// Last update:	October 28, 2001
//
// Placed in the public domain by Affordable Production Tools
//
// It is requested that if you use the functions in this
// library, the origination notices remain with the functions.
// ***********************************************************

function FormatNumber(Number,Decimals,Separator)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // March 21, 1998
 // Web site: http://www.aptools.com
 //
 // November 24, 1998 -- Error which allowed a null value
 // to remain null fixed. Now forces value to 0.
 //
 // October 28, 2001 -- Modified to provide leading 0 for fractional number
 // less than 1.
 //
 // This function accepts a number to format and number
 // specifying the number of decimal places to format to. May
 // optionally use a separator other than '.' if specified.
 //
 // If no decimals are specified, the function defaults to
 // two decimal places. If no number is passed, the function
 // defaults to 0. Decimal separator defaults to '.' .
 //
 // If the number passed is too large to format as a decimal
 // number (e.g.: 1.23e+25), or if the conversion process
 // results in such a number, the original number is returned
 // unchanged.
 // **********************************************************
//alert("1 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  Number += "";          // Force argument to string.
  Decimals += "";        // Force argument to string.
  Separator += "";       // Force argument to string.
  if((Separator == "") || (Separator.length > 1)) {
    Separator = ",";
//alert("2 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  if(Number.length == 0) {
    Number = "0";
//alert("3 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  var OriginalNumber = Number;  // Save for number too large.
  var Sign = 1;
  var Pad = "";
  var Count = 0;
  var Aux = "";
  // If no number passed, force number to 0.
  if(parseFloat(Number)){
    Number = parseFloat(Number);
//alert("4 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  else {
    Number = 0;
//alert("5 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  // If no decimals passed, default decimals to 2.
  if((parseInt(Decimals, 10)) || (parseInt(Decimals, 10) == 0)){
    Decimals = parseInt(Decimals,10);
//alert("6 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  else {
    Decimals = 2;
//alert("7 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  if(Number < 0) {
    Sign = -1;         // Remember sign of Number.
    Number *= Sign;    // Force absolute value of Number.
//alert("8 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  if(Decimals < 0) {
    Decimals *= -1;    // Force absolute value of Decimals.
//alert("9 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  // Next, convert number to rounded integer and force to string value.
  // (Number contains 1 extra digit used to force rounding)
  Number = "" + Math.floor(Number * Math.pow(10,Decimals + 1) + 5);
//alert("10 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  if((Number.substring(1,2) == '.')||((Number + '')=='NaN')) {
    return(OriginalNumber);
//alert("11 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }    // Number too large to format as specified.
    // If length of Number is less than number of decimals requested +1,
    // pad with zeros to requested length.
    // Construct pad string.
  if(Number.length < Decimals +1) {
    for(Count = Number.length; Count <= Decimals; Count++) {
      Pad += "0";
    }
//alert("12 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  Number = Pad + Number; // Pad number as needed.
//alert("13 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  if(Decimals == 0) {
    // Drop extra digit -- Decimal portion is formatted.
    Number = Number.substring(0, Number.length -1);
//alert("14 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  else {
    // Or, format number with decimal point and drop extra decimal digit.
  //  alert ("Decimal = " + Decimals);
  //  alert ("1 - Number.length: " + Number.length);
  //  alert ("Substring: " + Number.substring(0,Number.length - Decimals -1));
  //  alert ("2 - Number.length: " + Number.length);
    if (Number.length == 3) {
      Aux = "0";
  //    alert ("length = 3");
//alert("15 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
    }
    else {
  //    alert ("length <> 3");
      Aux = Number.substring(0,Number.length - Decimals -1);
//alert("16 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
    }
  //  alert ("Aux: " + Aux);
    Number = Aux + Separator + Number.substring(Number.length - Decimals -1, Number.length -1);
  //  alert (Number);
//alert("17 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  //alert("Number2: " + Number);
  //alert("Number3: " + Number + " parseFloat de: " + parseFloat(Number));
  if((Number == "") || ((parseFloat(Number) < 1) && (parseFloat(Number) != 0))) {
    Number="0"+Number; // Force leading 0 for |Number| less than 1.
//alert("18 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
  //alert("Number após o force: " + Number);
  if(Sign == -1) {
    Number = "-" + Number;  // Set sign of number.
//alert("19 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  }
//alert("20 - FormatNumber: \n Number: " + Number + "\nDecimal: " + Decimals + "\nSeparator:" + Separator);
  return(Number)
}

function PadLeft(String,Length,PadChar)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // April 1, 1998
 // Web site: http://www.aptools.com
 //
 // December 2, 1998 -- Modified to allow specification of
 // pad character.
 //
 // This function accepts a number or string, and a number
 // specifying the desired length. If the length is greater
 // than the length of the value passed, the value is padded
 // with spaces (default) or the specified pad character
 // to the length specified.
 //
 // The function is useful in right justifying numbers or
 // strings in HTML form fields.
 // **********************************************************
 String += ""       // Force argument to string.
 Length += ""       // Force argument to string.
 PadChar += ""      // Force argument to string.
 if((PadChar == "") || (!(PadChar.length == 1)))
  PadChar = " "
 var Count = 0
 var PadLength = 0
 Length = parseInt(0 + Length,10)
 if(Length <= String.length) // No padding necessary.
  return(String)
 PadLength = Length - String.length
 for(Count = 0; Count < PadLength; Count++)
  String = PadChar + String
 return(String)
}

function PadRight(String,Length,PadChar)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // April 1, 1998
 // Web site: http://www.aptools.com
 //
 // December 2, 1998 -- Modified to allow specification of
 // pad character.
 //
 // This function accepts a number or string, and a number
 // specifying the desired length. If the length is greater
 // than the length of the value passed, the value is padded
 // with spaces (default) or the specified pad character
 // to the length specified.
 // **********************************************************
 String += ""       // Force argument to string.
 Length += ""       // Force argument to string.
 PadChar += ""      // Force argument to string.
 if((PadChar == "") || (!(PadChar.length == 1)))
  PadChar = " "
 var Count = 0
 var PadLength = 0
 Length = parseInt(0 + Length,10)
 if(Length <= String.length) // No padding necessary.
  return(String)
 PadLength = Length - String.length
 for(Count = 0; Count < PadLength; Count++)
  String += PadChar
 return(String)
}

function PadCenter(String,Length,PadChar)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // April 1, 1998
 // Web site: http://www.aptools.com
 //
 // December 2, 1998 -- Modified to allow specification of
 // pad character.
 //
 // This function accepts a number or string, and a number
 // specifying the desired length. If the length is greater
 // than the length of the value passed, the value is padded
 // with spaces (default) or the specified pad character
 // to the length specified.
 //
 // Uses functions PadLeft() and PadRight()
 // **********************************************************
 String += ""       // Force argument to string.
 Length += ""       // Force argument to string.
 PadChar += ""      // Force argument to string.
 if((PadChar == "") || (!(PadChar.length == 1)))
  PadChar = " "
 var Count = 0
 var PadLength = 0
 var LeftPad = 0
 var RightPad = 0
 Length = parseInt(0 + Length,10)
 if(Length <= String.length) // No padding necessary.
  return(String)
 PadLength = Length - String.length
 LeftPad = Math.floor(PadLength/2)
 RightPad = PadLength - LeftPad
 String = PadLeft(String,LeftPad+String.length,PadChar)
 String = PadRight(String,RightPad+String.length,PadChar)
 return(String)
}

function LeftTrim(String,TrimChar)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // April 27, 1998
 // Web site: http://www.aptools.com
 //
 // December 2, 1998 -- Modified to allow specification of
 // character to be trimmed.
 //
 // This function trims spaces (default) or the specified
 // character from the left of a string or form field.
 // **********************************************************
 String += ""         // Force argument to string.
 TrimChar += ""       // Force argument to string.
 if((TrimChar == "") || (!(TrimChar.length == 1)))
  TrimChar = " "
 if(String.length == 0)
  return(String)
 var Count = 0
 for(Count = 0;Count < String.length;Count++)
 {
  if(!(String.charAt(Count) == TrimChar))
   return(String.substring(Count,String.length))
 }
 return("")
}

function RightTrim(String,TrimChar)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // April 27, 1998
 // Web site: http://www.aptools.com
 //
 // December 2, 1998 -- Modified to allow specification of
 // character to be trimmed.
 //
 // This function trims spaces (default) or the specified
 // character from the right of a string or form field.
 // **********************************************************
 String += ""        // Force argument to string.
 TrimChar += ""      // Force argument to string.
 if((TrimChar == "") || (!(TrimChar.length == 1)))
  TrimChar = " "
 if(String.length == 0)
  return(String)
 var Count = 0
 for(Count = String.length -1;Count >= 0;Count--)
 {
  if(!(String.charAt(Count) == TrimChar))
   return(String.substring(0,Count + 1))
 }
 return("")
}

function AllTrim(String,TrimChar)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // April 27, 1998
 // Web site: http://www.aptools.com
 //
 // December 2, 1998 -- Modified to allow specification of
 // character to be trimmed.
 //
 // This function trims spaces (default) or the specified
 // character from the left and the right of a string or form field.
 //
 // Note that this functions uses two other library functions,
 // LeftTrim() and RightTrim().
 // **********************************************************
 String += ""        // Force argument to string.
 TrimChar += ""      // Force argument to string.
 if((TrimChar == "") || (!(TrimChar.length == 1)))
  TrimChar = " "
 return(RightTrim(LeftTrim(String,TrimChar),TrimChar))
}

function FormatNumberField(Object,Decimals,Pad,Separator,PadChar,Group)
{
 // **********************************************************
 // Placed in the public domain by Affordable Production Tools
 // March 23, 1998
 // Web site: http://www.aptools.com
 //
 // November 24, 1998 -- Error which allowed a null field
 // to remain null fixed. Now forces value to 0.
 //
 // December 2, 1998 -- Modified to allow specification of
 // pad character.
 //
 // This function formats a number in an HTML form field,
 // setting the decimal precision and right justifying the
 // number in the field. An optional decimal separator other
 // than '.' may be specified and an optional pad character
 // may be specified (default is space).
 //
 // Note that this function uses two other library functions,
 // FormatNumber() and PadLeft().
 //
 // Usage: Call the function with an onblur or onchange event
 // attached to the field:
 //
 // onblur="FormatNumberField(this,Decimals,Pad,[Separator],[PadChar])"
 // where Decimals is the number of decimals desired and Pad
 // is the size of the field.
 //
 // Group = Valores: T = true
 // **********************************************************
	//alert("FormatNumberField:");
	if(Object.value == "") {
		Object.value = "0"
	}
	if(Object == null) {
		return(null)
	}
	prepValue(Object,"\\.","",",",".");
	//alert("Object.value:"+Object.value);
	Separator += ""      // Force argument to string.
	if((Separator == "") || (Separator.length > 1)) {
		Separator = ","
	}
	//alert("Object.value:"+Object.value);
	PadChar += ""
	if((PadChar == "") || (!(PadChar.length == 1))) {
		PadChar = " "
	}
	//alert("1 - Object.value: " + Object.value);
	Object.value = FormatNumber(Object.value,Decimals,Separator)
	//alert("2 - Apos FormatNumber Object.value: " + Object.value);
	if (Group.toUpperCase() == "T") {
		Object.value = GroupNumber(Object.value, ".");
		//alert("3 - Object.value:" + Object.value);
	}
	//alert("4 - Object.value: " + Object.value);
	Object.value = PadLeft(Object.value,Pad,PadChar)
	//alert("5 - Object.value: " + Object.value);
	return(Object.value)
}

//
// **********************************************************
// Alexander Flávio de Oliveira
//
// Junho 24, 2003
// Agrupa as casas de milhares do valor separados por GroupSeparator
//
// **********************************************************
function GroupNumber(Number, GroupSeparator) {
	//alert("GroupNumber:" + GroupNumber);
	var number_int, number_str;
	var number_formatted;
	var remainder;
	number_str = Number.substr(0,(Number.length - 3));
	number_formatted = Number.substr((Number.length - 3),3);
	if (number_str.length > 3) {
		number_int = parseInt(number_str);
		while (number_int > 0) {
			remainder = number_int%1000;
			number_int = parseInt(number_int / 1000);
			if (number_int>0) {
				number_formatted = GroupSeparator + Block(remainder.toString(),3,"N") + number_formatted;
			} else {
				number_formatted = remainder.toString() + number_formatted;
			}
		}
	} else {
		number_formatted = Number;
	}
	return number_formatted;
}
//
// **********************************************************
// Alexander Flávio de Oliveira
//
// Junho 24, 2003
// Prepara um valor substituindo caracteres de formatação do valor de um objeto
// **********************************************************
function prepValue(Object,groupSeparatorFrom,groupSeparatorTo,decimalSeparatorFrom,decimalSeparatorTo) {
	Object.value = AllTrim(substitui(Object.value,(new Array(groupSeparatorFrom)),(new Array(groupSeparatorTo)),"g",""));
	Object.value = AllTrim(substitui(Object.value,(new Array(decimalSeparatorFrom)),(new Array(decimalSeparatorTo)),"g",""));
	return true;
}
//

// ************************************************************************************
// Muniz / Marcelo -- Ramal: 1315
//
// Janeiro, 2004
// Prepara valor para calcular uma soma. PASSE A STRING DO VALOR P/ PREPSOMA(S).
// ************************************************************************************
function CampoAux() {
  this.value = " ";
}

function prepSoma(s) {
  campo_aux = new CampoAux();
  campo_aux.value = s;
  prepValue(campo_aux,'\\.','',',','.');
  return Number(campo_aux.value);
}

// ************************************************************************************
// Muniz -- Ramal: 1315
//
// Fevereiro, 2005
// retorna o primeiro dia do mes mes atual do sistema.
//************************************************************************************
function calcPrimeiroDiaMesCorrente() {
  hoje = new Date();

  mes = hoje.getMonth();
  ano = hoje.getYear();

  df = new Date(ano, mes, 01, 00, 00, 00, 00);

  return(df);
}

// NAO UTILIZE ISTO. SERVE APENAS PARA SEGURANÇA - MUNIZ - 16/03/2005
function calcMesAnt() {
  return(calcPrimeiroDiaMesCorrente());
}


//*********************************************************************************************************************
// Muniz -- Ramal: 1315
//
// Fevereiro, 2005
// form = objeto form (formulario que contem o campo)
// coluna = nome da coluna do grid a ser somada. so a parte final sem o numero no final
// totLinha = numero de linhas(registros) que o grid possui.
//
// soma colunas em um grid que o campo e uma parte fixa + um numero. (ex.: campo_1, campo_2, etc)
//*********************************************************************************************************************
function somaColuna(form, coluna, totLinha) {
  var total = 0;

  for (cont=1; cont<=totLinha ; cont++) {
    var campo = form.elements(coluna + cont);
    total += prepSoma(campo.value);
  }

  return(total);
}

//*********************************************************************************************************************
// Muniz -- Ramal: 1315
//
// Fevereiro, 2005
// form = objeto form (formulario que contem o campo)
// coluna1 e coluna2 = nomes das colunas do grid a serem comparadas. so a parte final sem o numero no final
// totLinha = numero de linhas(registros) que o grid possui.
// c = comparador (<,<=,=,>,>=)
//
// Compara se os valores de uma coluna está de acordo com as condições de comparação com a outra. campos numericos
//     Ex.: ver se a coluna "campo_1" e ">=" a "campo_2"
// E utilizada em um grid de EDITS nomeados por uma parte fixa mais um numero de ordem no final (ex.: campo_1, campo_2, etc)
//*********************************************************************************************************************
function comparaColunas(form, coluna1, coluna2, totLinha, c) {
  var aux = true;

  for (cont=1; cont<=totLinha ; cont++) {
    var vrCampo1 = prepSoma(form.elements(coluna1 + cont).value);
    var vrCampo2 = prepSoma(form.elements(coluna2 + cont).value);

    if (!(eval(vrCampo1 + c + vrCampo2))) {
      aux = false;
      form.elements(coluna1 + cont).focus();
      break;
    }
  }

  return(aux);
}


//************************************************************************************
// Muniz -- Ramal: 1315
//
// Fevereiro, 2005
// formata um campo data (MM/AAAA) com as "/"  em tempo de execução. Coloca a mascara no campo
// EX.: onKeyPress="if (!(fMascTempoRealMesAno(this))) return false;"
//************************************************************************************
function fMascTempoRealMesAno(ConteudoCampo) {
  if (((event.keyCode) > 47) && ((event.keyCode) < 58)) {
    NumDig = ConteudoCampo.value;
    TamDig = NumDig.length;
    if (TamDig == 2)
      ConteudoCampo.value = NumDig.substr(0,2) + "/";
    else
      if (TamDig == 6)
        ConteudoCampo.value = NumDig.substr(0,7);
    return(true);
  }
  else return(false)
}


//*********************************************************************************************************************
// Muniz -- Ramal: 1315
//
// Fevereiro, 2005
// formata um campo data (DD/MM/AAAA) com as "/" em tempo de execução. Coloca a mascara no campo
// EX.: onKeyPress="if (!(fMascTempoRealDt(this))) return false;"
//*********************************************************************************************************************
function fMascTempoRealDt(ConteudoCampo) {
  if (((event.keyCode) > 47) && ((event.keyCode) < 58)) {
    NumDig = ConteudoCampo.value;
    TamDig = NumDig.length;
    if (TamDig == 2)
      ConteudoCampo.value = NumDig.substr(0,2) + "/";
    else
      if (TamDig == 5)
        ConteudoCampo.value = NumDig.substr(0,5) + "/";
      else
        if (TamDig == 9)
          ConteudoCampo.value = NumDig.substr(0,10);
    return(true);
  }
  else return(false)
}

//*********************************************************************************************************************
// Muniz -- Ramal: 1315
//
// Maio, 2005
// formata um campo de 9 dígitos e máscara (0.00.00.00.00) com as "." em tempo de execução. Coloca a mascara no campo
// EX.: onKeyPress="if (!(fMascInsumo(this))) return false;"
//*********************************************************************************************************************
function fMascInsumo(ConteudoCampo) {
	if (((event.keyCode) > 47) && ((event.keyCode) < 58)) {
		NumDig = ConteudoCampo.value;
		TamDig = NumDig.length;
		if (TamDig == 1)
			ConteudoCampo.value = NumDig.substr(0,1) + ".";
		else
			if (TamDig == 4)
				ConteudoCampo.value = NumDig.substr(0,4) + ".";
			else
				if (TamDig == 7)
					ConteudoCampo.value = NumDig.substr(0,7) + ".";
				else
					if (TamDig == 10)
						ConteudoCampo.value = NumDig.substr(0,10) + ".";
					else
						if (TamDig == 13)
							ConteudoCampo.value = NumDig.substr(0,13);
		return(true);
	}
	else return(false);
}
//*********************************************************************************************************************
// Bernardo Meyer
//
// Junho, 2005
// Funções para montagem de galeria de imagens. Desenvolvida por Bernardo Meyer em 06/2005 e usada pelo GEM.
// Anexadas ao funcoes.js por Marcelo Lopes em 23/06/2005.
//*********************************************************************************************************************
var existe = "";
function mostraIntranet(valor){
   if( !(w2 instanceof Object) ){
      var w2 = window.open('','Figura','width=300,height=200');
      var d = w2.document; d.open;
      if( ! d.getElementById('Corpo') ) {
         d.write('<title>Janela de Zoom</title><IMG id=Corpo name=Corpo>');
      }
   }
   var vr = new String(valor);
   vr = "g" + vr ;
   if ( existe != "" ) { w2.close ;} ;   existe = "x";   var o = d.getElementById('Corpo');
   var tmp = 'http://intranet-se01/AnexosGem/' + vr;
    o.src = tmp ;
   w2.focus() ;
   }

function limpa(){
   // document.getElementById('figura').width = 0;
   }

   //Função que retorna se uma data é válida ou não
//Entrada: - Data no formato dd/mm/aaaa
//Retorno: - true, caso a data informada seja válida
//	   - false, caso a data informada seja inválida
// Anexada ao funcoes.js por André Luís / Politec em 16/10/2008.
function check_date(DATA) {
        var vdt = new Date();
        var vdia = vdt.getDay();
        var vmes = vdt.getMonth();
        var vano = vdt.getYear();
                var dia = DATA.value.substring(0,2);
                var mes = DATA.value.substring(3,5);
                var ano = DATA.value.substring(6,10);
                if((mes==04 && dia > 30) || (mes==06 && dia > 30) || (mes==09 && dia > 30) || (mes==11 && dia > 30)){
                        return false;
                } else{
                                if(ano%4!=0 && mes==2 && dia>28){
                                        return false;
                                } else{
                                                if(ano%4==0 && mes==2 && dia>29){
                                                                return false;
                                                } else{
                                                                if (ano > vano) {
                                                                                return false;
                                                                }else{
                                                                        return true;
                                                                }
                                                }
                                }
                }
}
