$PBExportHeader$w_usuarios.srw
$PBExportComments$Ventana para definir los Usuarios de la Aplicación
forward
global type w_usuarios from window
end type
type cb_1 from commandbutton within w_usuarios
end type
type mle_1 from multilineedit within w_usuarios
end type
type st_2 from statictext within w_usuarios
end type
type imprimir from picturebutton within w_usuarios
end type
type st_1 from statictext within w_usuarios
end type
type st_6 from statictext within w_usuarios
end type
type limpiar from picturebutton within w_usuarios
end type
type st_5 from statictext within w_usuarios
end type
type salir from picturebutton within w_usuarios
end type
type st_9 from statictext within w_usuarios
end type
type st_8 from statictext within w_usuarios
end type
type st_7 from statictext within w_usuarios
end type
type eliminar from picturebutton within w_usuarios
end type
type grabar from picturebutton within w_usuarios
end type
type insertar from picturebutton within w_usuarios
end type
type dw_1 from datawindow within w_usuarios
end type
type rr_2 from roundrectangle within w_usuarios
end type
type rr_1 from roundrectangle within w_usuarios
end type
type rr_3 from roundrectangle within w_usuarios
end type
type rr_4 from roundrectangle within w_usuarios
end type
end forward

global type w_usuarios from window
integer x = 5
integer y = 396
integer width = 2656
integer height = 1464
boolean titlebar = true
string title = "Usuarios de la Aplicación..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "C:\Muñecos\ICONS\Tool4.ico"
cb_1 cb_1
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
global w_usuarios w_usuarios

type variables
Double cedula_afiliado
Long fila, cta_filas
end variables

on w_usuarios.create
this.cb_1=create cb_1
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
this.Control[]={this.cb_1,&
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

on w_usuarios.destroy
destroy(this.cb_1)
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

event open;m_principal.m_seguridad.m_usuarios.Checked = TRUE
dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()
end event

event close;m_principal.m_seguridad.m_usuarios.Checked = FALSE
end event

type cb_1 from commandbutton within w_usuarios
integer x = 704
integer y = 1152
integer width = 421
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New Usuarios"
end type

type mle_1 from multilineedit within w_usuarios
integer x = 14
integer y = 1116
integer width = 635
integer height = 228
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Ventana para el Manejo de los Usuarios de la Aplicación."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_usuarios
integer x = 1833
integer y = 1268
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

type imprimir from picturebutton within w_usuarios
integer x = 1851
integer y = 1096
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
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir"
end type

event clicked;IF dw_1.RowCount() < 1 THEN
	MessageBox("Mensaje...","! No hay Datos para Imprimir ¡",Information!)
	RETURN
END IF	
w_segunda.Tag = "Generando Reporte de los Usuarios de la Aplicación... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)
Open(w_imprime_usuarios)
end event

type st_1 from statictext within w_usuarios
integer x = 91
integer y = 56
integer width = 2469
integer height = 104
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 15780518
boolean enabled = false
string text = "Usuarios de la Aplicación"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_usuarios
integer x = 2158
integer y = 1268
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

type limpiar from picturebutton within w_usuarios
integer x = 2171
integer y = 1096
integer width = 183
integer height = 160
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\database_refresh.png"
string powertiptext = "Limpiar Ventana"
end type

event clicked;dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()

end event

type st_5 from statictext within w_usuarios
integer x = 2382
integer y = 1268
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

type salir from picturebutton within w_usuarios
integer x = 2377
integer y = 1096
integer width = 183
integer height = 160
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean default = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
string powertiptext = "Cerrar Ventana"
end type

event clicked;IF dw_1.ModifiedCount() + dw_1.DeletedCount() > 0 THEN
	//**********************************************************************************//
	//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
	//**********************************************************************************//

	//**************************************************//
	//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
	//**************************************************//
	String login_name, descripcion_login, tipo_usuario, activo_si_no
	//*****************************************************************//
	//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
	//*****************************************************************//
	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron todos los Cambios ¡",StopSign!)
		RETURN
	END IF
	//*****************************************************************//

	//********************************************//
	//*** CAPTURA DE LOS DATOS DEL DATAWINDOWS ***//
	//********************************************//

	IF fila < 1 THEN
		MessageBox("Mensaje - Validación...","! Tiene que dar Click a la Fila ¡",Information!)
		RETURN
	END IF	

	login_name			= dw_1.GetItemString(fila,"login_name")
	descripcion_login	= dw_1.GetItemString(fila,"descripcion_login")   
	tipo_usuario		= dw_1.GetItemString(fila,"tipo_usuario")
	activo_si_no		= dw_1.GetItemString(fila,"activo_si_no")
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,login_name)
	dw_1.SetItem(fila,2,descripcion_login)
	dw_1.SetItem(fila,3,tipo_usuario)
	dw_1.SetItem(fila,4,activo_si_no)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	
	Integer res
	res = MessageBox("Mensaje - Validación...","¿ Desea Salvar los Cambios Realizados ?",Question!,YesNo!,2)
	IF res = 2 THEN
		Close(w_usuarios)
	ELSE
		Integer acepto
		acepto = dw_1.AcceptText()
		IF acepto > 0 THEN
			dw_1.Update()
			MessageBox("Mensaje - Validación...","! Se ha Actualizado la Báse de Datos ¡",Information!)
			Close(w_usuarios)
		ELSE
			MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
			Close(w_usuarios)
		END IF	
	END IF	
