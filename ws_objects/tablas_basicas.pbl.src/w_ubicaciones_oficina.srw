$PBExportHeader$w_ubicaciones_oficina.srw
$PBExportComments$Ventana para Definir las Marcas o Fabricantes de los Activos de CAXDAC
forward
global type w_ubicaciones_oficina from window
end type
type rr_2 from roundrectangle within w_ubicaciones_oficina
end type
type mle_1 from multilineedit within w_ubicaciones_oficina
end type
type st_2 from statictext within w_ubicaciones_oficina
end type
type imprimir from picturebutton within w_ubicaciones_oficina
end type
type st_1 from statictext within w_ubicaciones_oficina
end type
type st_6 from statictext within w_ubicaciones_oficina
end type
type limpiar from picturebutton within w_ubicaciones_oficina
end type
type st_5 from statictext within w_ubicaciones_oficina
end type
type salir from picturebutton within w_ubicaciones_oficina
end type
type st_9 from statictext within w_ubicaciones_oficina
end type
type st_8 from statictext within w_ubicaciones_oficina
end type
type st_7 from statictext within w_ubicaciones_oficina
end type
type eliminar from picturebutton within w_ubicaciones_oficina
end type
type grabar from picturebutton within w_ubicaciones_oficina
end type
type insertar from picturebutton within w_ubicaciones_oficina
end type
type dw_1 from datawindow within w_ubicaciones_oficina
end type
type rr_3 from roundrectangle within w_ubicaciones_oficina
end type
end forward

global type w_ubicaciones_oficina from window
integer x = 5
integer y = 396
integer width = 3209
integer height = 1464
boolean titlebar = true
string title = "Ubicaciones de Oficina..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "DataWindow5!"
rr_2 rr_2
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
rr_3 rr_3
end type
global w_ubicaciones_oficina w_ubicaciones_oficina

type variables
Double cedula_afiliado
Long fila, cta_filas
end variables

on w_ubicaciones_oficina.create
this.rr_2=create rr_2
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
this.rr_3=create rr_3
this.Control[]={this.rr_2,&
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
this.rr_3}
end on

on w_ubicaciones_oficina.destroy
destroy(this.rr_2)
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
destroy(this.rr_3)
end on

event open;m_principal.m_tablasbásicas.m_ubicacionesdeoficina.Checked = TRUE

IF gb_usuario <> "sa" THEN
	String codigo_menu_ventana, permiso_ventana
	//******************************************************************************//
	//*** ENTRO A BUSCAR LOS PERMISOS EN LA TABLA usuario_permiso_cta_individual ***//
	//******************************************************************************//
	//generar.enabled		= FALSE
	//traer.enabled		= FALSE
	insertar.enabled	= FALSE
	grabar.enabled		= FALSE
	eliminar.enabled	= FALSE
	salir.enabled		= FALSE
	imprimir.enabled	= FALSE
	limpiar.enabled 	= FALSE
	permiso_ventana   = "N"
	w_segunda.Tag = "Ejecuntando CURSOR activa_botones... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	String nombre_boton
	String permiso_saca, boton_saca

	codigo_menu_ventana = "T40"
	Any activa_botones
	DECLARE activa_botones CURSOR FOR SELECT codigo_boton, permiso_si_no FROM usuario_permiso_activos_fijos &
			WHERE login = :gb_usuario AND codigo_menu = :codigo_menu_ventana;

	IF SQLCA.SQLCode = -1 Then 
		MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" Error Declarando CURSOR activa_botones !!!",StopSign!)
	   RETURN
	END IF

	OPEN activa_botones;

	IF SQLCA.SQLCode = -1 Then 
		MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" Error Abriendo CURSOR activa_botones !!!",StopSign!)
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

