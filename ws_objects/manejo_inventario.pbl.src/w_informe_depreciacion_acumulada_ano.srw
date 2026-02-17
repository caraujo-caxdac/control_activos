$PBExportHeader$w_informe_depreciacion_acumulada_ano.srw
$PBExportComments$Ventana para la Impresión de la Depreciación Acumulada por Año
forward
global type w_informe_depreciacion_acumulada_ano from window
end type
type cbx_1 from checkbox within w_informe_depreciacion_acumulada_ano
end type
type st_6 from statictext within w_informe_depreciacion_acumulada_ano
end type
type st_5 from statictext within w_informe_depreciacion_acumulada_ano
end type
type st_4 from statictext within w_informe_depreciacion_acumulada_ano
end type
type limpiar from picturebutton within w_informe_depreciacion_acumulada_ano
end type
type mle_1 from multilineedit within w_informe_depreciacion_acumulada_ano
end type
type salir from picturebutton within w_informe_depreciacion_acumulada_ano
end type
type imprimir from picturebutton within w_informe_depreciacion_acumulada_ano
end type
type st_3 from statictext within w_informe_depreciacion_acumulada_ano
end type
type ano from editmask within w_informe_depreciacion_acumulada_ano
end type
type st_2 from statictext within w_informe_depreciacion_acumulada_ano
end type
type st_12 from statictext within w_informe_depreciacion_acumulada_ano
end type
type mes_final from dropdownlistbox within w_informe_depreciacion_acumulada_ano
end type
type mes_inicial from dropdownlistbox within w_informe_depreciacion_acumulada_ano
end type
type st_1 from statictext within w_informe_depreciacion_acumulada_ano
end type
type gb_1 from groupbox within w_informe_depreciacion_acumulada_ano
end type
type rr_3 from roundrectangle within w_informe_depreciacion_acumulada_ano
end type
type rr_1 from roundrectangle within w_informe_depreciacion_acumulada_ano
end type
end forward

global type w_informe_depreciacion_acumulada_ano from window
integer x = 5
integer y = 396
integer width = 3063
integer height = 1244
boolean titlebar = true
string title = "Informe Depreciación Acumulada por Año..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "DataPipeline!"
cbx_1 cbx_1
st_6 st_6
st_5 st_5
st_4 st_4
limpiar limpiar
mle_1 mle_1
salir salir
imprimir imprimir
st_3 st_3
ano ano
st_2 st_2
st_12 st_12
mes_final mes_final
mes_inicial mes_inicial
st_1 st_1
gb_1 gb_1
rr_3 rr_3
rr_1 rr_1
end type
global w_informe_depreciacion_acumulada_ano w_informe_depreciacion_acumulada_ano

type variables
String saca_debaja_si_no
end variables

on w_informe_depreciacion_acumulada_ano.create
this.cbx_1=create cbx_1
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.limpiar=create limpiar
this.mle_1=create mle_1
this.salir=create salir
this.imprimir=create imprimir
this.st_3=create st_3
this.ano=create ano
this.st_2=create st_2
this.st_12=create st_12
this.mes_final=create mes_final
this.mes_inicial=create mes_inicial
this.st_1=create st_1
this.gb_1=create gb_1
this.rr_3=create rr_3
this.rr_1=create rr_1
this.Control[]={this.cbx_1,&
this.st_6,&
this.st_5,&
this.st_4,&
this.limpiar,&
this.mle_1,&
this.salir,&
this.imprimir,&
this.st_3,&
this.ano,&
this.st_2,&
this.st_12,&
this.mes_final,&
this.mes_inicial,&
this.st_1,&
this.gb_1,&
this.rr_3,&
this.rr_1}
end on

on w_informe_depreciacion_acumulada_ano.destroy
destroy(this.cbx_1)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.limpiar)
destroy(this.mle_1)
destroy(this.salir)
destroy(this.imprimir)
destroy(this.st_3)
destroy(this.ano)
destroy(this.st_2)
destroy(this.st_12)
destroy(this.mes_final)
destroy(this.mes_inicial)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.rr_3)
destroy(this.rr_1)
end on

