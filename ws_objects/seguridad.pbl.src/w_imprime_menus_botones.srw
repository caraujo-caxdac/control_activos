$PBExportHeader$w_imprime_menus_botones.srw
$PBExportComments$Ventana para la Impresión de las Relaciones entre los Menus y los Botones
forward
global type w_imprime_menus_botones from window
end type
type cb_1 from commandbutton within w_imprime_menus_botones
end type
type cb_2 from commandbutton within w_imprime_menus_botones
end type
type cb_3 from commandbutton within w_imprime_menus_botones
end type
type cb_4 from commandbutton within w_imprime_menus_botones
end type
type mle_1 from multilineedit within w_imprime_menus_botones
end type
type st_3 from statictext within w_imprime_menus_botones
end type
type st_2 from statictext within w_imprime_menus_botones
end type
type salir from picturebutton within w_imprime_menus_botones
end type
type imprimir from picturebutton within w_imprime_menus_botones
end type
type st_1 from statictext within w_imprime_menus_botones
end type
type dw_1 from datawindow within w_imprime_menus_botones
end type
type rr_2 from roundrectangle within w_imprime_menus_botones
end type
type rr_1 from roundrectangle within w_imprime_menus_botones
end type
end forward

global type w_imprime_menus_botones from window
integer x = 5
integer y = 264
integer width = 3538
integer height = 1936
boolean titlebar = true
string title = "Imprimir Relación - Botones..."
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 81324524
string icon = "C:\Muñecos\ICONS\Copia de PRINT00E.ICO"
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
mle_1 mle_1
st_3 st_3
st_2 st_2
salir salir
imprimir imprimir
st_1 st_1
dw_1 dw_1
rr_2 rr_2
rr_1 rr_1
end type
global w_imprime_menus_botones w_imprime_menus_botones

type variables
Long currentpage, totalpages, trabajo
String paginas_total, pagina_actual
Integer codigo_empresa, tipo_impresion

String caja_de_texto
String pagina_inicial, pagina_final
DatawindowChild dw_hija
String exportar_formatos
end variables

on w_imprime_menus_botones.create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
this.mle_1=create mle_1
this.st_3=create st_3
this.st_2=create st_2
this.salir=create salir
this.imprimir=create imprimir
this.st_1=create st_1
this.dw_1=create dw_1
this.rr_2=create rr_2
this.rr_1=create rr_1
this.Control[]={this.cb_1,&
this.cb_2,&
this.cb_3,&
this.cb_4,&
this.mle_1,&
this.st_3,&
this.st_2,&
this.salir,&
this.imprimir,&
this.st_1,&
this.dw_1,&
this.rr_2,&
this.rr_1}
end on

on w_imprime_menus_botones.destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.mle_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.salir)
destroy(this.imprimir)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.rr_2)
destroy(this.rr_1)
end on

event open;dw_1.settransobject(sqlca)
dw_1.retrieve()

exportar_formatos = "S"	
IF dw_1.GetChild("datos",dw_hija) = -1 THEN
	exportar_formatos = "N"
END IF	
dw_hija.SetTransObject(SQLCA)
dw_hija.Retrieve()

dw_1.Object.usuario.text = gb_usuario
gb_name_impresora = dw_1.Describe("Datawindow.Printer")

paginas_total = dw_1.Describe("evaluate('PageCount()',0)")
end event

type cb_1 from commandbutton within w_imprime_menus_botones
integer x = 1573
integer y = 1580
integer width = 402
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Filtrar"
end type

event clicked;String a
SetNull(a)
dw_hija.SetFilter(a)
dw_hija.Filter()
dw_hija.GroupCalc()
end event

type cb_2 from commandbutton within w_imprime_menus_botones
integer x = 1573
integer y = 1676
integer width = 402
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Ordenar"
end type

event clicked;String a
SetNull(a)
dw_hija.SetSort(a)
dw_hija.Sort()
dw_hija.GroupCalc()
end event

