$PBExportHeader$w_confirma_imp.srw
forward
global type w_confirma_imp from window
end type
type dw_empresion from datawindow within w_confirma_imp
end type
type st_8 from statictext within w_confirma_imp
end type
type st_7 from statictext within w_confirma_imp
end type
type st_6 from statictext within w_confirma_imp
end type
type pb_3 from picturebutton within w_confirma_imp
end type
type pb_2 from picturebutton within w_confirma_imp
end type
type pb_1 from picturebutton within w_confirma_imp
end type
type em_1 from editmask within w_confirma_imp
end type
type st_5 from statictext within w_confirma_imp
end type
type st_4 from statictext within w_confirma_imp
end type
type st_3 from statictext within w_confirma_imp
end type
type st_2 from statictext within w_confirma_imp
end type
type st_1 from statictext within w_confirma_imp
end type
type sle_1 from singlelineedit within w_confirma_imp
end type
type rb_3 from radiobutton within w_confirma_imp
end type
type rb_2 from radiobutton within w_confirma_imp
end type
type rb_1 from radiobutton within w_confirma_imp
end type
type gb_1 from groupbox within w_confirma_imp
end type
type rr_1 from roundrectangle within w_confirma_imp
end type
end forward

shared variables
datawindow dw_1
end variables

global type w_confirma_imp from window
integer x = 517
integer y = 264
integer width = 1897
integer height = 1408
boolean titlebar = true
string title = "Configurar Impresión..."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 81324524
string icon = "C:\Muñecos\ICONS\printer_48.ico"
boolean center = true
dw_empresion dw_empresion
st_8 st_8
st_7 st_7
st_6 st_6
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
em_1 em_1
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
sle_1 sle_1
rb_3 rb_3
rb_2 rb_2
rb_1 rb_1
gb_1 gb_1
rr_1 rr_1
end type
global w_confirma_imp w_confirma_imp

type variables
datawindow dw
end variables

on w_confirma_imp.create
this.dw_empresion=create dw_empresion
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.em_1=create em_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.rb_3=create rb_3
this.rb_2=create rb_2
this.rb_1=create rb_1
this.gb_1=create gb_1
this.rr_1=create rr_1
this.Control[]={this.dw_empresion,&
this.st_8,&
this.st_7,&
this.st_6,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.em_1,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.rb_3,&
this.rb_2,&
this.rb_1,&
this.gb_1,&
this.rr_1}
end on

on w_confirma_imp.destroy
destroy(this.dw_empresion)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.em_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.rb_3)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.gb_1)
destroy(this.rr_1)
end on

event open;//String name_impresora
//dw_name_impresora = Message.PowerObjectParm
//name_impresora = dw_name_impresora.Describe("Datawindow.Printer")
//name_impresora = dw_name_impresora.Object.Datawindow.Printer
st_3.Text = gb_name_impresora

dw_empresion.settransobject(sqlca)
dw_empresion.retrieve()

dw_empresion.Visible = FALSE

gb_name_impresora = dw_empresion.Describe("Datawindow.Printer")

st_3.Text = gb_name_impresora

//string impre
//
//dw=Message.PowerObjectParm
//impre = dw.Describe("DataWindow.Printer")
//st_3.Text = impre


end event

type dw_empresion from datawindow within w_confirma_imp
integer x = 87
integer y = 1116
integer width = 1042
integer height = 180
integer taborder = 50
string title = "none"
string dataobject = "dw_para_impresion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type st_8 from statictext within w_confirma_imp
integer x = 1440
integer y = 1088
integer width = 302
integer height = 76
integer textsize = -10
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

type st_7 from statictext within w_confirma_imp
integer x = 1440
integer y = 812
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Impresora"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_confirma_imp
integer x = 1440
integer y = 548
integer width = 302
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Aceptar"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_confirma_imp
integer x = 1504
integer y = 384
integer width = 174
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean default = true
string picturename = "C:\Muñecos\ICONS\WEB\accepted_48.png"
string powertiptext = "Mandar Trabajo a la Impresora"
end type

event clicked;long trabajo
string dato
// Asigno la structura lst_impresion a la variable lst_impresion
st_impresion lst_impresion
/*********************************/
/*** Opción del Radio Button 1 ***/
/*********************************/
IF rb_1.checked = TRUE THEN
	sle_1.text = ""
	dato = "1"
	/*** Asigno datos a lst_impresion ***/
	lst_impresion.dato  = "1"
	lst_impresion.ini   = 0
	lst_impresion.fin   = 0
	lst_impresion.copia = long(em_1.text)
END IF
/*********************************/

/*********************************/
/*** Opción del Radio Button 2 ***/
/*********************************/
IF rb_2.checked = TRUE THEN
	sle_1.text = ""
	dato = "2"
	/*** Asigno datos a lst_impresion ***/
	lst_impresion.dato  = "2"
	lst_impresion.ini   = 0
	lst_impresion.fin   = 0
	lst_impresion.copia = long(em_1.text)
END IF
/*********************************/