//		IF Lower(nombre_boton) = "traer" AND permiso_saca = "S" THEN
//			traer.Enabled = TRUE
//		END IF	
		
		IF Lower(nombre_boton) = "insertar" AND permiso_saca = "S" THEN
			insertar.Enabled = TRUE
		END IF
		
		IF Lower(nombre_boton) = "grabar" AND permiso_saca = "S" THEN
			grabar.Enabled = TRUE
		END IF
		
		IF Lower(nombre_boton) = "eliminar" AND permiso_saca = "S" THEN
			eliminar.Enabled = TRUE
		END IF
		
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
	CLOSE(this)
	RETURN
END IF


dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()
end event

event close;m_principal.m_tablasbásicas.m_ubicacionesdeoficina.Checked = FALSE
end event

type rr_2 from roundrectangle within w_ubicaciones_oficina
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1573
integer y = 1068
integer width = 1582
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type mle_1 from multilineedit within w_ubicaciones_oficina
integer x = 37
integer y = 1088
integer width = 919
integer height = 252
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Definición y administración de las ubicaciones físicas de la oficina, asignando un código representativo."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_ubicaciones_oficina
integer x = 2386
integer y = 1268
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Imprimir"
alignment alignment = center!
boolean focusrectangle = false
end type

type imprimir from picturebutton within w_ubicaciones_oficina
integer x = 2409
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
	MessageBox("Mensaje - Validación...","! No hay Datos para Imprimir ¡",Information!)
	RETURN
END IF	
w_segunda.Tag = "Generando Reporte de las Ubicaciones de Oficina... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)
Open(w_imprime_ubicaciones)
end event

type st_1 from statictext within w_ubicaciones_oficina
integer x = 128
integer y = 36
integer width = 2939
integer height = 104
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 65535
long backcolor = 15780518
boolean enabled = false
string text = "Ubicaciones de Oficina"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_ubicaciones_oficina
integer x = 2642
integer y = 1268
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Limpiar"
alignment alignment = center!
boolean focusrectangle = false
end type

type limpiar from picturebutton within w_ubicaciones_oficina
integer x = 2665
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
string powertiptext = "Limpiar"
end type

event clicked;dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()

end event

type st_5 from statictext within w_ubicaciones_oficina
integer x = 2898
integer y = 1268
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Salir"
alignment alignment = center!
boolean focusrectangle = false
end type

type salir from picturebutton within w_ubicaciones_oficina
integer x = 2921
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
	String codigo_ubicacion, descripcion, activo_si_no
	//*****************************************************************//
	//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
	//*****************************************************************//
	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron Todos los Cambios ¡",StopSign!)
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

	codigo_ubicacion			= dw_1.GetItemString(fila,"codigo_ubicacion")
	descripcion		= dw_1.GetItemString(fila,"descripcion")
	activo_si_no			= dw_1.GetItemString(fila,"activo_si_no")
	
	IF IsNull(activo_si_no) THEN activo_si_no = "S"
	
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_ubicacion)
	dw_1.SetItem(fila,2,descripcion)
	dw_1.SetItem(fila,3,activo_si_no)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer res
	res = MessageBox("Mensaje - Validación...","¿ Desea Salvar los Cambios Realizados ?",Question!,YesNo!,2)
	IF res = 2 THEN
		Close(parent)
	ELSE
		Integer acepto
		acepto = dw_1.AcceptText()
		IF acepto > 0 THEN
			dw_1.Update()
			MessageBox("Mensaje - Validación...","! Se ha Actualizado la Báse de Datos ¡",Information!)
			Close(parent)
		ELSE
			MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
			Close(parent)
		END IF	
	END IF	
ELSE	
	Close(parent)
END IF	
end event

type st_9 from statictext within w_ubicaciones_oficina
integer x = 2130
integer y = 1268
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Eliminar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_ubicaciones_oficina
integer x = 1874
integer y = 1268
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Grabar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_ubicaciones_oficina
integer x = 1618
integer y = 1268
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16776960
long backcolor = 16711680
boolean enabled = false
string text = "Insertar"
alignment alignment = center!
boolean focusrectangle = false
end type

type eliminar from picturebutton within w_ubicaciones_oficina
integer x = 2153
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