type cb_3 from commandbutton within w_imprime_menus_botones
integer x = 1970
integer y = 1580
integer width = 402
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Limpiar"
end type

event clicked;dw_hija.SetRedraw(false)
dw_hija.SetFilter("")
dw_hija.Filter()
dw_hija.SetRedraw(true)
dw_hija.SetRedraw(false)
dw_hija.SetSort("codigo_boton A")
dw_hija.Sort()
dw_hija.SetRedraw(true)
dw_hija.GroupCalc()
end event

type cb_4 from commandbutton within w_imprime_menus_botones
integer x = 1970
integer y = 1676
integer width = 402
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Exportar"
end type

event clicked;String nombre_archivo, named
Boolean condicion
Integer value, rta, value_as
condicion = TRUE
DO WHILE condicion = TRUE
	nombre_archivo = gb_directorio_salida+"\Relacion Menus-Botones de la Aplicacion"
		
	IF DirectoryExists(gb_directorio_salida) THEN
	ELSE
		IF CreateDirectory(gb_directorio_salida) = -1 THEN
			MessageBox("Mensaje...","! No se Pudo Crear Carpeta "+gb_directorio_salida+" ¡",StopSign!)
			RETURN
		END IF	
	END IF
	
	IF exportar_formatos = "N" THEN
		value = GetFileSaveName("Entre el Nombre del Archivo", nombre_archivo, named,"XLS" , &
			"Archivos PDF                          (*.PDF),*.PDF,")
	ELSE
		value = GetFileSaveName("Entre el Nombre del Archivo", nombre_archivo, named,"XLS" , &
			"Archivos Excell                        (*.XLS),*.XLS," + &
			"Archivos Texto                        (*.TXT),*.TXT," + &
			"Archivos PDF                          (*.PDF),*.PDF," + &						
			"Archivos HTML                       (*.HTML),*.HTML," + &		
			"Archivos DBase                      (*.DBF),*.DBF," + &		
			"Archivos Separado por Coma (*.CSV),*.CSV,")
	END IF
		
	String mensj
	Integer resp

	IF value = 0 THEN
		RETURN
	END IF
	
	IF FileExists(nombre_archivo) = TRUE THEN
		rta = MessageBox("CUIDADO...","! El Archivo "+nombre_archivo+" YA EXISTE ¡ ¿ Desea Reemplazarlo ?",Question!,YesNoCancel!,2)
		IF rta = 1 THEN 
			condicion = FALSE
		END IF
		IF rta = 3 THEN
			RETURN
		END IF
	ELSE
		condicion = FALSE
	END IF		
LOOP

//***********************************************************************************//
//*** Extraemos las Tres (3) Ultimas Letras que nos Identifica el Tipo de Archivo ***//
//***********************************************************************************//
Long longitud_named, posicion, cuenta_puntos, longitud_extension
String extension_named, letra, name_file
posicion = 1
cuenta_puntos = 0
longitud_named = LEN(TRIM(named))

DO WHILE posicion <= longitud_named
	letra = MID(TRIM(named),posicion,1)
	IF letra = "." THEN
		cuenta_puntos = cuenta_puntos + 1
	END IF
	IF letra = "'" OR letra = '"' THEN
		cuenta_puntos = cuenta_puntos + 1
	END IF	
	posicion = posicion + 1
LOOP

IF cuenta_puntos > 1 THEN
	MessageBox("Mensaje...","! El Nombre del Archivo Contiene Caracteres No Validos ¡",Exclamation!)
	RETURN
END IF	

posicion = 1
String encuentro
encuentro = "N"
DO WHILE posicion <= longitud_named
	letra = MID(TRIM(named),posicion,1)
	IF letra = "." THEN
		encuentro = "S"
	END IF

	IF encuentro = "S" THEN
		longitud_extension = longitud_extension + 1
	END IF	
	posicion = posicion + 1
