$PBExportHeader$w_menus_botones.srw
$PBExportComments$Ventana para Relacionar los Botones con los Menus
forward
global type w_menus_botones from window
end type
type dw_2 from datawindow within w_menus_botones
end type
type st_3 from statictext within w_menus_botones
end type
type mle_1 from multilineedit within w_menus_botones
end type
type st_2 from statictext within w_menus_botones
end type
type imprimir from picturebutton within w_menus_botones
end type
type st_1 from statictext within w_menus_botones
end type
type st_6 from statictext within w_menus_botones
end type
type limpiar from picturebutton within w_menus_botones
end type
type st_5 from statictext within w_menus_botones
end type
type salir from picturebutton within w_menus_botones
end type
type st_9 from statictext within w_menus_botones
end type
type st_8 from statictext within w_menus_botones
end type
type st_7 from statictext within w_menus_botones
end type
type eliminar from picturebutton within w_menus_botones
end type
type grabar from picturebutton within w_menus_botones
end type
type insertar from picturebutton within w_menus_botones
end type
type dw_1 from datawindow within w_menus_botones
end type
type rr_2 from roundrectangle within w_menus_botones
end type
type rr_1 from roundrectangle within w_menus_botones
end type
type rr_3 from roundrectangle within w_menus_botones
end type
type rr_4 from roundrectangle within w_menus_botones
end type
end forward

global type w_menus_botones from window
integer x = 5
integer y = 396
integer width = 2510
integer height = 1472
boolean titlebar = true
string title = "Relación Menus - Botones..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
string icon = "C:\Muñecos\ICONS\Tool5.ico"
dw_2 dw_2
st_3 st_3
mle_1 mle_1
st_2 st_2
imprimir imprimir
st_1 st_1
st_6 st_6
limpiar limpiar
st_5 st_5
salir salir
st_9 st_9
st_8 st_8
st_7 st_7
eliminar eliminar
grabar grabar
insertar insertar
dw_1 dw_1
rr_2 rr_2
rr_1 rr_1
rr_3 rr_3
rr_4 rr_4
end type
global w_menus_botones w_menus_botones

type variables
Long fila, cta_filas
DataWindowChild dw_hijo_dw_1, dw_hijo_dw_2
String codigo_linea, codigo_boton
String descripcion, descripcion_boton
end variables

on w_menus_botones.create
this.dw_2=create dw_2
this.st_3=create st_3
this.mle_1=create mle_1
this.st_2=create st_2
this.imprimir=create imprimir
this.st_1=create st_1
this.st_6=create st_6
this.limpiar=create limpiar
this.st_5=create st_5
this.salir=create salir
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.eliminar=create eliminar
this.grabar=create grabar
this.insertar=create insertar
this.dw_1=create dw_1
this.rr_2=create rr_2
this.rr_1=create rr_1
this.rr_3=create rr_3
this.rr_4=create rr_4
this.Control[]={this.dw_2,&
this.st_3,&
this.mle_1,&
this.st_2,&
this.imprimir,&
this.st_1,&
this.st_6,&
this.limpiar,&
this.st_5,&
this.salir,&
this.st_9,&
this.st_8,&
this.st_7,&
this.eliminar,&
this.grabar,&
this.insertar,&
this.dw_1,&
this.rr_2,&
this.rr_1,&
this.rr_3,&
this.rr_4}
end on

on w_menus_botones.destroy
destroy(this.dw_2)
destroy(this.st_3)
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.imprimir)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.limpiar)
destroy(this.st_5)
destroy(this.salir)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.eliminar)
destroy(this.grabar)
destroy(this.insertar)
destroy(this.dw_1)
destroy(this.rr_2)
destroy(this.rr_1)
destroy(this.rr_3)
destroy(this.rr_4)
end on

event open;m_principal.m_seguridad.m_operaciones.m_relaciónmenús-botones.Checked = TRUE
//dw_1.settransobject(sqlca)
//dw_1.retrieve()
cta_filas = dw_1.RowCount()
end event

event close;m_principal.m_seguridad.m_operaciones.m_relaciónmenús-botones.Checked = FALSE
end event

type dw_2 from datawindow within w_menus_botones
integer x = 539
integer y = 228
integer width = 1659
integer height = 96
integer taborder = 10
string dataobject = "dw_menus_child"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_2.InsertRow(0)
dw_2.GetChild("descripcion_menu",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()

end event

event itemchanged;codigo_linea  = dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"codigo_menu")
descripcion = dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"descripcion_menu")
//********************************************//
//*** ENTRA A CARGAR LOS DATOS DE LA LINEA ***//
//********************************************//
dw_1.settransobject(sqlca)
dw_1.retrieve(codigo_linea)
cta_filas = dw_1.RowCount()
IF cta_filas < 1 THEN
	MessageBox("Mensaje...","! El Menu "+TRIM(descripcion)+" No Tiene Botones Asociados ¡",Information!)
	dw_2.Enabled=TRUE	