event clicked;IF dw_1.RowCount() = 0 THEN
	RETURN
END IF

IF fila <= 0 THEN
	MessageBox("Mensaje -Validación...","! Escoja una Fila para Eliminar ¡",StopSign!)
	RETURN
END IF

String codigo_ubicacion, descripcion, activo_si_no

codigo_ubicacion			= dw_1.GetItemString(fila,"codigo_ubicacion")
descripcion		= dw_1.GetItemString(fila,"descripcion")
activo_si_no			= dw_1.GetItemString(fila,"activo_si_no")

string mensj
integer resp, codigo_busca
Long cuenta_filas
//************************************************************************//
//*** BUSCA EN LA TABLA DE activos_marca_modelo_inventario PARA VER SI EXISTE ***//
//************************************************************************//
//SELECT COUNT(*) INTO :cuenta_filas FROM activos_marca_modelo_inventario WHERE codigo_ubicacion = :codigo_ubicacion;

IF cuenta_filas > 0 THEN
	MessageBox("Mensaje - Validación...","! Ya existen registros asociados a esta Ubicación ¡",StopSign!)
	RETURN
END IF	
//************************************************************************//
Integer  net
net = MessageBox("Mensaje - Validación...","¿ Está Seguro de Eliminar... "+descripcion+" ("+codigo_ubicacion+")"+" ?",Question!,YesNo!,2)

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

type grabar from picturebutton within w_ubicaciones_oficina
integer x = 1897
integer y = 1096
integer width = 183
integer height = 160
integer taborder = 30
integer textsize = -10
integer weight = 400
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
String codigo_ubicacion, descripcion, activo_si_no
//*****************************************************************//
//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
//*****************************************************************//
IF dw_1.AcceptText() = 1 THEN

ELSE	
	MessageBox("Mensaje - Validación...","! No se Aceptaron Todos los Cambios ¡",StopSign!)
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

codigo_ubicacion			= dw_1.GetItemString(fila,"codigo_ubicacion")
descripcion		= dw_1.GetItemString(fila,"descripcion")
activo_si_no			= dw_1.GetItemString(fila,"activo_si_no")

IF IsNull(activo_si_no) THEN activo_si_no = "S"
	
//*********************************************************//
//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
//*********************************************************//
dw_1.SetItem(fila,1,codigo_ubicacion)
dw_1.SetItem(fila,2,descripcion)
dw_1.SetItem(fila,3,activo_si_no)
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

type insertar from picturebutton within w_ubicaciones_oficina
integer x = 1641
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
	String codigo_ubicacion, descripcion, activo_si_no
	//*****************************************************************//
	//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
	//*****************************************************************//
	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron Todos los Cambios ¡",StopSign!)
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

	codigo_ubicacion			= dw_1.GetItemString(fila,"codigo_ubicacion")
	descripcion		= dw_1.GetItemString(fila,"descripcion")
	activo_si_no			= dw_1.GetItemString(fila,"activo_si_no")
	
	IF IsNull(activo_si_no) THEN activo_si_no = "S"
	
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_ubicacion)
	dw_1.SetItem(fila,2,descripcion)
	dw_1.SetItem(fila,3,activo_si_no)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer rtn 

	IF dw_1.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron Todos los Cambios ¡",StopSign!)
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

type dw_1 from datawindow within w_ubicaciones_oficina
integer x = 91
integer y = 188
integer width = 3013
integer height = 852
integer taborder = 10
string dataobject = "dw_ubicaciones_oficina"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;fila = dw_1.GetClickedRow( )

end event

event rbuttondown;IF dw_1.RowCount() < 1 THEN RETURN
end event

event retrieveend;w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(This.Tag)
end event

event retrievestart;w_segunda.Tag = "Cargando Datos del DataWindows... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)				

end event

type rr_3 from roundrectangle within w_ubicaciones_oficina
long linecolor = 65535
integer linethickness = 5
long fillcolor = 15780518
integer x = 37
integer y = 12
integer width = 3118
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