LOOP

longitud_extension = longitud_extension - 1

extension_named = RIGHT(TRIM(named),longitud_extension)

CHOOSE CASE extension_named
	CASE "XLS"
		value_as = dw_hija.SaveAs(nombre_archivo,Excel!,TRUE)
	CASE "DBF"
		value_as = dw_hija.SaveAs(nombre_archivo,dBASE3!,TRUE)
	CASE "TXT"
		value_as = dw_hija.SaveAs(nombre_archivo,Text!,TRUE)
	CASE "CSV"
		value_as = dw_hija.SaveAs(nombre_archivo,CSV!,TRUE)
	CASE "PDF"
		dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript=1
		dw_1.Object.DataWindow.Printer="Sybase DataWindow PS"				
		value_as = dw_1.SaveAs(nombre_archivo,PDF!,TRUE)
	CASE "HTML"
		value_as = dw_hija.SaveAs(nombre_archivo,HTMLTable!,TRUE)
END CHOOSE

IF value_as = -1 THEN
	MessageBox("Mensaje...","! Ocurrio un ERROR al Salvar el Archivo... "+TRIM(nombre_archivo)+&
			" ¡",StopSign!)
	RETURN
ELSE
	rta = MessageBox("Mensaje...","! El Archivo... "+TRIM(nombre_archivo)+&
			" se Salvo Correctamente ¡~r~n~r~n¿ Desea Abrir el Archivo ?",Question!,YesNo!,2)
				
	IF rta = 1 THEN
		IF	RUN("rundll32.exe url.dll,FileProtocolHandler "+ nombre_archivo) = -1 THEN
			MessageBox("Mensaje...","! No se Pudo Abrir el Archivo "+nombre_archivo +" ¡",StopSign!)
		END IF	
	END IF	
END IF
//***********************************************************************************//
end event

type mle_1 from multilineedit within w_imprime_menus_botones
integer x = 37
integer y = 1580
integer width = 928
integer height = 224
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "Configure el Tamaño de la Página en 8 1/2 * 11 Pulgadas y en la Posición Vertical."
borderstyle borderstyle = styleshadowbox!
end type

type st_3 from statictext within w_imprime_menus_botones
integer x = 3246
integer y = 1740
integer width = 229
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Salir"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_imprime_menus_botones
integer x = 3017
integer y = 1740
integer width = 229
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Imprimir"
alignment alignment = center!
boolean focusrectangle = false
end type

type salir from picturebutton within w_imprime_menus_botones
integer x = 3259
integer y = 1572
integer width = 183
integer height = 160
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean cancel = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
alignment htextalign = left!
string powertiptext = "Salir"
end type

event clicked;close(w_imprime_menus_botones)
end event

type imprimir from picturebutton within w_imprime_menus_botones
integer x = 3040
integer y = 1568
integer width = 183
integer height = 160
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean default = true
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;open(w_confirma_imp)
string ls_dato, paginas_imp
//long trabajo
long compara_copia, conta = 1
Long longitud
ls_dato = Message.StringParm
st_impresion lst_impresion
lst_impresion = Message.PowerObjectParm
compara_copia = lst_impresion.copia
paginas_imp = lst_impresion.otros
IF lst_impresion.dato = "" THEN
	RETURN
END IF	

//******************************************************//
//*** Si el Radio Button es 1 es decir Imprimir Todo ***//
//******************************************************//
IF lst_impresion.dato = "1" THEN
	tipo_impresion = 1
   FOR conta = 1 TO lst_impresion.copia
 		trabajo = PrintOpen("Reporte Relación Menus - Botones")
		PrintDataWindow(trabajo,dw_1)
		PrintClose(trabajo)
		compara_copia = (compara_copia + 1)
	NEXT
	RETURN
END IF
//******************************************************//