ELSE	
	Close(w_usuarios)
END IF	
end event

type st_9 from statictext within w_usuarios
integer x = 1614
integer y = 1268
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

type st_8 from statictext within w_usuarios
integer x = 1399
integer y = 1268
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

type st_7 from statictext within w_usuarios
integer x = 1179
integer y = 1268
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

type eliminar from picturebutton within w_usuarios
integer x = 1627
integer y = 1096
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
string picturename = "C:\Muñecos\BITMAPS\data_table.png"
string powertiptext = "Eliminar una Fila"
end type

event clicked;String login_name, descripcion_login
Integer rta

login_name			= dw_1.GetItemString(fila,"login_name")
descripcion_login	= dw_1.GetItemString(fila,"descripcion_login")   

string mensj
integer resp, codigo_busca
Long cuenta_filas
//***************************************************************************************//
//*** BUSCA EN LA TABLA DE afiliados PARA VER SI EXISTE ALGUN AFILIADO CON ESA A.F.P. ***//
//***************************************************************************************//
SELECT COUNT(*) INTO :cuenta_filas FROM usuario_permiso_activos_fijos &
	WHERE login = :login_name;

IF cuenta_filas > 0 THEN
	rta = MessageBox("Mensaje - Validación...","¿ Desea Eliminar los Permisos Ya Asignados a "+Trim(login_name)+&
				" ("+Trim(descripcion_login)+") ?",Question!,YesNo!,2)

	IF rta = 2 THEN RETURN
	
	SetPointer(HourGlass!)	
	w_segunda.Tag = "! ESPERE POR FAVOR ¡ - Eliminado Permisos Asignados de... "+Trim(descripcion_login)+"   "+String(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	DELETE FROM usuario_permiso_activos_fijos WHERE login = :login_name;
	w_usuarios.Pointer = "Arrow!"
END IF	
//***************************************************************************************//
Integer  net
net = MessageBox("Mensaje - Validación...","¿ Está Seguro de Eliminar el login... "+login_name+"~r~n"+descripcion_login+" ?",Question!,YesNo!,2)

IF net = 2 THEN
	RETURN
ELSE
	IF dw_1.DeleteRow(fila) = -1 then
		Messagebox("Mensaje - Validación...","! Error al Eliminar la Fila ¡",Information!)
		dw_1.settransobject(sqlca)
		dw_1.retrieve()	
		cta_filas = dw_1.RowCount()
	ELSE
		dw_1.Update()		
		dw_1.settransobject(sqlca)
		dw_1.retrieve()	
		MessageBox("Mensaje - Validación...","! Se ha Eliminado un Registro de la Báse de Datos ¡",Information!)
		cta_filas = dw_1.RowCount()
	END IF	
END IF
end event

type grabar from picturebutton within w_usuarios
integer x = 1408
integer y = 1096
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
string picturename = "C:\Muñecos\BITMAPS\database_save.png"
string powertiptext = "Actualizar Datos"
end type

event clicked;//**********************************************************************************//
//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
//**********************************************************************************//

//**************************************************//
//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
//**************************************************//
String login_name, descripcion_login, tipo_usuario, activo_si_no
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

login_name			= dw_1.GetItemString(fila,"login_name")
descripcion_login	= dw_1.GetItemString(fila,"descripcion_login")   
tipo_usuario		= dw_1.GetItemString(fila,"tipo_usuario")
activo_si_no		= dw_1.GetItemString(fila,"activo_si_no")
//*********************************************************//
//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
//*********************************************************//
dw_1.SetItem(fila,1,login_name)
dw_1.SetItem(fila,2,descripcion_login)
dw_1.SetItem(fila,3,tipo_usuario)
dw_1.SetItem(fila,4,activo_si_no)
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
	dw_1.retrieve()	
	cta_filas = dw_1.RowCount()	
ELSE
	ROLLBACK USING SQLCA;
	MessageBox("Mensaje...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
	dw_1.settransobject(sqlca)
	dw_1.retrieve()	
	cta_filas = dw_1.RowCount()
END IF
//*****************************************************************//
end event

type insertar from picturebutton within w_usuarios
integer x = 1189
integer y = 1096
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
string picturename = "c:\bitmaps\adiciona.bmp"
alignment htextalign = left!
string powertiptext = "Insertar una Fila"
end type

event clicked;Long scroll
IF cta_filas = dw_1.RowCount() THEN
	dw_1.InsertRow(0)
	scroll = dw_1.RowCount() + 1
	dw_1.scrolltorow(scroll)
	dw_1.setcolumn(1)
	dw_1.setfocus()
ELSE
	//**********************************************************************************//
	//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
	//**********************************************************************************//

	//**************************************************//
	//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
	//**************************************************//
	String login_name, descripcion_login, tipo_usuario, activo_si_no
	//*****************************************************************//
	//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
	//*****************************************************************//
	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron todos los Cambios ¡",StopSign!)
		RETURN
	END IF
	//*****************************************************************//

	//********************************************//
	//*** CAPTURA DE LOS DATOS DEL DATAWINDOWS ***//
	//********************************************//

	IF fila < 1 THEN
		MessageBox("Mensaje - Validación...","! Tiene que dar Click a la Fila ¡",Information!)
		RETURN
	END IF	

	login_name			= dw_1.GetItemString(fila,"login_name")
	descripcion_login	= dw_1.GetItemString(fila,"descripcion_login")   
	tipo_usuario		= dw_1.GetItemString(fila,"tipo_usuario")
	activo_si_no		= dw_1.GetItemString(fila,"activo_si_no")
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,login_name)
	dw_1.SetItem(fila,2,descripcion_login)
	dw_1.SetItem(fila,3,tipo_usuario)
	dw_1.SetItem(fila,4,activo_si_no)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer rtn 

	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron todos los Cambios ¡ ",StopSign!)
		RETURN
	END IF

	scroll = dw_1.RowCount() + 1
	dw_1.InsertRow(0)
	dw_1.scrolltorow(scroll)
	dw_1.setcolumn(1)
	dw_1.setfocus()
	cta_filas = dw_1.RowCount()
	//*****************************************************************//
END IF	
end event

type dw_1 from datawindow within w_usuarios
integer x = 114
integer y = 216
integer width = 2400
integer height = 836
integer taborder = 10
string dataobject = "dw_usuarios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;fila = dw_1.GetClickedRow( )

end event

event itemchanged;//String clase_afp
//clase_afp = "CC"
////****************************************************//
////*** CUANDO ENTRA A MODIFICAR EL CODIGO DE LA AFP ***//
////****************************************************//
//
//IF dwo.Name = "codigo_afp" THEN
//	IF dw_1.AcceptText() = 1 THEN
//
//	ELSE	
//		MessageBox("Mensaje...","No se Aceptaron todos los Cambios... ",StopSign!)
//		RETURN
//	END IF
//	
//	Integer codigo_busca, codigo_afp
//	String nombre_busca
//	IF fila < 1 THEN
//		fila = dw_1.GetRow()
//	END IF		
//	codigo_afp = dw_1.GetItemNumber(fila,"codigo_afp")
//	//********************************************************//
//	//*** BUSCA SI YA EXISTE ESE CODIGO EN LA TABLA DE afp ***//
//	//********************************************************//
//	SELECT codigo_afp, nombre_afp INTO :codigo_busca, :nombre_busca FROM afp WHERE codigo_afp = :codigo_afp ;
//			
//	IF codigo_busca <> 0 THEN
//		MessageBox("Mensaje...","Ya Existe esta Código para la A.F.P. " + nombre_busca ,Exclamation!)
//		RETURN			
//	ELSE
//		dw_1.SetItem(fila,1,clase_afp)
//		dw_1.SetItem(fila,4,"codigo_afp")
//		IF dw_1.AcceptText() = 1 THEN
//	
//		ELSE	
//			MessageBox("Mensaje...","No se Aceptaron todos los Cambios... ",StopSign!)
//			RETURN
//		END IF
//		
//	END IF	
//	long ll_found_c
//	String condicion
//	condicion = "codigo_afp = " + String(codigo_afp)
//	
//	ll_found_c = dw_1.Find(condicion, 1, dw_1.RowCount()-1 )
//	IF ll_found_c <> 0 THEN
//		MessageBox("Error...","Ya existe este Código de A.F.P. "+String(codigo_afp),Exclamation!)
//	END IF	
//	
//ELSE
//
//END IF
//
////*************************************************//
////*** CUANDO ENTRA A MODIFICAR EL NIT DE LA AFP ***//
////*************************************************//
//
//IF dwo.Name = "nit_afp" THEN
//	IF dw_1.AcceptText() = 1 THEN
//
//	ELSE	
//		MessageBox("Mensaje...","No se Aceptaron todos los Cambios... ",StopSign!)
//		RETURN
//	END IF
//	
//	Double nit_busca, nit_afp
//	Integer afp_busca
//	String nombre_afp
//	nit_afp = dw_1.GetItemNumber(fila,"nit_afp")
//	//******************************************************//
//	//*** BUSCA SI YA EXISTE ESTE NIT EN LA TABLA DE afp ***//
//	//******************************************************//
//	SELECT nit_afp, nombre_afp, codigo_afp INTO :nit_busca, :nombre_afp, :afp_busca FROM afp WHERE nit_afp = :nit_afp ;
//			
//	IF nit_busca <> 0 THEN
//		MessageBox("Mensaje...","Ya Existe este NIT para la A.F.P. " + nombre_afp + " Código... "+String(afp_busca) ,Exclamation!)
//		RETURN			
//	ELSE
//		dw_1.SetItem(fila,2,"nit_afp")
//		dw_1.SetItem(fila,1,clase_afp)
//		IF dw_1.AcceptText() = 1 THEN
//	
//		ELSE	
//			MessageBox("Mensaje...","No se Aceptaron todos los Cambios... ",StopSign!)
//			RETURN
//		END IF
//		
//	END IF	
//	long ll_found_n
//	String condicion_n
//	condicion_n = "nit_afp = " + String(nit_afp)
//	
//	ll_found_n = dw_1.Find(condicion_n, 1, dw_1.RowCount()-1 )
//	IF ll_found_n <> 0 THEN
//		MessageBox("Error...","Ya existe este NIT para la A.F.P. "+String(nit_afp,"###,###,###"),Exclamation!)
//	END IF		
//ELSE
//
//END IF
end event

event doubleclicked;String login_old, login_new
Integer net
IF fila < 1 OR dw_1.RowCount() < 1 THEN
	IF fila < 1 THEN
		MessageBox("Mensaje - Validación...","! Dar Click Sobre la Fila ¡",Information!)
		RETURN
	ELSE
		MessageBox("Mensaje - Validación...","! No Existe Datos en el DataWindows ¡",Information!)
		RETURN		
	END IF
END IF	

login_new = dw_1.GetItemString(fila,"login_name")

st_usuarios lst_usuarios
lst_usuarios.nombre_usuario		= login_old
w_segunda.Tag = "Abriendo Ventana para la Impresión del Reporte......           " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

OpenWithParm(w_usuario_antiguo,lst_usuarios)

lst_usuarios = Message.PowerObjectParm
login_old = lst_usuarios.nombre_usuario

IF IsNull(login_old) OR TRIM(login_old) = "" THEN
	RETURN
END IF	

net = MessageBox("Mensaje - Validación...","¿ Está Seguro de Trasladar los Perimisos de "+TRIM(login_old)+&
				" a "+TRIM(login_new)+" ?",Question!,YesNo!,2)
IF net = 2 THEN
	RETURN
END IF	

w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado usuarios_crea_control_activos... ¡           " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

SetPointer(HourGlass!)

String mensj
Integer resp
Any graba
Double valor_fondo_pro1, valor_fondo_pro2

DECLARE graba PROCEDURE FOR usuarios_crea_control_activos
		@login_old		= :login_old,  
		@login_new		= :login_new, 
		@respuesta		= :mensj output,
		@resp_num		= :resp output;
	
EXECUTE graba;
	
IF SQLCA.SQLCode  <> 0 THEN
	w_segunda.Tag = "Ocurrió un Error en la Ejecución del Procedimiento usuarios_crea_control_activos ... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)		
	MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Ejecutando Procedimiento usuarios_crea_control_activos ¡",StopSign!)
	w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)		
	w_usuarios.Pointer = "Arrow!"
	CLOSE graba;
	RETURN
