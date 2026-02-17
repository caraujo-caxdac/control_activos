$PBExportHeader$w_trasladar_activos.srw
$PBExportComments$Ventana para Traladar los Activos de una Persona a Otra
forward
global type w_trasladar_activos from window
end type
type tab_1 from tab within w_trasladar_activos
end type
type tabpage_1 from userobject within tab_1
end type
type st_6 from statictext within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type cbx_1 from checkbox within tabpage_1
end type
type st_5 from statictext within tabpage_1
end type
type em_1 from editmask within tabpage_1
end type
type st_4 from statictext within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type salir from picturebutton within tabpage_1
end type
type st_3 from statictext within tabpage_1
end type
type generar from picturebutton within tabpage_1
end type
type dw_7 from datawindow within tabpage_1
end type
type st_13 from statictext within tabpage_1
end type
type st_12 from statictext within tabpage_1
end type
type dw_6 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_6 st_6
dw_1 dw_1
cbx_1 cbx_1
st_5 st_5
em_1 em_1
st_4 st_4
st_2 st_2
salir salir
st_3 st_3
generar generar
dw_7 dw_7
st_13 st_13
st_12 st_12
dw_6 dw_6
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tab_1 from tab within w_trasladar_activos
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type st_1 from statictext within w_trasladar_activos
end type
type rr_3 from roundrectangle within w_trasladar_activos
end type
end forward

global type w_trasladar_activos from window
integer x = 5
integer y = 396
integer width = 3776
integer height = 1648
boolean titlebar = true
string title = "Consulta del Inventario..."
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "Database!"
tab_1 tab_1
st_1 st_1
rr_3 rr_3
end type
global w_trasladar_activos w_trasladar_activos

type variables
String codigo_tipo_inventario, descripcion_tipo_inventario
String codigo_clase_de_activo, descripcion_clase_activo
String codigo_marca, descripcion_marca
String codigo_modelo, descripcion_corta
Integer placa_inventario
Long fila, cta_filas
DataWindowChild dw_responsable, dw_hijo_dw_6, dw_hijo_dw_7, dw_hijo_dw_1

String clase_documento_saca, descripcion_tercero_saca
Double identificacion_saca

String clase_documento_entra, descripcion_tercero_entra, codigo_ubicacion
Double identificacion_entra
Date fecha_cambio
end variables

on w_trasladar_activos.create
this.tab_1=create tab_1
this.st_1=create st_1
this.rr_3=create rr_3
this.Control[]={this.tab_1,&
this.st_1,&
this.rr_3}
end on

on w_trasladar_activos.destroy
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.rr_3)
end on

event close;m_principal.m_manejodeactivos.m_trasladarlosactivosdeunapersonaaotra.Checked = FALSE
end event

event open;m_principal.m_manejodeactivos.m_trasladarlosactivosdeunapersonaaotra.Checked = TRUE

IF gb_usuario <> "sa" THEN
	String codigo_menu_ventana, permiso_ventana
	//******************************************************************************//
	//*** ENTRO A BUSCAR LOS PERMISOS EN LA TABLA usuario_permiso_cta_individual ***//
	//******************************************************************************//
	tab_1.tabpage_1.generar.enabled		= FALSE
	//traer.enabled		= FALSE
	//insertar.enabled	= FALSE
	//limpiar.enabled 	= FALSE
	tab_1.tabpage_1.salir.enabled 	= FALSE	
	permiso_ventana   = "N"
	w_segunda.Tag = "Ejecuntando CURSOR activa_botones... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	String nombre_boton
	String permiso_saca, boton_saca

	codigo_menu_ventana = "M75"
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
			tab_1.tabpage_1.generar.Enabled = TRUE
		END IF	
		
//		IF Lower(nombre_boton) = "insertar" AND permiso_saca = "S" THEN
//			insertar.Enabled = TRUE
//		END IF
		
