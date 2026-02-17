$PBExportHeader$w_usuarios_operaciones.srw
$PBExportComments$Ventana para el Manejo de los Permisos a los Usuarios
forward
global type w_usuarios_operaciones from window
end type
type dw_3 from datawindow within w_usuarios_operaciones
end type
type st_4 from statictext within w_usuarios_operaciones
end type
type dw_2 from datawindow within w_usuarios_operaciones
end type
type st_3 from statictext within w_usuarios_operaciones
end type
type mle_1 from multilineedit within w_usuarios_operaciones
end type
type st_2 from statictext within w_usuarios_operaciones
end type
type imprimir from picturebutton within w_usuarios_operaciones
end type
type st_1 from statictext within w_usuarios_operaciones
end type
type st_6 from statictext within w_usuarios_operaciones
end type
type limpiar from picturebutton within w_usuarios_operaciones
end type
type st_5 from statictext within w_usuarios_operaciones
end type
type salir from picturebutton within w_usuarios_operaciones
end type
type st_8 from statictext within w_usuarios_operaciones
end type
type grabar from picturebutton within w_usuarios_operaciones
end type
type dw_1 from datawindow within w_usuarios_operaciones
end type
type rr_2 from roundrectangle within w_usuarios_operaciones
end type
type rr_3 from roundrectangle within w_usuarios_operaciones
end type
type rr_4 from roundrectangle within w_usuarios_operaciones
end type
end forward

global type w_usuarios_operaciones from window
integer x = 5
integer y = 396
integer width = 2510
integer height = 1744
boolean titlebar = true
string title = "Asignación de Permisos..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
string icon = "C:\Muñecos\ICONS\Scssrs2.ico"
dw_3 dw_3
st_4 st_4
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
st_8 st_8
grabar grabar
dw_1 dw_1
rr_2 rr_2
rr_3 rr_3
rr_4 rr_4
end type
global w_usuarios_operaciones w_usuarios_operaciones

type variables
Long fila, cta_filas
DataWindowChild dw_hijo_dw_1, dw_hijo_dw_2, dw_hijo_dw_3
String codigo_linea, codigo_boton, codigo_menu
String descripcion, descripcion_boton, descripcion_menu
String usuario, descripcion_usuario
end variables

on w_usuarios_operaciones.create
this.dw_3=create dw_3
this.st_4=create st_4
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
this.st_8=create st_8
this.grabar=create grabar
this.dw_1=create dw_1
this.rr_2=create rr_2
this.rr_3=create rr_3
this.rr_4=create rr_4
this.Control[]={this.dw_3,&
this.st_4,&
this.dw_2,&
this.st_3,&
this.mle_1,&
this.st_2,&
this.imprimir,&
this.st_1,&
this.st_6,&
this.limpiar,&
this.st_5,&
this.salir,&
this.st_8,&
this.grabar,&
this.dw_1,&
this.rr_2,&
this.rr_3,&
this.rr_4}
end on

on w_usuarios_operaciones.destroy
destroy(this.dw_3)
destroy(this.st_4)
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
destroy(this.st_8)
destroy(this.grabar)
destroy(this.dw_1)
destroy(this.rr_2)
destroy(this.rr_3)
destroy(this.rr_4)
end on

event open;m_principal.m_seguridad.m_permisosdeusuarios.Checked = TRUE
dw_1.settransobject(sqlca)
dw_1.retrieve(usuario,codigo_menu)
dw_1.Enabled = FALSE
dw_3.Enabled = FALSE
cta_filas = dw_1.RowCount()
end event

event close;m_principal.m_seguridad.m_permisosdeusuarios.Checked = FALSE
end event

type dw_3 from datawindow within w_usuarios_operaciones
integer x = 558
integer y = 308
integer width = 1669
integer height = 96
integer taborder = 20
string dataobject = "dw_menus_child"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_3.InsertRow(0)
dw_3.GetChild("descripcion_menu",dw_hijo_dw_3)
dw_hijo_dw_3.SetTransObject(SQLCA)
dw_hijo_dw_3.Retrieve()

end event