event open;m_principal.m_manejodeactivos.m_reportes.m_depreciaciónacumulada.Checked = TRUE

IF gb_usuario <> "sa" THEN
	String codigo_menu_ventana, permiso_ventana
	//******************************************************************************//
	//*** ENTRO A BUSCAR LOS PERMISOS EN LA TABLA usuario_permiso_cta_individual ***//
	//******************************************************************************//
	//generar.enabled		= FALSE
	//traer.enabled		= FALSE
	//insertar.enabled	= FALSE
	//grabar.enabled		= FALSE
	//eliminar.enabled	= FALSE
	salir.enabled		= FALSE
	imprimir.enabled	= FALSE
	limpiar.enabled 	= FALSE
	permiso_ventana   = "N"
	w_segunda.Tag = "Ejecuntando CURSOR activa_botones... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	String nombre_boton
	String permiso_saca, boton_saca

	codigo_menu_ventana = "M50"
	Any activa_botones
	DECLARE activa_botones CURSOR FOR SELECT codigo_boton, permiso_si_no FROM usuario_permiso_activos_fijos &
			WHERE login = :gb_usuario AND codigo_menu = :codigo_menu_ventana;

	IF SQLCA.SQLCode = -1 Then 
		MessageBox("SQL Error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" Error Declarando CURSOR activa_botones !!!",StopSign!)
	   RETURN
	END IF

	OPEN activa_botones;

	IF SQLCA.SQLCode = -1 Then 
		MessageBox("SQL Error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" Error Abriendo CURSOR activa_botones !!!",StopSign!)
	   CLOSE activa_botones;	
   	RETURN
	END IF	

	FETCH activa_botones INTO :boton_saca, :permiso_saca;

	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" Error Fetch CURSOR activa_botones !!!",StopSign!)
		CLOSE activa_botones;
   	RETURN
	END IF	

	DO WHILE SQLCA.SQLDBCode <> 2     
  		IF SQLCA.SQLDBCode = 1 THEN    
	     	EXIT
   	END IF

		SELECT descripcion_boto INTO :nombre_boton FROM botones_activos_fijos &
				WHERE codigo_boton = :boton_saca;
				
		IF boton_saca = "WIN" AND permiso_saca = "S" THEN
			permiso_ventana   = "S"
		END IF

		//IF Lower(nombre_boton) = "generar" AND permiso_saca = "S" THEN
		//	generar.Enabled = TRUE
		//END IF	
		
//		IF Lower(nombre_boton) = "insertar" AND permiso_saca = "S" THEN
//			insertar.Enabled = TRUE
//		END IF
		
//		IF Lower(nombre_boton) = "grabar" AND permiso_saca = "S" THEN
//			grabar.Enabled = TRUE
//		END IF
		
//		IF Lower(nombre_boton) = "eliminar" AND permiso_saca = "S" THEN
//			eliminar.Enabled = TRUE
//		END IF
		
		IF Lower(nombre_boton) = "salir" AND permiso_saca = "S" THEN
			salir.Enabled = TRUE
		END IF

		IF Lower(nombre_boton) = "imprimir" AND permiso_saca = "S" THEN
			imprimir.Enabled = TRUE
		END IF

		IF Lower(nombre_boton) = "limpiar" AND permiso_saca = "S" THEN
			limpiar.Enabled = TRUE
		END IF
	
		FETCH activa_botones INTO :boton_saca, :permiso_saca;

		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" Error Fetch CURSOR activa_botones !!!",StopSign!)
			CLOSE activa_botones;
		   RETURN
		END IF				
	LOOP		
	CLOSE activa_botones;
	//******************************************************************************//
END IF	

IF permiso_ventana   = "N" THEN
	MessageBox("Mensaje de Seguridad...","! NO TIENE PERMISOS PARA INGRESAR A ESTA VENTANA ¡",StopSign!)
	CLOSE(w_informe_depreciacion_acumulada_ano)
	RETURN