//		IF Lower(nombre_boton) = "grabar" AND permiso_saca = "S" THEN
//			tab_1.tabpage_5.grabar.Enabled = TRUE
//		END IF
//		
//		IF Lower(nombre_boton) = "eliminar" AND permiso_saca = "S" THEN
//			tab_1.tabpage_5.eliminar.Enabled = TRUE
//		END IF
//		
		IF Lower(nombre_boton) = "salir" AND permiso_saca = "S" THEN
			tab_1.tabpage_1.salir.Enabled = TRUE
		END IF							
//
//		IF Lower(nombre_boton) = "imprimir" AND permiso_saca = "S" THEN
//			tab_1.tabpage_5.imprimir.Enabled = TRUE
//		END IF					

//		IF Lower(nombre_boton) = "limpiar" AND permiso_saca = "S" THEN
//			limpiar.Enabled = TRUE
//		END IF			
	
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
	CLOSE(w_trasladar_activos)
	RETURN
END IF

tab_1.tabpage_1.cbx_1.Checked = TRUE
tab_1.tabpage_2.Enabled = FALSE

tab_1.tabpage_1.dw_6.SetFocus()

//tab_1.tabpage_1.dw_1.SetTransObject(SQLCA)
//tab_1.tabpage_1.dw_1.Retrieve()
end event

event resize;IF this.width > 3840 THEN
	//Title
	rr_3.width = this.width - 400
	st_1.width = this.width - 800
	rr_3.x = 150
	st_1.x = 170
	
	//tab_1
	tab_1.x = 100
	tab_1.width = newwidth  - 220
	tab_1.height = newheight - 400
	
	//tab_1.tabpage_1.dw_2
	tab_1.tabpage_2.dw_2.width = newwidth  - 200
	tab_1.tabpage_2.dw_2.height = newheight - 500
END IF

IF this.width <= 3840 THEN
	//Title
	rr_3.width = 3671
	st_1.width = 3424
	rr_3.x = 50
	st_1.x = 174
	
	//tab_1
	tab_1.width = 3671
	tab_1.height = 1204
	tab_1.x = 50
	
	//tab_1.tabpage_1.dw_2
	tab_1.tabpage_2.dw_2.width = 3566
	tab_1.tabpage_2.dw_2.height = 1016
END IF
end event

type tab_1 from tab within w_trasladar_activos
integer x = 50
integer y = 308
integer width = 3671
integer height = 1204
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long backcolor = 16777215
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3634
integer height = 1076
long backcolor = 16777215
string text = "Datos de Entrada para Cambiar"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "ArrangeIcons!"
long picturemaskcolor = 536870912
string powertiptext = "Tipos de Inventarios"
st_6 st_6
dw_1 dw_1
cbx_1 cbx_1
st_5 st_5
em_1 em_1
st_4 st_4
st_2 st_2
salir salir
st_3 st_3
generar generar
dw_7 dw_7
st_13 st_13
st_12 st_12
dw_6 dw_6
end type

on tabpage_1.create
this.st_6=create st_6
this.dw_1=create dw_1
this.cbx_1=create cbx_1
this.st_5=create st_5
this.em_1=create em_1
this.st_4=create st_4
this.st_2=create st_2
this.salir=create salir
this.st_3=create st_3
this.generar=create generar
this.dw_7=create dw_7
this.st_13=create st_13
this.st_12=create st_12
this.dw_6=create dw_6
this.Control[]={this.st_6,&
this.dw_1,&
this.cbx_1,&
this.st_5,&
this.em_1,&
this.st_4,&
this.st_2,&
this.salir,&
this.st_3,&
this.generar,&
this.dw_7,&
this.st_13,&
this.st_12,&
this.dw_6}
end on

on tabpage_1.destroy
destroy(this.st_6)
destroy(this.dw_1)
destroy(this.cbx_1)
destroy(this.st_5)
destroy(this.em_1)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.salir)
destroy(this.st_3)
destroy(this.generar)
destroy(this.dw_7)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.dw_6)
end on

type st_6 from statictext within tabpage_1
integer x = 64
integer y = 528
integer width = 617
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Ubicación..."
boolean focusrectangle = false
end type