//***************************************************************//
//*** Si el Radio Button es 2 es decir Imprimir Página Actual ***//
//***************************************************************//
IF lst_impresion.dato = "2" THEN
	tipo_impresion = 2
	pagina_actual = dw_1.Describe("evaluate('Page()',0)")
	FOR conta = 1 TO lst_impresion.copia	
		trabajo = PrintOpen("Reporte Relación Menus - Botones")
		PrintDataWindow(trabajo,dw_1)
		PrintClose(trabajo)		
		compara_copia = (compara_copia + 1)
	NEXT	
	RETURN
END IF	
//***************************************************************//
//*****************************************//
//*** 			Caja de Texto 			  	 ***//
//*****************************************//
caja_de_texto = lst_impresion.caja_de_texto
//*****************************************//
IF lst_impresion.dato = "" THEN
	RETURN
END IF	

IF lst_impresion.dato = "3" THEN
	tipo_impresion = 3
	pagina_actual = dw_1.Describe("evaluate('Page()',0)")
	
	Integer array_metidos, saca
	String  saca_string, imprime_val, imprime_array
	String ls_imprimir[]
	paginas_imp = caja_de_texto
	longitud = Len(paginas_imp)
	saca = 1
	imprime_val		= ""
	imprime_array	= ""
	array_metidos  = 0

	DO WHILE saca <= longitud
		saca_string = Mid(paginas_imp,saca,1)
		IF saca_string <> "-" THEN
			IF saca_string = "0" OR saca_string = "1" OR saca_string = "2" OR saca_string = "3" OR &
				saca_string = "4" OR saca_string = "5" OR saca_string = "6" OR saca_string = "7" OR &
				saca_string = "8" OR saca_string = "9" THEN
				imprime_val = imprime_val + saca_string
				imprime_array	= imprime_array + saca_string
				saca = saca + 1
				saca_string = Mid(paginas_imp,saca,1)
			ELSE												// Si el Caracter es el Signo "-" //
				IF saca = 1 THEN							// Primera Posición y el Carácter es Diferente a Número o Sino "-"	//
					MessageBox("Error...","El primer Carácter debe ser un Número o el Signo Menos (-)...",Information!)
					RETURN
				ELSE 
					IF saca_string <> "," THEN
						MessageBox("Error","En la Posición "+String(saca)+" Hay un Caracter no valido ("+saca_string+")",Exclamation!)
						RETURN
					ELSE
						array_metidos = array_metidos + 1
						ls_imprimir[array_metidos]	= 	imprime_array
						imprime_val = imprime_val + saca_string
						imprime_array	= ""
						saca = saca + 1
						saca_string = Mid(paginas_imp,saca,1)
					END IF
				END IF	
			END IF
		ELSE
			imprime_val = imprime_val + saca_string			
			imprime_array	= imprime_array + saca_string
			saca = saca + 1
			saca_string = Mid(paginas_imp,saca,1)
		END IF	
	LOOP
	//************************************************//
	array_metidos = array_metidos + 1	
	ls_imprimir[array_metidos]	= 	imprime_array
	String array_salida, caracter, pag_i, pag_f
	Integer i, inicio, posicion
	caracter = ""
	posicion = 1
	pagina_inicial = ""
	pagina_final   = ""
	pag_i = "N"
	pag_f = "S"
	FOR i = 1 TO array_metidos
		array_salida = ls_imprimir[i]
		//**********************************//
		//***	Sacamos la Página Inicial	***//
		//**********************************//
		DO WHILE posicion <= LEN(array_salida)
			caracter = MID(array_salida, posicion,1)
			IF caracter = "-" AND posicion = 1 THEN
				pagina_inicial = "1"
				pag_i = "S"
				pag_f = "N"
				EXIT
			ELSE
				IF caracter = "-" AND posicion <> 1  THEN
					pag_f = "N"
					EXIT
				END IF	
			END IF	
			pagina_inicial = pagina_inicial + caracter
			posicion = posicion + 1
		LOOP
		//**********************************//
		//***	  Sacamos la Página Final  ***//
		//**********************************//
		IF pag_i = "S" THEN
			posicion = posicion + 1
			DO WHILE posicion <= LEN(array_salida)
				caracter = MID(array_salida, posicion,1)
				pagina_final = pagina_final + caracter
				posicion = posicion + 1
			LOOP									
		ELSE
			posicion = posicion + 1
			IF posicion > LEN(array_salida) THEN
				pagina_final = paginas_total
			ELSE
				DO WHILE posicion <= LEN(array_salida)
					caracter = MID(array_salida, posicion,1)
					pagina_final = pagina_final + caracter
					posicion = posicion + 1
				LOOP						
			END IF
			//*********************************************//
			//*** Cuando es Solo una hoja para Imprimir ***//
			//*********************************************//			
			IF pag_f = "S" THEN
				pagina_final = pagina_inicial
			END IF	
			//*********************************************//			
		END IF
		//********************************************************//
		//*** Imprimimos las Copias Necesarias de este Archivo ***//
		//********************************************************//
	   FOR conta = 1 TO lst_impresion.copia
 			trabajo = PrintOpen("Reporte Relación Menus - Botones")
			PrintDataWindow(trabajo,dw_1)
			PrintClose(trabajo)
			compara_copia = (compara_copia + 1)		
		NEXT
		//********************************************************//
		pag_i = "N"
		pag_f = "S"
		posicion = 1
		pagina_inicial = ""
		pagina_final   = ""		
	NEXT

	RETURN