ELSE
	dw_2.Enabled=FALSE
END IF	
//********************************************//
end event

type st_3 from statictext within w_menus_botones
integer x = 247
integer y = 236
integer width = 265
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Menú ..."
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_menus_botones
integer x = 18
integer y = 1084
integer width = 731
integer height = 268
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Manejo de las Relaciones entre los Menus y los Botones de las Ventanas."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_menus_botones
integer x = 1641
integer y = 1284
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

type imprimir from picturebutton within w_menus_botones
integer x = 1659
integer y = 1112
integer width = 183
integer height = 160
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;IF dw_1.RowCount() < 1 THEN
	MessageBox("Mensaje...","! No Hay Información para Imprimir ¡",Information!)
	RETURN
END IF	

w_segunda.Tag = "Generando Reporte de las Relaciones entre los Menus y los Botones... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

Open(w_imprime_menus_botones)
end event

type st_1 from statictext within w_menus_botones
integer x = 69
integer y = 40
integer width = 2373
integer height = 92
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 32896
boolean enabled = false
string text = "Relación de Menús - Botones"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_menus_botones
integer x = 2007
integer y = 1284
integer width = 219
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
string text = "Limpiar"
alignment alignment = center!
boolean focusrectangle = false
end type

type limpiar from picturebutton within w_menus_botones
integer x = 2021
integer y = 1112
integer width = 183
integer height = 160
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\database_refresh.png"
string powertiptext = "Limpiar"
end type