/*********************************/
/*** Opción del Radio Button 3 ***/
/*********************************/
IF rb_3.checked = TRUE THEN
	IF sle_1.text = "" THEN
		MessageBox("Error...","Señale que Páginas desea Imprimir....")
		RETURN
	END IF
	//************************************************//
	//*** VALIDACION DE DATOS DE ENTRADA DEL SLE_1 ***//
	//************************************************//	
	Integer array_metidos
	Long longitud, saca
	String paginas_imp, saca_string, imprime_val, imprime_array
	paginas_imp = sle_1.text
	longitud = Len(paginas_imp)
	saca = 1
	imprime_val		= ""
	imprime_array	= ""
	array_metidos  = 0
	String ls_imprimir[]
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
						//ls_imprimir = {imprime_array}
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
	//ls_imprimir = {imprime_array}
	ls_imprimir[array_metidos]	= 	imprime_array
	String array_salida
	Integer i,j
	//MessageBox("Mensaje...","Texto a Imprimir... "+imprime_val+"~r~nArreglos Metidos..."+String(array_metidos),Information!)
	FOR i = 1 TO array_metidos
		array_salida = ls_imprimir[i]
		//MessageBox("Mensaje...","Arreglo... ("+String(i)+") ... "+array_salida,Information!)
	NEXT
	lst_impresion.caja_de_texto = imprime_val
	
	/*** Asigno datos a lst_impresion ***/
	lst_impresion.dato  = "3"
	lst_impresion.ini   = 0
	lst_impresion.fin   = 0
	lst_impresion.copia = long(em_1.text)
	lst_impresion.otros = sle_1.text	
	
END IF
closewithreturn(parent,lst_impresion)


end event

type pb_2 from picturebutton within w_confirma_imp
integer x = 1504
integer y = 916
integer width = 174
integer height = 156
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean cancel = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
string powertiptext = "Cancelar Impresión"
end type

event clicked;st_impresion lst_impresion
lst_impresion.dato  = ""
lst_impresion.ini   = 0
lst_impresion.fin   = 0
lst_impresion.copia = 1
closewithreturn(parent,lst_impresion)
end event

type pb_1 from picturebutton within w_confirma_imp
integer x = 1504
integer y = 640
integer width = 174
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\ICONS\WEB\printer_48.png"
alignment htextalign = left!
string powertiptext = "Configurar Impresión"
end type

event clicked;PrintSetup()

dw_empresion.settransobject(sqlca)
dw_empresion.retrieve()

gb_name_impresora = dw_empresion.Describe("Datawindow.Printer")

st_3.Text = gb_name_impresora
//DataWindow dw_name_impresora
//dw_name_impresora.settransobject()
//dw_name_impresora.retrieve()
//dw_name_impresora = Message.PowerObjectParm
//name_impresora = dw_name_impresora.Describe("Datawindow.Printer")
//name_impresora = dw_name_impresora.Object.Datawindow.Printer
//st_3.Text = name_impresora


//if PrintSetup( ) = -1 then
//	MessageBox("Error!","No se pudo ejecutar PrintSetup")
//   return
//else
//   st_3.Text = dw.Describe("DataWindow.Printer")
//   dw.Modify ("Datawindow.Print.Preview =Yes")
//End if
end event

type em_1 from editmask within w_confirma_imp
integer x = 439
integer y = 264
integer width = 306
integer height = 100
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
string minmax = "1~~100"
end type

event modified;//em_1.text = "1"
end event

event constructor;em_1.text = "1"
end event

type st_5 from statictext within w_confirma_imp
integer x = 91
integer y = 1000
integer width = 969
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "separado por comas.  Por ejemplo, 2,5,8-10"
boolean focusrectangle = false
end type

type st_4 from statictext within w_confirma_imp
integer x = 91
integer y = 924
integer width = 1152
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Entre  el número  de  página y/o el rango de páginas"
boolean focusrectangle = false
end type

type st_3 from statictext within w_confirma_imp
integer x = 439
integer y = 116
integer width = 1399
integer height = 136
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

event constructor;//string name_impresora
//name_impresora = dw.Describe("Datawindow.Printer")
//st_3.Text = name_impresora
end event

type st_2 from statictext within w_confirma_imp
integer x = 119
integer y = 116
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Impresora :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_confirma_imp
integer x = 119
integer y = 284
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
boolean enabled = false
string text = "Copias..."
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_confirma_imp
integer x = 530
integer y = 748
integer width = 704
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event constructor;sle_1.enabled = FALSE
end event

type rb_3 from radiobutton within w_confirma_imp
integer x = 114
integer y = 752
integer width = 489
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 79741120
string text = "Páginas..."
end type

event clicked;sle_1.enabled = TRUE
end event

type rb_2 from radiobutton within w_confirma_imp
integer x = 114
integer y = 660
integer width = 489
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 79741120
string text = "Página Actual"
end type

event clicked;sle_1.text = ""
sle_1.enabled = FALSE
end event

type rb_1 from radiobutton within w_confirma_imp
integer x = 119
integer y = 568
integer width = 247
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 79741120
string text = "Todo"
boolean checked = true
end type

event clicked;sle_1.text = ""
sle_1.enabled = FALSE
end event

type gb_1 from groupbox within w_confirma_imp
integer x = 64
integer y = 456
integer width = 1230
integer height = 648
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "Rango de Páginas..."
end type

type rr_1 from roundrectangle within w_confirma_imp
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1394
integer y = 324
integer width = 393
integer height = 868
integer cornerheight = 40
integer cornerwidth = 46
end type