event itemchanged;codigo_menu  		= dw_hijo_dw_3.GetItemString(dw_hijo_dw_3.GetRow(),"codigo_menu")
descripcion_menu	= dw_hijo_dw_3.GetItemString(dw_hijo_dw_3.GetRow(),"descripcion_menu")
dw_1.Title = "El Usuario... "+usuario+" y Menu... "+descripcion_menu
//**********************************************************************//
//*** ENTRAMOS A VERIFICAR SI YA EXISTE LOS PERMISOS PARA EL USUARIO ***//
//**********************************************************************//
String boton_saca
String permiso
permiso = "N"
Any saca_boton, actualiza_boton
Long cuenta_botones

Long cuenta_filas
SELECT COUNT(*) INTO :cuenta_filas FROM usuario_permiso_activos_fijos &
		WHERE login = :usuario AND codigo_menu = :codigo_menu;
		
IF cuenta_filas = 0 THEN
	Integer  net
	net = MessageBox("Mensaje - Validación...","¿ Desea Crear los Permisos de "+TRIM(usuario)+&
				" del Menu "+TRIM(descripcion_menu)+" ?",Question!,YesNo!,2)
	IF net = 2 THEN
		RETURN
	ELSE
		//************************************************************************//
		//*** CREAMOS CURSOR PARA INSERTAR LOS BOTONES DE EL USUARIO Y SU MENU ***//
		//************************************************************************//
		w_segunda.Tag = "Ejecuntando CURSOR insertar... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
		w_segunda.SetMicrohelp(w_segunda.Tag)

		Long cuenta_filas_botones
		SELECT COUNT(*) INTO :cuenta_filas_botones FROM menus_boton_activos_fijos &
				WHERE codigo_menu = :codigo_menu;
				
		IF cuenta_filas_botones = 0 THEN
			MessageBox("Mensaje - Validación...","! No Existe Relaciones entre el Menú y los Botones ¡",Information!)
			RETURN
		END IF	
		
		DECLARE saca_boton CURSOR FOR SELECT codigo_boton FROM menus_boton_activos_fijos &
				WHERE codigo_menu = :codigo_menu;

		IF SQLCA.SQLCode = -1 Then 
			MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Declarando CURSOR saca_boton ¡",StopSign!)
		   RETURN
		END IF

		OPEN saca_boton;

		IF SQLCA.SQLCode = -1 Then 
			MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Abriendo CURSOR saca_boton ¡",StopSign!)
		   CLOSE saca_boton;	
		   RETURN
		END IF	

		FETCH saca_boton INTO :boton_saca;

		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Fetch CURSOR saca_boton ¡",StopSign!)
			CLOSE saca_boton;
		   RETURN
		END IF	

		DO WHILE SQLCA.SQLDBCode <> 2     
		  	IF SQLCA.SQLDBCode = 1 THEN    
		     	EXIT
		   END IF

			INSERT INTO usuario_permiso_activos_fijos (login, codigo_menu, codigo_boton, permiso_si_no) &
					VALUES (:usuario, :codigo_menu, :boton_saca, :permiso);
				
			FETCH saca_boton INTO :boton_saca;

			IF SQLCA.SQLCode = -1 THEN
				MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Fetch CURSOR saca_boton  ¡",StopSign!)
				CLOSE saca_boton;
			   RETURN
			END IF				
		LOOP		
		CLOSE saca_boton;
		//************************************************************************//		
	END IF	