END IF


ano.SetFocus()

cbx_1.Checked = FALSE
saca_debaja_si_no = "N"

//tab_1.tabpage_1.dw_1.SetTransObject(SQLCA)
//tab_1.tabpage_1.dw_1.Retrieve()
end event

event close;m_principal.m_manejodeactivos.m_reportes.m_depreciaciónacumulada.Checked = FALSE
end event

type cbx_1 from checkbox within w_informe_depreciacion_acumulada_ano
integer x = 2002
integer y = 496
integer width = 823
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Quitar Activos dados de Baja"
end type

type st_6 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 2752
integer y = 1020
integer width = 183
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Salir"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 2519
integer y = 1020
integer width = 229
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Limpiar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 2263
integer y = 1020
integer width = 261
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Imprimir"
alignment alignment = center!
boolean focusrectangle = false
end type

type limpiar from picturebutton within w_informe_depreciacion_acumulada_ano
integer x = 2514
integer y = 852
integer width = 183
integer height = 160
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\database_refresh.png"
alignment htextalign = left!
string powertiptext = "Limpiar"
end type

event clicked;ano.Text = ""
end event

type mle_1 from multilineedit within w_informe_depreciacion_acumulada_ano
integer x = 46
integer y = 840
integer width = 1129
integer height = 252
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
string text = "Ventana para Generar la Depreciación Acumulada por Años de los Activos de la Empresa."
borderstyle borderstyle = styleshadowbox!
end type

type salir from picturebutton within w_informe_depreciacion_acumulada_ano
integer x = 2743
integer y = 852
integer width = 183
integer height = 160
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
boolean cancel = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
alignment htextalign = left!
string powertiptext = "Salir"
end type

event clicked;CLOSE(w_informe_depreciacion_acumulada_ano)
end event

type imprimir from picturebutton within w_informe_depreciacion_acumulada_ano
integer x = 2286
integer y = 852
integer width = 183
integer height = 160
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
boolean default = true
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;String recalcular_si_no
Long cuenta_filas
Integer rta
Integer ano_periodo, mes_cierre_inicial, mes_cierre_final
String nombre_mes_inicial, nombre_mes_final

IF ano.Text = "" OR mes_inicial.Text = "" OR mes_final.Text = "" THEN
	MessageBox("Mensaje - Validación...","¡ Debe Escoger el Mes y el Año a Consultar ¡",StopSign!)
	RETURN
END IF

IF cbx_1.Checked = TRUE THEN
	saca_debaja_si_no = "S"
ELSE
	saca_debaja_si_no = "N"
END IF


IF mes_inicial.Text = "Enero" THEN
	mes_cierre_inicial = 1
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Febrero" THEN
	mes_cierre_inicial = 2
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Marzo" THEN
	mes_cierre_inicial = 3
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Abril" THEN
	mes_cierre_inicial = 4
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Mayo" THEN
	mes_cierre_inicial = 5
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Junio" THEN
	mes_cierre_inicial = 6
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Julio" THEN
	mes_cierre_inicial = 7
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Agosto" THEN
	mes_cierre_inicial = 8
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Septiembre" THEN
	mes_cierre_inicial = 9
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Octubre" THEN
	mes_cierre_inicial = 10
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Noviembre" THEN
	mes_cierre_inicial = 11
	nombre_mes_inicial = mes_inicial.Text
END IF
IF mes_inicial.Text = "Diciembre" THEN
	mes_cierre_inicial = 12
	nombre_mes_inicial = mes_inicial.Text
END IF

IF mes_final.Text = "Enero" THEN
	mes_cierre_final = 1
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Febrero" THEN
	mes_cierre_final = 2
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Marzo" THEN
	mes_cierre_final = 3
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Abril" THEN
	mes_cierre_final = 4
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Mayo" THEN
	mes_cierre_final = 5
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Junio" THEN
	mes_cierre_final = 6
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Julio" THEN
	mes_cierre_final = 7
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Agosto" THEN
	mes_cierre_final = 8
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Septiembre" THEN
	mes_cierre_final = 9
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Octubre" THEN
	mes_cierre_final = 10
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Noviembre" THEN
	mes_cierre_final = 11
	nombre_mes_final = mes_final.Text