END IF

FETCH graba INTO :mensj, :resp;
	
IF SQLCA.SQLCode  <> 0 THEN
	w_segunda.Tag = "Ocurrió un Error en el Fetch del Procedimiento usuarios_crea_jcontrol_activos ... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)				
	MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error FETCH Procedimiento usuarios_crea_control_activos ¡ "+mensj+String(resp,"###"),StopSign!)
	w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)	
	w_usuarios.Pointer = "Arrow!"
	CLOSE graba;
	RETURN 
END IF
	
CLOSE graba;

IF SQLCA.SQLCode  <> 0 THEN
	w_segunda.Tag = "Ocurrió un Error en el Close del Procedimiento usuarios_crea_control_activos ... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)						
	MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Cerrando Procedimiento usuarios_crea_control_activos ¡",Information!)
	w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	w_usuarios.Pointer = "Arrow!"
	RETURN 
END IF
	
IF resp = 1 THEN
	MessageBox("Mensaje ...","! Imposible Ejecutar Procedimiento Almacenado usuarios_crea_control_activos ¡"+mensj,Information!)
	w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	w_usuarios.Pointer = "Arrow!"
	RETURN
END IF
IF resp = 2 THEN
	w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)		
	w_usuarios.Pointer = "Arrow!"
	MessageBox("Mensaje - Validación...","! El Procedimiento usuarios_crea_control_activos se Ejecuto Correctamente ¡",Information!)
END IF
end event

event rbuttondown;IF dw_1.RowCount() < 1 THEN RETURN
end event

event retrieveend;w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(This.Tag)
end event

event retrievestart;w_segunda.Tag = "Cargando Datos de las A.F.P.... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)				

end event

type rr_2 from roundrectangle within w_usuarios
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 2094
integer y = 1064
integer width = 521
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_usuarios
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1147
integer y = 1064
integer width = 928
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_usuarios
long linecolor = 128
integer linethickness = 5
long fillcolor = 15780518
integer x = 32
integer y = 20
integer width = 2583
integer height = 176
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_usuarios
long linecolor = 128
integer linethickness = 4
long fillcolor = 65280
integer x = 690
integer y = 1136
integer width = 448
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