ELSE
	DECLARE actualiza_boton CURSOR FOR SELECT codigo_boton FROM menus_boton_activos_fijos &
			WHERE codigo_menu = :codigo_menu;

	IF SQLCA.SQLCode = -1 Then 
		MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Declarando CURSOR actualiza_boton  ¡",StopSign!)
	   RETURN
	END IF

	OPEN actualiza_boton;

	IF SQLCA.SQLCode = -1 Then 
		MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Abriendo CURSOR actualiza_boton ¡",StopSign!)
	   CLOSE actualiza_boton;	
	   RETURN
	END IF	

	FETCH actualiza_boton INTO :boton_saca;

	IF SQLCA.SQLCode = -1 THEN
		MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Fetch CURSOR actualiza_boton ¡",StopSign!)
		CLOSE actualiza_boton;
	   RETURN
	END IF	

	DO WHILE SQLCA.SQLDBCode <> 2     
	  	IF SQLCA.SQLDBCode = 1 THEN    
	     	EXIT
	   END IF
		SELECT COUNT(*) INTO :cuenta_botones FROM usuario_permiso_activos_fijos &
				WHERE login = :usuario AND codigo_menu = :codigo_menu AND codigo_boton = :boton_saca;
				
		IF cuenta_botones = 0 THEN		
			INSERT INTO usuario_permiso_activos_fijos (login, codigo_menu, codigo_boton, permiso_si_no) &
					VALUES (:usuario, :codigo_menu, :boton_saca, :permiso);
		ELSE
			cuenta_botones = 0
		END IF		

		FETCH actualiza_boton INTO :boton_saca;

		IF SQLCA.SQLCode = -1 THEN
			MessageBox("SQL error",string(SQLCA.SQLCode)+" "+SQLCA.SQLErrText+" ! Error Fetch CURSOR actualiza_boton  ¡",StopSign!)
			CLOSE actualiza_boton;
		   RETURN
		END IF				
	LOOP		
	CLOSE actualiza_boton;
	//************************************************************************//		
END IF
//**********************************************************************//
//********************************************//
//*** ENTRA A CARGAR LOS DATOS DE LA LINEA ***//
//********************************************//
dw_1.settransobject(sqlca)
dw_1.retrieve(usuario,codigo_menu)
cta_filas = dw_1.RowCount()
dw_1.Enabled = TRUE
dw_2.Enabled = FALSE
dw_3.Enabled = FALSE
//********************************************//
end event

type st_4 from statictext within w_usuarios_operaciones
integer x = 283
integer y = 324
integer width = 247
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
string text = "Menu ..."
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_usuarios_operaciones
integer x = 562
integer y = 208
integer width = 663
integer height = 96
integer taborder = 10
string dataobject = "dw_usuarios_child"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_2.InsertRow(0)
dw_2.GetChild("login_name",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()

end event

event itemchanged;usuario  				= dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"login_name")
descripcion_usuario 	= dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"descripcion_login")
dw_3.Enabled = TRUE

end event

type st_3 from statictext within w_usuarios_operaciones
integer x = 279
integer y = 216
integer width = 279
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
string text = "Usuario ..."
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_usuarios_operaciones
integer x = 27
integer y = 1348
integer width = 855
integer height = 256
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Manejo de los Permisos de los Menus y Botones para los Usuarios."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_usuarios_operaciones
integer x = 1797
integer y = 1540
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

type imprimir from picturebutton within w_usuarios_operaciones
integer x = 1819
integer y = 1380
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

event clicked;Long cuenta_filas
SELECT COUNT(*) INTO :cuenta_filas FROM usuario_permiso_transferencias;

IF cuenta_filas < 1 THEN
	MessageBox("Mensaje...","! No Hay Datos de la Tabla...~r~nusuario_permiso_transferencias para Imprimir ¡",Information!)
	RETURN
END IF	

w_segunda.Tag = "Generando Reporte de los Permisos de los Usuarios... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)

//st_pasa_datos lst_pasa_datos
//lst_pasa_datos.codigo_pasa = codigo_linea
//lst_pasa_datos.nombre_pasa = descripcion
//
//OpenWithParm(w_imprime_menus_botones,lst_pasa_datos)
////*********************************************************//
////*****************************************//
////*** RECIBIMOS LOS DATOS DE LA ESTRUCTURA ***//
////*****************************************//
//lst_pasa_datos = Message.PowerObjectParm
////*****************************************//
Open(w_imprime_permisos_usuarios)
end event

type st_1 from statictext within w_usuarios_operaciones
integer x = 59
integer y = 32
integer width = 2386
integer height = 108
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16777215
long backcolor = 8421504
boolean enabled = false
string text = "Permisos para los Usuarios"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_usuarios_operaciones
integer x = 2025
integer y = 1540
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