END IF
IF mes_final.Text = "Diciembre" THEN
	mes_cierre_final = 12
	nombre_mes_final = mes_final.Text
END IF

ano_periodo = Integer(String(ano.Text))

IF mes_cierre_inicial > mes_cierre_final THEN
	MessageBox("Mensaje - Validación...","¡ El Periodo Inicial no Puede Ser SUPERIOR al Final ¡",StopSign!)
	RETURN
END IF

IF Double(String(ano_periodo)+String(mes_cierre_inicial,"00")) <= 201310 THEN
	MessageBox("Mensaje - Validación...","¡ El Periodo no Puede ser Inferior Igual a 2013/10 ¡",StopSign!)
	RETURN
END IF


rta = MessageBox("Mensaje - Validación...","! Desea Calcular el Año "+String(ano_periodo,"###,###")+&
			" Para el Periodo "+nombre_mes_inicial+" a "+nombre_mes_final+" ?",Question!,YesNo!,2)
				
IF rta = 2 THEN RETURN

st_error lst_error
w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_calculo_depreciacion_anual... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

SetPointer(HourGlass!)

lst_error = fx_activos_calculo_depreciacion_anual(ano_periodo, mes_cierre_inicial, mes_cierre_final,saca_debaja_si_no)
w_informe_depreciacion_acumulada_ano.Pointer = "Arrow!"

IF lst_error.codigo_error <> 2 THEN
	MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
	RETURN
END IF

st_control_activos lst_control_activos

lst_control_activos.ano_cierre = ano_periodo
lst_control_activos.mes_cierre = mes_cierre_inicial
lst_control_activos.nombre_mes = nombre_mes_inicial
lst_control_activos.mes_cierre_2 = mes_cierre_final
lst_control_activos.nombre_mes_2 = nombre_mes_final

OpenWithParm(w_imprime_causacion_acumulada_ano_01,lst_control_activos)
end event

type st_3 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 279
integer y = 312
integer width = 297
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Añol..."
boolean focusrectangle = false
end type

type ano from editmask within w_informe_depreciacion_acumulada_ano
integer x = 603
integer y = 304
integer width = 361
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###,###"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "2013~~2050"
end type

type st_2 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 1042
integer y = 408
integer width = 361
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Mes Final..."
boolean focusrectangle = false
end type

type st_12 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 279
integer y = 408
integer width = 361
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Mes Inicial..."
boolean focusrectangle = false
end type

type mes_final from dropdownlistbox within w_informe_depreciacion_acumulada_ano
integer x = 1042
integer y = 484
integer width = 741
integer height = 392
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 8388608
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ano.SetFocus()
end event

type mes_inicial from dropdownlistbox within w_informe_depreciacion_acumulada_ano
integer x = 270
integer y = 484
integer width = 741
integer height = 392
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 8388608
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;mes_final.SetFocus()
end event

type st_1 from statictext within w_informe_depreciacion_acumulada_ano
integer x = 59
integer y = 40
integer width = 2935
integer height = 104
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 8388608
long backcolor = 12639424
boolean enabled = false
string text = "Informe de la Depreciación Acumulada por Año"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_informe_depreciacion_acumulada_ano
integer x = 178
integer y = 224
integer width = 2711
integer height = 464
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Datos de Entrada... "
end type

type rr_3 from roundrectangle within w_informe_depreciacion_acumulada_ano
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 12639424
integer x = 23
integer y = 16
integer width = 2999
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_informe_depreciacion_acumulada_ano
long linecolor = 8388608
integer linethickness = 4
long fillcolor = 1073741824
integer x = 2217
integer y = 824
integer width = 763
integer height = 272
integer cornerheight = 40
integer cornerwidth = 46
end type