END IF	
end event

type st_1 from statictext within w_imprime_menus_botones
integer x = 41
integer y = 28
integer width = 3447
integer height = 108
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16711680
long backcolor = 79741120
boolean enabled = false
string text = "Impresión de la Relación Menus - Botones"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_imprime_menus_botones
integer x = 37
integer y = 192
integer width = 3447
integer height = 1300
integer taborder = 10
boolean titlebar = true
string title = "Reporte Relación Menus - Botones..."
string dataobject = "dw_impresion_menus_botones"
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "C:\Muñecos\ICONS\Crdfle07.ico"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event printend;Close(w_estado_impresion)
currentpage = 0
end event

event printstart;gb_printcancel = TRUE
Open(w_estado_impresion)
w_estado_impresion.sle_1.text = "Reporte Relación Menus - Botones"
gb_name_impresora = dw_1.Describe("Datawindow.Printer")
w_estado_impresion.Title = gb_name_impresora
end event

event printpage;//*************************************************//
//*** Parte para manejar el Cancel de Impresión ***//
//*************************************************//
string cancelar
//long trabajo
long compara_copia, conta = 1
String impresion
Long longitud
Integer espacios
//***********************************************//
//*** Si hay que imprimir todo el DataWindows ***//
//***********************************************//
IF tipo_impresion = 1 THEN
	IF gb_printcancel = FALSE THEN
		PrintCancel(trabajo)
		PrintClose(trabajo)
		RETURN
	END IF
	currentpage = currentpage + 1
	impresion = "Página... "+String(currentpage)+" de "+paginas_total
	longitud = Len(impresion)
	IF longitud <= 16 THEN espacios = 28
	IF longitud > 16 AND longitud <= 17 THEN espacios = 27
	IF longitud > 17 AND longitud <= 18 THEN espacios = 26
	IF longitud > 18 AND longitud <= 19 THEN espacios = 25
	IF longitud > 19 THEN espacios = 24
	w_estado_impresion.sle_2.text =Space(espacios)+ "Página... "+String(currentpage)+" de "+paginas_total
END IF	
//***********************************************//