type dw_1 from datawindow within tabpage_1
integer x = 718
integer y = 504
integer width = 1431
integer height = 96
integer taborder = 30
string dataobject = "dddw_hija_ubicaciones_oficina"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.InsertRow(0)
dw_1.GetChild("codigo_ubicacion",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()
end event

event itemchanged;codigo_ubicacion = data
end event

type cbx_1 from checkbox within tabpage_1
integer x = 64
integer y = 820
integer width = 1234
integer height = 64
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 16777215
string text = "Trasladar Totalmente los Activos a Cargo"
boolean lefttext = true
end type

event clicked;IF tab_1.tabpage_1.cbx_1.Checked = TRUE THEN
	tab_1.tabpage_1.generar.Enabled = TRUE
	tab_1.tabpage_2.Enabled = FALSE
ELSE
	tab_1.tabpage_1.generar.Enabled = FALSE
	tab_1.tabpage_2.Enabled = TRUE
END IF
end event

type st_5 from statictext within tabpage_1
integer x = 1243
integer y = 676
integer width = 407
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "(dd/mm/yyyy)"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within tabpage_1
integer x = 718
integer y = 664
integer width = 494
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_4 from statictext within tabpage_1
integer x = 64
integer y = 684
integer width = 576
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Fecha para Traslado..."
boolean focusrectangle = false
end type

type st_2 from statictext within tabpage_1
integer x = 2981
integer y = 540
integer width = 187
integer height = 52
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

type salir from picturebutton within tabpage_1
integer x = 2967
integer y = 348
integer width = 197
integer height = 164
integer taborder = 70
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
string powertiptext = "Cerrar Ventana"
end type

event clicked;Close(w_trasladar_activos)
end event

type st_3 from statictext within tabpage_1
integer x = 2578
integer y = 516
integer width = 393
integer height = 124
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Trasladar Información"
alignment alignment = center!
boolean focusrectangle = false
end type

type generar from picturebutton within tabpage_1
integer x = 2674
integer y = 344
integer width = 197
integer height = 164
integer taborder = 60
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
string powertiptext = "Trasladar Información"
end type

event clicked;Integer rta

IF tab_1.tabpage_2.dw_2.RowCount()= 0 THEN
	MessageBox("Mensaje - Validación...","! No Hay Información para Trasladar de "+&
				trim(descripcion_tercero_saca)+" ¡",StopSign!)
	RETURN	
END IF

tab_1.tabpage_1.em_1.GetData(fecha_cambio)

IF IsNull(fecha_cambio) OR String(fecha_cambio,"dd/mm/yyyy")="01/01/1900" THEN
	MessageBox("Mensaje - Validación...","! No Hace Falta la Fecha para Trasladar ¡",StopSign!)
	RETURN
END IF

IF IsNull(codigo_ubicacion) or Len(Trim(codigo_ubicacion)) < 3 THEN 
	MessageBox("Mensaje - Validación...","¡ No hay Ubicación seleccionada para trasladar de "+&
				trim(descripcion_tercero_saca)+" !",StopSign!)
	RETURN	
END IF

rta = MessageBox("Mensaje - Validación...","¿ Desea Trasladar los Activos de "+trim(descripcion_tercero_saca)+&
			" a "+Trim(descripcion_tercero_entra)+" ?",Question!,YesNo!,2)
			
IF rta = 2 THEN RETURN

w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_trasladar_de_persona_a_persona... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

SetPointer(HourGlass!)

st_error lst_error
lst_error = fx_activos_trasladar_de_person_a_person(clase_documento_saca,identificacion_saca,clase_documento_entra,identificacion_entra,fecha_cambio,codigo_ubicacion)

w_trasladar_activos.Pointer = "Arrow!"

IF lst_error.codigo_error <> 2 THEN
	MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
	RETURN
END IF

MessageBox("Mensaje - Validación...","! El Procedimiento activos_trasladar_de_persona_a_persona se Ejecutó Correctamente ¡",Information!)
end event

type dw_7 from datawindow within tabpage_1
integer x = 718
integer y = 344
integer width = 1431
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "dw_child_consulta_responsables_01"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_7.InsertRow(0)
dw_7.GetChild("descripcion_tercero",dw_hijo_dw_7)
dw_hijo_dw_7.SetTransObject(SQLCA)
dw_hijo_dw_7.Retrieve()
end event

event itemchanged;clase_documento_entra  		= dw_hijo_dw_7.GetItemString(dw_hijo_dw_7.GetRow(),"clase_documento")
identificacion_entra  		= dw_hijo_dw_7.GetItemNumber(dw_hijo_dw_7.GetRow(),"identificacion")
descripcion_tercero_entra	= dw_hijo_dw_7.GetItemString(dw_hijo_dw_7.GetRow(),"descripcion_tercero")

end event

type st_13 from statictext within tabpage_1
integer x = 64
integer y = 368
integer width = 617
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Empleado sin Activos..."
boolean focusrectangle = false
end type

type st_12 from statictext within tabpage_1
integer x = 64
integer y = 208
integer width = 617
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Empleado con Activos..."
boolean focusrectangle = false
end type

type dw_6 from datawindow within tabpage_1
integer x = 718
integer y = 184
integer width = 1431
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dw_child_consulta_responsables_01"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_6.InsertRow(0)
dw_6.GetChild("descripcion_tercero",dw_hijo_dw_6)
dw_hijo_dw_6.SetTransObject(SQLCA)
dw_hijo_dw_6.Retrieve()
end event

event itemchanged;clase_documento_saca  		= dw_hijo_dw_6.GetItemString(dw_hijo_dw_6.GetRow(),"clase_documento")
identificacion_saca  		= dw_hijo_dw_6.GetItemNumber(dw_hijo_dw_6.GetRow(),"identificacion")
descripcion_tercero_saca	= dw_hijo_dw_6.GetItemString(dw_hijo_dw_6.GetRow(),"descripcion_tercero")

tab_1.tabpage_2.dw_2.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_2.Retrieve(clase_documento_saca,identificacion_saca)

tab_1.tabpage_1.dw_7.SetFocus()


end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3634
integer height = 1076
long backcolor = 16777215
string text = "Inventario Trasladado"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "CheckIn!"
long picturemaskcolor = 536870912
string powertiptext = "Clases de Activos"
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
integer x = 37
integer y = 40
integer width = 3566
integer height = 1016
integer taborder = 20
string title = "none"
string dataobject = "dw_consulta_inventario_persona"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF fila > 0 THEN
	tab_1.tabpage_2.dw_2.SelectRow(fila, FALSE)
	fila = GetClickedRow()
	IF fila < 1 THEN 
		MessageBox("Mensaje...","! Por Favor Dar Clicked sobre la fila ¡",Exclamation!)
		RETURN
	END IF	
	tab_1.tabpage_2.dw_2.SelectRow(fila, TRUE)
//ELSE
//	fila = GetClickedRow()
//	IF fila < 1 THEN 
//		MessageBox("Mensaje...","! Por Favor Dar Clicked sobre la fila ¡",Exclamation!)
//		RETURN
//	END IF
//	tab_1.tabpage_2.dw_2.SelectRow(fila, TRUE)
END IF	
end event

event doubleclicked;//String codigo_tipo_inventario, codigo_clase_de_activo, codigo_marca, codigo_modelo, placa_inventario
Integer rta
st_error lst_error

IF tab_1.tabpage_2.dw_2.RowCount() = 0 THEN
	MessageBox("Mensaje - Validación...","! No Existe Filas para Trasladar ¡",StopSign!)
	RETURN
END IF

tab_1.tabpage_1.em_1.GetData(fecha_cambio)

IF IsNull(fecha_cambio) OR String(fecha_cambio,"dd/mm/yyyy")="01/01/1900" THEN
	MessageBox("Mensaje - Validación...","! No Hace Falta la Fecha para Trasladar ¡",StopSign!)
	RETURN
END IF

IF IsNull(codigo_ubicacion) or Len(Trim(codigo_ubicacion)) < 3 THEN 
	MessageBox("Mensaje - Validación...","¡ No hay Ubicación seleccionada para trasladar de "+&
				trim(descripcion_tercero_saca)+" !",StopSign!)
	RETURN	
END IF

codigo_tipo_inventario			= tab_1.tabpage_2.dw_2.Object.Data[row,1]
descripcion_tipo_inventario	= tab_1.tabpage_2.dw_2.Object.Data[row,2]
codigo_clase_de_activo			= tab_1.tabpage_2.dw_2.Object.Data[row,3]
descripcion_clase_activo		= tab_1.tabpage_2.dw_2.Object.Data[row,4]
codigo_marca						= tab_1.tabpage_2.dw_2.Object.Data[row,5]
descripcion_marca					= tab_1.tabpage_2.dw_2.Object.Data[row,6]
codigo_modelo						= tab_1.tabpage_2.dw_2.Object.Data[row,7]
descripcion_corta					= tab_1.tabpage_2.dw_2.Object.Data[row,8]
placa_inventario					= tab_1.tabpage_2.dw_2.Object.Data[row,9]

IF dwo.Name = "codigo_ubicacion" THEN 
	rta = MessageBox("Mensaje - Validación...","¿ Desea cambiar la Ubicación de "+Trim(descripcion_tercero_saca)+&
				" a "+Trim(descripcion_tercero_entra)+" ? el Siguiente Activo :"+"~r~n~r~n"+&
				"...Tipo de Inventario : "+Trim(descripcion_tipo_inventario)+"~r~n"+&
				"...Clase de Activo : "+Trim(descripcion_clase_activo)+"~r~n"+&
				"...Descripción Corta : "+Trim(descripcion_corta),Question!,YesNo!,2)
				
	IF rta = 2 THEN RETURN
	
	lst_error = fx_activos_trasladar_de_per_a_per_2_ubica(clase_documento_saca,identificacion_saca,clase_documento_entra,identificacion_entra,fecha_cambio,&
					codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo,placa_inventario,codigo_ubicacion)
	
ELSE
	rta = MessageBox("Mensaje - Validación...","¿ Desea Trasladar de "+Trim(descripcion_tercero_saca)+&
				" a "+Trim(descripcion_tercero_entra)+" ? el Siguiente Activo :"+"~r~n~r~n"+&
				"...Tipo de Inventario : "+Trim(descripcion_tipo_inventario)+"~r~n"+&
				"...Clase de Activo : "+Trim(descripcion_clase_activo)+"~r~n"+&
				"...Descripción Corta : "+Trim(descripcion_corta),Question!,YesNo!,2)
				
	IF rta = 2 THEN RETURN			
	
	w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_trasladar_de_persona_a_persona_2... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	
	SetPointer(HourGlass!)
	
	
	lst_error = fx_activos_trasladar_de_per_a_per_2(clase_documento_saca,identificacion_saca,clase_documento_entra,identificacion_entra,fecha_cambio,&
					codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo,placa_inventario,codigo_ubicacion)
	
	w_trasladar_activos.Pointer = "Arrow!"
	
	IF lst_error.codigo_error <> 2 THEN
		MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
		RETURN
	END IF
END IF

MessageBox("Mensaje - Validación...","! El Procedimiento activos_trasladar_de_persona_a_persona_2 se Ejecutó Correctamente ¡",Information!)

tab_1.tabpage_2.dw_2.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_2.Retrieve(clase_documento_saca,identificacion_saca)
end event

type st_1 from statictext within w_trasladar_activos
integer x = 174
integer y = 52
integer width = 3424
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
string text = "Trasladar Activos"
alignment alignment = center!
boolean focusrectangle = false
end type

type rr_3 from roundrectangle within w_trasladar_activos
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 12639424
integer x = 50
integer y = 28
integer width = 3671
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

