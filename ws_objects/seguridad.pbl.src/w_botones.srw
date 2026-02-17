$PBExportHeader$w_botones.srw
$PBExportComments$Ventana para el Manejo de los Botones de las Ventanas
forward
global type w_botones from window
end type
type mle_1 from multilineedit within w_botones
end type
type st_2 from statictext within w_botones
end type
type imprimir from picturebutton within w_botones
end type
type st_1 from statictext within w_botones
end type
type st_6 from statictext within w_botones
end type
type limpiar from picturebutton within w_botones
end type
type st_5 from statictext within w_botones
end type
type salir from picturebutton within w_botones
end type
type st_9 from statictext within w_botones
end type
type st_8 from statictext within w_botones
end type
type st_7 from statictext within w_botones
end type
type eliminar from picturebutton within w_botones
end type
type grabar from picturebutton within w_botones
end type
type insertar from picturebutton within w_botones
end type
type dw_1 from datawindow within w_botones
end type
type rr_2 from roundrectangle within w_botones
end type
type rr_1 from roundrectangle within w_botones
end type
type rr_3 from roundrectangle within w_botones
end type
end forward

global type w_botones from window
integer x = 5
integer y = 396
integer width = 2510
integer height = 1464
boolean titlebar = true
string title = "Botones de la Aplicación..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
string icon = "C:\Muñecos\ICONS\Tool3.ico"
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
end type
global w_botones w_botones

type variables
Double cedula_afiliado
Long fila, cta_filas
end variables

on w_botones.create
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
this.Control[]={this.mle_1,&
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
this.rr_3}
end on

on w_botones.destroy
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
end on

event open;m_principal.m_seguridad.m_operaciones.m_botones.Checked = TRUE
dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()
end event

event close;m_principal.m_seguridad.m_operaciones.m_botones.Checked = FALSE
end event

type mle_1 from multilineedit within w_botones
integer x = 14
integer y = 1056
integer width = 745
integer height = 228
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Ventana para el Manejo de los Botones de la Aplicación."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_botones
integer x = 1641
integer y = 1232
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

type imprimir from picturebutton within w_botones
integer x = 1659
integer y = 1060
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
	MessageBox("Mensaje - Validación...","! No hay Datos para Imprimir ¡",Information!)
	RETURN
END IF	
w_segunda.Tag = "Generando Reporte de los Botones de la Aplicación... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)
Open(w_imprime_botones)
end event

type st_1 from statictext within w_botones
integer x = 73
integer y = 40
integer width = 2368
integer height = 104
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 65535
long backcolor = 8421504
boolean enabled = false
string text = "Botones de la Aplicación"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_botones
integer x = 2007
integer y = 1232
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

type limpiar from picturebutton within w_botones
integer x = 2021
integer y = 1060
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
string powertiptext = "Limpiar"
end type

event clicked;dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()

end event

type st_5 from statictext within w_botones
integer x = 2231
integer y = 1232
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

type salir from picturebutton within w_botones
integer x = 2226
integer y = 1060
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
	String codigo_boton, descripcion_boto
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

	codigo_boton		= dw_1.GetItemString(fila,"codigo_boton")
	descripcion_boto	= dw_1.GetItemString(fila,"descripcion_boto")   
	
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_boton)
	dw_1.SetItem(fila,2,descripcion_boto)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer res
	res = MessageBox("Mensaje - Validación...","¿ Desea Salvar los Cambios Realizados ?",Question!,YesNo!,2)
	IF res = 2 THEN
		Close(w_botones)
	ELSE
		Integer acepto
		acepto = dw_1.AcceptText()
		IF acepto > 0 THEN
			dw_1.Update()
			MessageBox("Mensaje - Validación...","! Se ha Actualizado la Báse de Datos ¡",Information!)
			Close(w_botones)
		ELSE
			MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
			Close(w_botones)
		END IF	
	END IF	
ELSE	
	Close(w_botones)
END IF	
end event

type st_9 from statictext within w_botones
integer x = 1390
integer y = 1232
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

type st_8 from statictext within w_botones
integer x = 1120
integer y = 1232
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

type st_7 from statictext within w_botones
integer x = 841
integer y = 1232
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

type eliminar from picturebutton within w_botones
integer x = 1403
integer y = 1060
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

event clicked;String codigo_boton, descripcion_boto

codigo_boton		= dw_1.GetItemString(fila,"codigo_boton")
descripcion_boto	= dw_1.GetItemString(fila,"descripcion_boto")   

string mensj
integer resp, codigo_busca
//***************************************************************************************//
//*** BUSCA EN LA TABLA DE afiliados PARA VER SI EXISTE ALGUN AFILIADO CON ESA A.F.P. ***//
//***************************************************************************************//
//SELECT cod_afp INTO :codigo_busca FROM afiliados WHERE cod_afp = :codigo_afp;
//
//IF codigo_busca <> 0 THEN
//	MessageBox("Mensaje...","Existen Afiliados con esta A.F.P. que desea Eliminar!!!",Information!)
//	RETURN
//END IF	
//***************************************************************************************//
Integer  net
net = MessageBox("Mensaje - Validación...","¿ Está Seguro de Eliminar este Boton... "+descripcion_boto+"("+codigo_boton+")"+" ?",Question!,YesNo!,2)

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

type grabar from picturebutton within w_botones
integer x = 1129
integer y = 1060
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
String codigo_boton, descripcion_boto
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

codigo_boton		= dw_1.GetItemString(fila,"codigo_boton")
descripcion_boto	= dw_1.GetItemString(fila,"descripcion_boto")   
	
//*********************************************************//
//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
//*********************************************************//
dw_1.SetItem(fila,1,codigo_boton)
dw_1.SetItem(fila,2,descripcion_boto)
//*********************************************************//


//*****************************************************************//
//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
//*****************************************************************//
Integer acepto
Integer rtn 

rtn = dw_1.Update(True, True)
IF rtn = 1 THEN
	COMMIT USING SQLCA;
	MessageBox("Mensaje - Validación...","! La Báse de Datos ha sido Actualizada ¡",Information!)
	dw_1.settransobject(sqlca)
	dw_1.retrieve()	
	cta_filas = dw_1.RowCount()	
ELSE
	ROLLBACK USING SQLCA;
	MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
	dw_1.settransobject(sqlca)
	dw_1.retrieve()	
	cta_filas = dw_1.RowCount()
END IF
//*****************************************************************//
end event

type insertar from picturebutton within w_botones
integer x = 850
integer y = 1060
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
	String codigo_boton, descripcion_boto
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

	codigo_boton			= dw_1.GetItemString(fila,"codigo_boton")
	descripcion_boto		= dw_1.GetItemString(fila,"descripcion_boto")   
	
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_boton)
	dw_1.SetItem(fila,2,descripcion_boto)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer rtn 

	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron todos los Cambios ¡",StopSign!)
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

type dw_1 from datawindow within w_botones
integer x = 41
integer y = 180
integer width = 2400
integer height = 788
integer taborder = 10
string dataobject = "dw_botones_aplicacion"
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

type rr_2 from roundrectangle within w_botones
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1943
integer y = 1024
integer width = 521
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_botones
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 782
integer y = 1024
integer width = 1134
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_botones
long linecolor = 65535
integer linethickness = 5
long fillcolor = 8421504
integer x = 37
integer y = 16
integer width = 2450
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