//************************************************************//
//*** Si hay que imprimir la Página Actual del DataWindows ***//
//************************************************************//
IF tipo_impresion = 2 THEN
	IF gb_printcancel = FALSE THEN
		PrintCancel(trabajo)
		PrintClose(trabajo)
		RETURN
	END IF

	currentpage = currentpage + 1
	IF Integer(pagina_actual) = currentpage THEN
		//*** No Salta Página y la Imprime ***//
		impresion = "Página... "+String(currentpage)+" de "+paginas_total
		longitud = Len(impresion)
		IF longitud <= 16 THEN espacios = 28
		IF longitud > 16 AND longitud <= 17 THEN espacios = 27
		IF longitud > 17 AND longitud <= 18 THEN espacios = 26
		IF longitud > 18 AND longitud <= 19 THEN espacios = 25
		IF longitud > 19 THEN espacios = 24
		w_estado_impresion.sle_2.text =Space(espacios)+ "Página... "+String(currentpage)+" de "+paginas_total
		RETURN 0
	ELSE
		//*** Salta la Página para no Imprimirla ***//
		impresion = "Página... "+String(currentpage)+" de "+paginas_total
		longitud = Len(impresion)
		IF longitud <= 16 THEN espacios = 28
		IF longitud > 16 AND longitud <= 17 THEN espacios = 27
		IF longitud > 17 AND longitud <= 18 THEN espacios = 26
		IF longitud > 18 AND longitud <= 19 THEN espacios = 25
		IF longitud > 19 THEN espacios = 24		
		w_estado_impresion.sle_2.text = Space(espacios)+ "Página... "+String(currentpage)+" de "+paginas_total		
		RETURN 1
	END IF	
	impresion = dw_1.Object.impresion.expression
	w_estado_impresion.sle_2.text = "Página... "+String(currentpage)+" de "+paginas_total
END IF	
//***********************************************//

IF tipo_impresion = 3 THEN
	IF gb_printcancel = FALSE THEN
		PrintCancel(trabajo)
		PrintClose(trabajo)
		RETURN
	END IF	
	
	currentpage = currentpage + 1	
	IF currentpage >= Integer(pagina_inicial) AND currentpage <= Integer(pagina_final) THEN
		//*** No Salta Página y la Imprime ***//
		impresion = "Página... "+String(currentpage)+" de "+paginas_total
		longitud = Len(impresion)
		IF longitud <= 16 THEN espacios = 28
		IF longitud > 16 AND longitud <= 17 THEN espacios = 27
		IF longitud > 17 AND longitud <= 18 THEN espacios = 26
		IF longitud > 18 AND longitud <= 19 THEN espacios = 25
		IF longitud > 19 THEN espacios = 24
		w_estado_impresion.sle_2.text =Space(espacios)+ "Página... "+String(currentpage)+" de "+paginas_total
		RETURN 0
	ELSE
		//*** Salta la Página para no Imprimirla ***//
		impresion = "Página... "+String(currentpage)+" de "+paginas_total
		longitud = Len(impresion)
		IF longitud <= 16 THEN espacios = 28
		IF longitud > 16 AND longitud <= 17 THEN espacios = 27
		IF longitud > 17 AND longitud <= 18 THEN espacios = 26
		IF longitud > 18 AND longitud <= 19 THEN espacios = 25
		IF longitud > 19 THEN espacios = 24		
		w_estado_impresion.sle_2.text = Space(espacios)+ "Página... "+String(currentpage)+" de "+paginas_total		
		RETURN 1
	END IF	
	impresion = dw_1.Object.impresion.expression
	w_estado_impresion.sle_2.text = "Página... "+String(currentpage)+" de "+paginas_total	
END IF	
end event

type rr_2 from roundrectangle within w_imprime_menus_botones
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 2985
integer y = 1536
integer width = 507
integer height = 288
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_imprime_menus_botones
long linecolor = 128
integer linethickness = 4
long fillcolor = 65535
integer x = 1554
integer y = 1560
integer width = 841
integer height = 232
integer cornerheight = 40
integer cornerwidth = 46
end type

