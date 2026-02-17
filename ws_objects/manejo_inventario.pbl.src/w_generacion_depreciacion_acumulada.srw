$PBExportHeader$w_generacion_depreciacion_acumulada.srw
forward
global type w_generacion_depreciacion_acumulada from window
end type
type cb_contabilizar from commandbutton within w_generacion_depreciacion_acumulada
end type
type cbx_recalcular from checkbox within w_generacion_depreciacion_acumulada
end type
type st_4 from statictext within w_generacion_depreciacion_acumulada
end type
type st_3 from statictext within w_generacion_depreciacion_acumulada
end type
type limpiar from picturebutton within w_generacion_depreciacion_acumulada
end type
type salir from picturebutton within w_generacion_depreciacion_acumulada
end type
type st_2 from statictext within w_generacion_depreciacion_acumulada
end type
type imprimir from picturebutton within w_generacion_depreciacion_acumulada
end type
type dw_1 from datawindow within w_generacion_depreciacion_acumulada
end type
type st_14 from statictext within w_generacion_depreciacion_acumulada
end type
type generar from picturebutton within w_generacion_depreciacion_acumulada
end type
type st_13 from statictext within w_generacion_depreciacion_acumulada
end type
type st_12 from statictext within w_generacion_depreciacion_acumulada
end type
type ano from editmask within w_generacion_depreciacion_acumulada
end type
type mes from dropdownlistbox within w_generacion_depreciacion_acumulada
end type
type st_1 from statictext within w_generacion_depreciacion_acumulada
end type
type gb_1 from groupbox within w_generacion_depreciacion_acumulada
end type
type rr_3 from roundrectangle within w_generacion_depreciacion_acumulada
end type
end forward

global type w_generacion_depreciacion_acumulada from window
integer x = 5
integer y = 396
integer width = 3054
integer height = 2472
boolean titlebar = true
string title = "Generación y Consulta de la Depreciación Acumulada..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "Database!"
cb_contabilizar cb_contabilizar
cbx_recalcular cbx_recalcular
st_4 st_4
st_3 st_3
limpiar limpiar
salir salir
st_2 st_2
imprimir imprimir
dw_1 dw_1
st_14 st_14
generar generar
st_13 st_13
st_12 st_12
ano ano
mes mes
st_1 st_1
gb_1 gb_1
rr_3 rr_3
end type
global w_generacion_depreciacion_acumulada w_generacion_depreciacion_acumulada

type variables
String codigo_tipo_inventario, descripcion_tipo_inventario
String codigo_clase_de_activo, descripcion_clase_activo
String codigo_marca, descripcion_marca
String codigo_modelo, descripcion_corta
Long fila, cta_filas
DataWindowChild dw_responsable

Double ano_cierre
Integer mes_cierre
String nombre_mes
end variables

on w_generacion_depreciacion_acumulada.create
this.cb_contabilizar=create cb_contabilizar
this.cbx_recalcular=create cbx_recalcular
this.st_4=create st_4
this.st_3=create st_3
this.limpiar=create limpiar
this.salir=create salir
this.st_2=create st_2
this.imprimir=create imprimir
this.dw_1=create dw_1
this.st_14=create st_14
this.generar=create generar
this.st_13=create st_13
this.st_12=create st_12
this.ano=create ano
this.mes=create mes
this.st_1=create st_1
this.gb_1=create gb_1
this.rr_3=create rr_3
this.Control[]={this.cb_contabilizar,&
this.cbx_recalcular,&
this.st_4,&
this.st_3,&
this.limpiar,&
this.salir,&
this.st_2,&
this.imprimir,&
this.dw_1,&
this.st_14,&
this.generar,&
this.st_13,&
this.st_12,&
this.ano,&
this.mes,&
this.st_1,&
this.gb_1,&
this.rr_3}
end on

on w_generacion_depreciacion_acumulada.destroy
destroy(this.cb_contabilizar)
destroy(this.cbx_recalcular)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.limpiar)
destroy(this.salir)
destroy(this.st_2)
destroy(this.imprimir)
destroy(this.dw_1)
destroy(this.st_14)
destroy(this.generar)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.ano)
destroy(this.mes)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.rr_3)
end on

event close;m_principal.m_manejodeactivos.m_generardepreciaciónacumulada.Checked = FALSE
end event

event open;m_principal.m_manejodeactivos.m_generardepreciaciónacumulada.Checked = TRUE

IF gb_usuario <> "sa" THEN
	String codigo_menu_ventana, permiso_ventana
	//******************************************************************************//
	//*** ENTRO A BUSCAR LOS PERMISOS EN LA TABLA usuario_permiso_cta_individual ***//
	//******************************************************************************//
	generar.enabled		= FALSE
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

	codigo_menu_ventana = "M30"
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

		IF Lower(nombre_boton) = "generar" AND permiso_saca = "S" THEN
			generar.Enabled = TRUE
		END IF	
		
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
	CLOSE(w_generacion_depreciacion_acumulada)
	RETURN
END IF

cb_contabilizar.Enabled = FALSE
mes.SetFocus()