event clicked;dw_2.Enabled=TRUE
dw_2.InsertRow(0)
dw_2.GetChild("descripcion_menu",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()


dw_1.settransobject(sqlca)
dw_1.retrieve("")
cta_filas = dw_1.RowCount()

end event

type st_5 from statictext within w_menus_botones
integer x = 2231
integer y = 1284
integer width = 183
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

type salir from picturebutton within w_menus_botones
integer x = 2226
integer y = 1112
integer width = 183
integer height = 160
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean cancel = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
string powertiptext = "Salir"
end type

event clicked;IF dw_1.ModifiedCount() + dw_1.DeletedCount() > 0 THEN
	//**********************************************************************************//
	//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
	//**********************************************************************************//

	//**************************************************//
	//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
	//**************************************************//

	String descripcion_menu_boton

	//*****************************************************************//
	//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
	//*****************************************************************//
	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje...","! No se Aceptaron todos los Cambios ¡",StopSign!)
		RETURN
	END IF
	//*****************************************************************//

	//********************************************//
	//*** CAPTURA DE LOS DATOS DEL DATAWINDOWS ***//
	//********************************************//
	IF fila < 1 THEN
		MessageBox("Mensaje...","! Tiene que dar Click a la Fila ¡",Information!)
		RETURN
	END IF	
	descripcion_menu_boton	= dw_1.GetItemString(fila,"descripcion_relacion")
	codigo_boton				= dw_1.GetItemString(fila,"codigo_boton")
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_linea)
	dw_1.SetItem(fila,2,codigo_boton)
	dw_1.SetItem(fila,3,descripcion_menu_boton)
	//*********************************************************//
	
	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	
	Integer res
	res = MessageBox("Mensaje...","¿ Desea Salvar los Cambios Realizados ?",Question!,YesNo!,2)
	IF res = 2 THEN
		Close(w_menus_botones)
	ELSE
		Integer acepto
		acepto = dw_1.AcceptText()
		IF acepto > 0 THEN
			dw_1.Update()
			MessageBox("Mensaje...","! Se ha Actualizado la Báse de Datos ¡",Information!)
			Close(w_menus_botones)
		ELSE
			MessageBox("Mensaje...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
			Close(w_menus_botones)
		END IF	
	END IF	
ELSE	
	Close(w_menus_botones)
END IF	
end event

type st_9 from statictext within w_menus_botones
integer x = 1390
integer y = 1284
integer width = 219
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
string text = "Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_menus_botones
integer x = 1120
integer y = 1284
integer width = 219
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
string text = "Grabar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_menus_botones
integer x = 841
integer y = 1284
integer width = 219
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
string text = "Insertar"
alignment alignment = center!
boolean focusrectangle = false
end type

type eliminar from picturebutton within w_menus_botones
integer x = 1403
integer y = 1112
integer width = 183
integer height = 160
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\data_table.png"
string powertiptext = "Eliminar"
end type

event clicked;IF fila < 1 THEN
	MessageBox("Mensaje...","! Escoja la Fila a Eliminar ¡",Information!)
	RETURN
END IF	

String descripcion_menu_boton

descripcion_menu_boton	= dw_1.GetItemString(fila,"descripcion_relacion")   


string mensj
integer resp, codigo_busca
Integer  net
net = MessageBox("Mensaje...","¿ Está Seguro de Eliminar esta Relación "+TRIM(descripcion_menu_boton)+" ?",Question!,YesNo!,2)

IF net = 2 THEN
	RETURN
ELSE
	IF dw_1.DeleteRow(fila) = -1 then
		Messagebox("Mensaje...","! Error al Eliminar la Fila ¡",StopSign!)
		dw_1.settransobject(sqlca)
		dw_1.retrieve(codigo_linea)	
		cta_filas = dw_1.RowCount()
	ELSE
		dw_1.Update()		
		dw_1.settransobject(sqlca)
		dw_1.retrieve(codigo_linea)	
		MessageBox("Mensaje...","! Se ha Eliminado un Registro de la Báse de Datos ¡",Information!)
		cta_filas = dw_1.RowCount()
	END IF	
END IF
end event

type grabar from picturebutton within w_menus_botones
integer x = 1129
integer y = 1112
integer width = 183
integer height = 160
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\database_save.png"
string powertiptext = "Actualizar Datos"
end type

event clicked;IF dw_1.RowCount() < 1 THEN
	MessageBox("Mensaje...","! No Hay Información para Grabar ¡",Information!)
	RETURN
END IF	
//**********************************************************************************//
//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
//**********************************************************************************//

//**************************************************//
//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
//**************************************************//

String descripcion_menu_boton

//*****************************************************************//
//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
//*****************************************************************//
IF dw_1.AcceptText() = 1 THEN

ELSE	
	MessageBox("Mensaje...","! No se Aceptaron todos los Cambios ¡",StopSign!)
	RETURN
END IF
//*****************************************************************//

//********************************************//
//*** CAPTURA DE LOS DATOS DEL DATAWINDOWS ***//
//********************************************//
IF fila < 1 THEN
	MessageBox("Mensaje...","! Tiene que dar Click a la Fila ¡",Information!)
	RETURN
END IF	
descripcion_menu_boton	= dw_1.GetItemString(fila,"descripcion_relacion")
codigo_boton				= dw_1.GetItemString(fila,"codigo_boton")

IF IsNull(codigo_boton) OR codigo_boton = "" THEN
	MessageBox("Mensaje...","! Hace Falta el Código para "+descripcion_menu_boton+" ¡",Information!)
	RETURN
END IF	

//*********************************************************//
//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
//*********************************************************//
dw_1.SetItem(fila,1,codigo_linea)
dw_1.SetItem(fila,2,codigo_boton)
dw_1.SetItem(fila,3,descripcion_menu_boton)
//*********************************************************//

//*****************************************************************//
//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
//*****************************************************************//
Integer acepto
Integer rtn 

rtn = dw_1.Update(True, True)
IF rtn = 1 THEN
	COMMIT USING SQLCA;
	MessageBox("Mensaje...","! La Báse de Datos ha sido Actualizada ¡",Information!)
	dw_1.settransobject(sqlca)
	dw_1.retrieve(codigo_linea)	
	cta_filas = dw_1.RowCount()	
ELSE
	ROLLBACK USING SQLCA;
	MessageBox("Mensaje...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
	dw_1.settransobject(sqlca)
	dw_1.retrieve(codigo_linea)	
	cta_filas = dw_1.RowCount()
END IF
//*****************************************************************//
end event

type insertar from picturebutton within w_menus_botones
integer x = 850
integer y = 1112
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
string picturename = "c:\bitmaps\adiciona.bmp"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;Long scroll
IF cta_filas = dw_1.RowCount() THEN
	dw_1.InsertRow(0)
	scroll = dw_1.RowCount() + 1
	dw_1.scrolltorow(scroll)
	dw_1.setcolumn(2)
	dw_1.setfocus()
ELSE
	//**********************************************************************************//
	//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
	//**********************************************************************************//

	//**************************************************//
	//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
	//**************************************************//
	String descripcion_menu_boton
	//*****************************************************************//
	//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
	//*****************************************************************//
	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje...","! No se Aceptaron todos los Cambios ¡",StopSign!)
		RETURN
	END IF
	//*****************************************************************//

	//********************************************//
	//*** CAPTURA DE LOS DATOS DEL DATAWINDOWS ***//
	//********************************************//
	IF fila < 1 THEN
		MessageBox("Mensaje...","! Tiene que dar Click a la Fila ¡",Information!)
		RETURN
	END IF	
	descripcion_menu_boton	= dw_1.GetItemString(fila,"descripcion_relacion")
	codigo_boton				= dw_1.GetItemString(fila,"codigo_boton")
	IF IsNull(codigo_boton) OR codigo_boton = "" THEN
		MessageBox("Mensaje...","! Hace Falta el Código para "+descripcion_menu_boton+" ¡",Information!)
		RETURN
	END IF	
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_linea)
	dw_1.SetItem(fila,2,codigo_boton)
	dw_1.SetItem(fila,3,descripcion_menu_boton)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer rtn 

	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje...","! No se Aceptaron todos los Cambios ¡",StopSign!)
		RETURN
	END IF
	scroll = dw_1.RowCount() + 1
	dw_1.InsertRow(0)
	dw_1.scrolltorow(scroll)
	dw_1.setcolumn(2)
	dw_1.setfocus()
	//*****************************************************************//
END IF	
end event

type dw_1 from datawindow within w_menus_botones
integer x = 46
integer y = 360
integer width = 2391
integer height = 700
integer taborder = 20
string dataobject = "dw_menu_boton"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;fila = dw_1.GetClickedRow( )

end event

event itemchanged;codigo_boton  		= dw_hijo_dw_2.GetItemString(dw_hijo_dw_2.GetRow(),"codigo_boton")
descripcion_boton = dw_hijo_dw_2.GetItemString(dw_hijo_dw_2.GetRow(),"descripcion_boto")

//MessageBox("Mensaje...","El Código del Boton es... "+codigo_boton,Information!)

end event

event doubleclicked;//IF dw_1.RowCount() < 1 THEN RETURN
//w_segunda.Tag = "Cargando Datos de la A.F.P.... "+ dw_1.Object.Data[row,3] + string(today(),"dd/mm/yyyy  hh:mm:ss")
//w_segunda.SetMicrohelp(w_segunda.Tag)				
//
////Open(w_salarios)
////*********************************************************//
////*** ASIGNO LA POSICION DEL REGISTRO EN EL DATAWINDOWS ***//
////*********************************************************//
//long ll_row
//ll_row=dw_1.GetRow()
//
//Long cuenta_afiliados
//Integer codigo_cuenta
//String name_afp
//name_afp = dw_1.Object.Data[row,3]
//codigo_cuenta = dw_1.GetItemNumber(row,"codigo_afp")
//SELECT COUNT(*) INTO :cuenta_afiliados FROM afiliados WHERE cod_afp = :codigo_cuenta;
//IF cuenta_afiliados = 0 THEN
//	MessageBox("Mensaje...","La A.F.P. "+name_afp+"~r~nNo Tiene Afiliados Trasladados en la Báse de Datos!!!",Information!)
//	RETURN
//END IF	
//
//
////*********************************************************//
////string ls_dato
////ls_dato = Message.StringParm
//st_afp_afiliados lst_afp
////lst_salarios.identificacion = cedula_afiliado
//lst_afp.afp = dw_1.GetItemNumber(row,"codigo_afp")
//lst_afp.nombre_afp = dw_1.Object.Data[row,3]
////lst_salarios.cod_sigla = dw_1.Object.Data[row,8]
////lst_salarios.fecha_ingreso = dw_1.GetItemDateTime(row,"historia_laboral_fecha_ingreso")
////lst_salarios.fecha_retiro  = dw_1.GetItemDateTime(row,"historia_laboral_fecha_retiro")
//
//OpenWithParm(w_afp_afiliados,lst_afp)
////*********************************************************//
////*****************************************//
////*** RECIBIMOS LOS DATOS DE LA ESTRUCTURA ***//
////*****************************************//
//lst_afp = Message.PowerObjectParm
////*****************************************//
//
end event

event rbuttondown;IF dw_1.RowCount() < 1 THEN RETURN
end event

event retrieveend;w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(This.Tag)
end event

event retrievestart;w_segunda.Tag = "Cargando Datos de las A.F.P.... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)				

end event

event constructor;dw_1.InsertRow(0)
dw_1.GetChild("codigo_boton",dw_hijo_dw_2)
dw_hijo_dw_2.SetTransObject(SQLCA)
dw_hijo_dw_2.Retrieve()

end event

type rr_2 from roundrectangle within w_menus_botones
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1943
integer y = 1076
integer width = 521
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_menus_botones
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 782
integer y = 1076
integer width = 1134
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_menus_botones
integer linethickness = 5
long fillcolor = 32896
integer x = 23
integer y = 16
integer width = 2459
integer height = 144
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_menus_botones
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 79741120
integer x = 197
integer y = 204
integer width = 2034
integer height = 144
integer cornerheight = 40
integer cornerwidth = 46
end type