type limpiar from picturebutton within w_usuarios_operaciones
integer x = 2030
integer y = 1380
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

event clicked;dw_2.Enabled= FALSE
dw_3.Enabled= TRUE
dw_2.InsertRow(0)
dw_2.GetChild("descripcion_menu",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()


dw_1.settransobject(sqlca)
dw_1.retrieve("","")
cta_filas = dw_1.RowCount()

end event

type st_5 from statictext within w_usuarios_operaciones
integer x = 2249
integer y = 1540
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

type salir from picturebutton within w_usuarios_operaciones
integer x = 2240
integer y = 1380
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

	String permiso

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
	permiso	= dw_1.GetItemString(fila,"usuario_permiso_juridica_permiso_s")		
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,5,permiso)
	//*********************************************************//
	
	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	
	Integer res
	res = MessageBox("Mensaje...","¿ Desea Salvar los Cambios Realizados ?",Question!,YesNo!,2)
	IF res = 2 THEN
		Close(w_usuarios_operaciones)
	ELSE
		Integer acepto
		acepto = dw_1.AcceptText()
		IF acepto > 0 THEN
			dw_1.Update()
			MessageBox("Mensaje...","! Se ha Actualizado la Báse de Datos ¡",Information!)
			Close(w_usuarios_operaciones)
		ELSE
			MessageBox("Mensaje...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
			Close(w_usuarios_operaciones)
		END IF	
	END IF	
ELSE	
	Close(w_usuarios_operaciones)
END IF	
end event

type st_8 from statictext within w_usuarios_operaciones
integer x = 1595
integer y = 1540
integer width = 201
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

type grabar from picturebutton within w_usuarios_operaciones
integer x = 1595
integer y = 1380
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
string powertiptext = "Grabar"
end type

event clicked;IF dw_1.RowCount() < 1 THEN
	MessageBox("Mensaje - Validación...","! No Hay Información para Grabar ¡",Information!)
	RETURN
END IF	
//**********************************************************************************//
//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
//**********************************************************************************//

//**************************************************//
//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
//**************************************************//
String permiso
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
permiso	= dw_1.GetItemString(fila,"permiso_si_no")
//*********************************************************//
//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
//*********************************************************//
dw_1.SetItem(fila,5,permiso)
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
	dw_1.retrieve(usuario,codigo_menu)	
	cta_filas = dw_1.RowCount()	
ELSE
	ROLLBACK USING SQLCA;
	MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
	dw_1.settransobject(sqlca)
	dw_1.retrieve(usuario,codigo_menu)	
	cta_filas = dw_1.RowCount()
END IF
//*****************************************************************//
end event

type dw_1 from datawindow within w_usuarios_operaciones
integer x = 46
integer y = 456
integer width = 2391
integer height = 860
integer taborder = 30
boolean enabled = false
boolean titlebar = true
string title = "Escoja el Usuario y el Menu ..."
string dataobject = "dw_permisos_usuarios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;fila = dw_1.GetClickedRow( )

end event

event itemchanged;//codigo_boton  		= dw_hijo_dw_2.GetItemString(dw_hijo_dw_2.GetRow(),"codigo_boton")
//descripcion_boton = dw_hijo_dw_2.GetItemString(dw_hijo_dw_2.GetRow(),"descripcion_boto")
//
////MessageBox("Mensaje...","El Código del Boton es... "+codigo_boton,Information!)
//
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

event constructor;//dw_1.InsertRow(0)
//dw_1.GetChild("codigo_boton",dw_hijo_dw_2)
//dw_hijo_dw_2.SetTransObject(SQLCA)
//dw_hijo_dw_2.Retrieve()
//
end event

type rr_2 from roundrectangle within w_usuarios_operaciones
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1536
integer y = 1344
integer width = 933
integer height = 300
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_usuarios_operaciones
long linecolor = 16777215
integer linethickness = 5
long fillcolor = 8421504
integer x = 18
integer y = 12
integer width = 2464
integer height = 164
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_usuarios_operaciones
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 79741120
integer x = 229
integer y = 200
integer width = 2053
integer height = 216
integer cornerheight = 40
integer cornerwidth = 46
end type