//tab_1.tabpage_1.dw_1.SetTransObject(SQLCA)
//tab_1.tabpage_1.dw_1.Retrieve()
end event

type cb_contabilizar from commandbutton within w_generacion_depreciacion_acumulada
integer x = 2322
integer y = 516
integer width = 530
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Contabilizar"
end type

event clicked;Integer rta

rta = Messagebox("Mensaje - Validación...","¿ Desea Realizar el Comprobante de la Causación para "+&
			Trim(nombre_mes)+"/"+String(ano_cierre,"###,###")+" ?",Question!,YesNo!,2)

IF rta = 2 THEN RETURN

w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_contabiliza_depreciacion... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

SetPointer(HourGlass!)

st_error lst_error
lst_error = fx_activos_contabiliza_depreciacion(ano_cierre, mes_cierre)
w_generacion_depreciacion_acumulada.Pointer = "Arrow!"

IF lst_error.codigo_error <> 2 THEN
	MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
	RETURN
END IF

MessageBox("Mensaje - Validación...","! El Procedimiento se Ejecutó Correctamente "+lst_error.valor_1a+" ¡",Information!)

cb_contabilizar.Enabled = FALSE
end event

type cbx_recalcular from checkbox within w_generacion_depreciacion_acumulada
integer x = 1015
integer y = 420
integer width = 389
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Recalcular"
end type

type st_4 from statictext within w_generacion_depreciacion_acumulada
integer x = 2752
integer y = 456
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

type st_3 from statictext within w_generacion_depreciacion_acumulada
integer x = 2510
integer y = 456
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

type limpiar from picturebutton within w_generacion_depreciacion_acumulada
integer x = 2528
integer y = 288
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
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\database_refresh.png"
alignment htextalign = left!
string powertiptext = "Limpiar"
end type

event clicked;
dw_1.settransobject(sqlca)
dw_1.retrieve(0,0)
end event

type salir from picturebutton within w_generacion_depreciacion_acumulada
integer x = 2752
integer y = 288
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
boolean cancel = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
alignment htextalign = left!
string powertiptext = "Salir"
end type

event clicked;CLOSE(w_generacion_depreciacion_acumulada)
end event

type st_2 from statictext within w_generacion_depreciacion_acumulada
integer x = 2258
integer y = 456
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

type imprimir from picturebutton within w_generacion_depreciacion_acumulada
integer x = 2295
integer y = 288
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
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;IF dw_1.RowCount() = 0 THEN
	MessageBox("Mensaje - Validación...","! Debe Cargar la Información antes de Abrir la Ventana de Impresión ¡",StopSign!)
	RETURN
END IF

st_control_activos lst_control_activos

lst_control_activos.ano_cierre = ano_cierre
lst_control_activos.mes_cierre = mes_cierre
lst_control_activos.nombre_mes = nombre_mes

OpenWithParm(w_imprime_causacion_mensual_activo,lst_control_activos)
end event

type dw_1 from datawindow within w_generacion_depreciacion_acumulada
integer x = 41
integer y = 696
integer width = 2939
integer height = 1616
integer taborder = 50
boolean titlebar = true
string title = "Periodo..."
string dataobject = "dw_consulta_depreciacion_mensual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_14 from statictext within w_generacion_depreciacion_acumulada
integer x = 1737
integer y = 456
integer width = 489
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Generar/Consultar"
alignment alignment = center!
boolean focusrectangle = false
end type

type generar from picturebutton within w_generacion_depreciacion_acumulada
integer x = 1888
integer y = 288
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
string picturename = "C:\Muñecos\BITMAPS\accepted_48.png"
alignment htextalign = left!
string powertiptext = "Generar o Consultar"
end type

event clicked;String recalcular_si_no
Long cuenta_filas
Integer rta

IF ano.Text = "" OR mes.Text = "" THEN
	MessageBox("Mensaje - Validación...","¡ Debe Escoger el Mes y el Año a Consultar ¡",StopSign!)
	RETURN
END IF
IF mes.text = "Enero" THEN
	mes_cierre = 1
	nombre_mes = mes.text
END IF
IF mes.text = "Febrero" THEN
	mes_cierre = 2
	nombre_mes = mes.text
END IF
IF mes.text = "Marzo" THEN
	mes_cierre = 3
	nombre_mes = mes.text
END IF
IF mes.text = "Abril" THEN
	mes_cierre = 4
	nombre_mes = mes.text
END IF
IF mes.text = "Mayo" THEN
	mes_cierre = 5
	nombre_mes = mes.text
END IF
IF mes.text = "Junio" THEN
	mes_cierre = 6
	nombre_mes = mes.text
END IF
IF mes.text = "Julio" THEN
	mes_cierre = 7
	nombre_mes = mes.text
END IF
IF mes.text = "Agosto" THEN
	mes_cierre = 8
	nombre_mes = mes.text
END IF
IF mes.text = "Septiembre" THEN
	mes_cierre = 9
	nombre_mes = mes.text
END IF
IF mes.text = "Octubre" THEN
	mes_cierre = 10
	nombre_mes = mes.text
END IF
IF mes.text = "Noviembre" THEN
	mes_cierre = 11
	nombre_mes = mes.text
END IF
IF mes.text = "Diciembre" THEN
	mes_cierre = 12
	nombre_mes = mes.text
END IF

ano.GetData(ano_cierre)

IF Double(String(ano_cierre)+String(mes_cierre,"00")) < 201310 THEN
	MessageBox("Mensaje - Validación...","¡ El Periodo no Puede ser Inferior a 2013/10 ¡",StopSign!)
	RETURN
END IF

IF cbx_recalcular.Checked = TRUE THEN
	recalcular_si_no = "S"
ELSE
	recalcular_si_no = "N"
END IF

SELECT COUNT(*) INTO :cuenta_filas FROM activos_causacion_mensual_encabezado &
	WHERE ano=:ano_cierre AND mes=:mes_cierre;

st_error lst_error
IF cuenta_filas > 0 THEN
	IF recalcular_si_no = "S" THEN
		rta = MessageBox("Mensaje - Validación...","! Ya Existe Información para el Periodo "+&
					nombre_mes+"/"+String(ano_cierre,"###,###")+" ¡"+"~r~n~r~n"+"¿ Desea Reemplazar la Información ?",Question!,YesNo!,2)
					
		IF rta = 2 THEN RETURN
		
		IF Double(String(ano_cierre)+String(mes_cierre,"00")) = 201310 THEN
			w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_calculo_depreciacion_inicial... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
			w_segunda.SetMicrohelp(w_segunda.Tag)

			SetPointer(HourGlass!)

			lst_error = fx_activos_calculo_depreciacion_inicial(ano_cierre, mes_cierre, recalcular_si_no)
			w_generacion_depreciacion_acumulada.Pointer = "Arrow!"

			IF lst_error.codigo_error <> 2 THEN
				MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
				RETURN
			END IF
		ELSE
			w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_calculo_depreciacion... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
			w_segunda.SetMicrohelp(w_segunda.Tag)

			SetPointer(HourGlass!)

			lst_error = fx_activos_calculo_depreciacion(ano_cierre, mes_cierre, recalcular_si_no)
			w_generacion_depreciacion_acumulada.Pointer = "Arrow!"

			IF lst_error.codigo_error <> 2 THEN
				MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
				RETURN
			END IF
		END IF
	ELSE
		rta = MessageBox("Mensaje - Validación...","! Ya Existe Información Calculada para el Periodo "+&
				nombre_mes+"/"+String(mes_cierre,"00")+" ¡"+"~r~n~r~n¿ Desea Consultarla ?",Question!,YesNo!,2)
				
		IF rta = 2 THEN RETURN
	END IF
ELSE
	IF Double(String(ano_cierre)+String(mes_cierre,"00")) = 201310 THEN
		w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_calculo_depreciacion_inicial... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
		w_segunda.SetMicrohelp(w_segunda.Tag)

		SetPointer(HourGlass!)

		lst_error = fx_activos_calculo_depreciacion_inicial(ano_cierre, mes_cierre, recalcular_si_no)
		w_generacion_depreciacion_acumulada.Pointer = "Arrow!"

		IF lst_error.codigo_error <> 2 THEN
			MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
			RETURN
		END IF		
	ELSE
		w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_calculo_depreciacion... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
		w_segunda.SetMicrohelp(w_segunda.Tag)

		SetPointer(HourGlass!)

		lst_error = fx_activos_calculo_depreciacion(ano_cierre, mes_cierre, recalcular_si_no)
		w_generacion_depreciacion_acumulada.Pointer = "Arrow!"

		IF lst_error.codigo_error <> 2 THEN
			MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
			RETURN
		END IF
	END IF
END IF

dw_1.settransobject(sqlca)
dw_1.retrieve(ano_cierre, mes_cierre)

IF dw_1.RowCount() > 0 THEN
	cb_contabilizar.Enabled = TRUE
END IF
end event

type st_13 from statictext within w_generacion_depreciacion_acumulada
integer x = 293
integer y = 424
integer width = 315
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Año..."
boolean focusrectangle = false
end type

type st_12 from statictext within w_generacion_depreciacion_acumulada
integer x = 293
integer y = 304
integer width = 315
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Mes..."
boolean focusrectangle = false
end type

type ano from editmask within w_generacion_depreciacion_acumulada
integer x = 631
integer y = 408
integer width = 361
integer height = 92
integer taborder = 40
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

type mes from dropdownlistbox within w_generacion_depreciacion_acumulada
integer x = 631
integer y = 292
integer width = 741
integer height = 392
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;ano.SetFocus()
end event

type st_1 from statictext within w_generacion_depreciacion_acumulada
integer x = 59
integer y = 52
integer width = 2912
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
string text = "Generación y Consulta de la Depreciación Acumulada"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_generacion_depreciacion_acumulada
integer x = 69
integer y = 232
integer width = 2921
integer height = 424
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Datos de Entrada..."
end type

type rr_3 from roundrectangle within w_generacion_depreciacion_acumulada
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 12639424
integer x = 23
integer y = 28
integer width = 2976
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

