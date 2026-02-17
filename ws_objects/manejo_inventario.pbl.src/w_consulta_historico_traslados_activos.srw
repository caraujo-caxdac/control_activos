$PBExportHeader$w_consulta_historico_traslados_activos.srw
$PBExportComments$Ventana para Consutar el Histórico de Trasladados de Activos entre Personas
forward
global type w_consulta_historico_traslados_activos from window
end type
type cb_exportar from commandbutton within w_consulta_historico_traslados_activos
end type
type cb_limpiar from commandbutton within w_consulta_historico_traslados_activos
end type
type cb_ordenar from commandbutton within w_consulta_historico_traslados_activos
end type
type cb_filtrar from commandbutton within w_consulta_historico_traslados_activos
end type
type mle_1 from multilineedit within w_consulta_historico_traslados_activos
end type
type st_2 from statictext within w_consulta_historico_traslados_activos
end type
type imprimir from picturebutton within w_consulta_historico_traslados_activos
end type
type st_1 from statictext within w_consulta_historico_traslados_activos
end type
type st_6 from statictext within w_consulta_historico_traslados_activos
end type
type limpiar from picturebutton within w_consulta_historico_traslados_activos
end type
type st_5 from statictext within w_consulta_historico_traslados_activos
end type
type salir from picturebutton within w_consulta_historico_traslados_activos
end type
type dw_1 from datawindow within w_consulta_historico_traslados_activos
end type
type rr_2 from roundrectangle within w_consulta_historico_traslados_activos
end type
type rr_3 from roundrectangle within w_consulta_historico_traslados_activos
end type
type rr_1 from roundrectangle within w_consulta_historico_traslados_activos
end type
end forward

global type w_consulta_historico_traslados_activos from window
integer x = 5
integer y = 396
integer width = 3689
integer height = 1988
boolean titlebar = true
string title = "Cargos de la Empresa..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
string icon = "OleGenReg!"
cb_exportar cb_exportar
cb_limpiar cb_limpiar
cb_ordenar cb_ordenar
cb_filtrar cb_filtrar
mle_1 mle_1
st_2 st_2
imprimir imprimir
st_1 st_1
st_6 st_6
limpiar limpiar
st_5 st_5
salir salir
dw_1 dw_1
rr_2 rr_2
rr_3 rr_3
rr_1 rr_1
end type
global w_consulta_historico_traslados_activos w_consulta_historico_traslados_activos

type variables
Double cedula_afiliado
Long fila, cta_filas
end variables

on w_consulta_historico_traslados_activos.create
this.cb_exportar=create cb_exportar
this.cb_limpiar=create cb_limpiar
this.cb_ordenar=create cb_ordenar
this.cb_filtrar=create cb_filtrar
this.mle_1=create mle_1
this.st_2=create st_2
this.imprimir=create imprimir
this.st_1=create st_1
this.st_6=create st_6
this.limpiar=create limpiar
this.st_5=create st_5
this.salir=create salir
this.dw_1=create dw_1
this.rr_2=create rr_2
this.rr_3=create rr_3
this.rr_1=create rr_1
this.Control[]={this.cb_exportar,&
this.cb_limpiar,&
this.cb_ordenar,&
this.cb_filtrar,&
this.mle_1,&
this.st_2,&
this.imprimir,&
this.st_1,&
this.st_6,&
this.limpiar,&
this.st_5,&
this.salir,&
this.dw_1,&
this.rr_2,&
this.rr_3,&
this.rr_1}
end on

on w_consulta_historico_traslados_activos.destroy
destroy(this.cb_exportar)
destroy(this.cb_limpiar)
destroy(this.cb_ordenar)
destroy(this.cb_filtrar)
destroy(this.mle_1)
destroy(this.st_2)
destroy(this.imprimir)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.limpiar)
destroy(this.st_5)
destroy(this.salir)
destroy(this.dw_1)
destroy(this.rr_2)
destroy(this.rr_3)
destroy(this.rr_1)
end on

event open;m_principal.m_manejodeactivos.m_consultahistóricodetraslados.Checked = TRUE

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

	codigo_menu_ventana = "M77"
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

//		IF Lower(nombre_boton) = "traer" AND permiso_saca = "S" THEN
//			traer.Enabled = TRUE
//		END IF	
		
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
	CLOSE(w_consulta_historico_traslados_activos)
	RETURN
END IF


dw_1.settransobject(sqlca)
dw_1.retrieve()
cta_filas = dw_1.RowCount()
end event

event close;m_principal.m_manejodeactivos.m_consultahistóricodetraslados.Checked = FALSE
end event

type cb_exportar from commandbutton within w_consulta_historico_traslados_activos
integer x = 1952
integer y = 1728
integer width = 402
integer height = 100
integer taborder = 80
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
String exportar_formatos
exportar_formatos = "S"
DO WHILE condicion = TRUE
	nombre_archivo = gb_directorio_salida+"\Historico Trasalado Activos"
		
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
		value_as = dw_1.SaveAs(nombre_archivo,Excel8!,TRUE)
	CASE "DBF"
		value_as = dw_1.SaveAs(nombre_archivo,dBASE3!,TRUE)
	CASE "TXT"
		value_as = dw_1.SaveAs(nombre_archivo,Text!,TRUE)
	CASE "CSV"
		value_as = dw_1.SaveAs(nombre_archivo,CSV!,TRUE)
	CASE "PDF"
		dw_1.Object.DataWindow.Export.PDF.Distill.CustomPostScript=1
		dw_1.Object.DataWindow.Printer="Sybase DataWindow PS"				
		value_as = dw_1.SaveAs(nombre_archivo,PDF!,TRUE)
	CASE "HTML"
		value_as = dw_1.SaveAs(nombre_archivo,HTMLTable!,TRUE)
END CHOOSE

IF value_as = -1 THEN
	MessageBox("Mensaje - Validación...","! Ocurrio un ERROR al Salvar el Archivo... "+TRIM(nombre_archivo)+&
			" ¡",StopSign!)
	RETURN
ELSE
	rta = MessageBox("Mensaje - Validación...","! El Archivo... "+TRIM(nombre_archivo)+&
			" se Salvo Correctamente ¡~r~n~r~n¿ Desea Abrir el Archivo ?",Question!,YesNo!,2)
				
	IF rta = 1 THEN
		IF	RUN("rundll32.exe url.dll,FileProtocolHandler "+ nombre_archivo) = -1 THEN
			MessageBox("Mensaje - Validación...","! No se Pudo Abrir el Archivo "+nombre_archivo +" ¡",StopSign!)
		END IF	
	END IF	
END IF
//***********************************************************************************//
end event

type cb_limpiar from commandbutton within w_consulta_historico_traslados_activos
integer x = 1952
integer y = 1632
integer width = 402
integer height = 100
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Limpiar"
end type

event clicked;dw_1.SetRedraw(false)
dw_1.SetFilter("")
dw_1.Filter()
dw_1.SetRedraw(true)
dw_1.SetRedraw(false)
dw_1.SetSort("descripcion_tercero_entrega A, fecha_cambio A, descripcion_tipo_inventario A, descripcion_clase_activo A, descripcion_corta A, placa_inventario A")
dw_1.Sort()
dw_1.SetRedraw(true)
dw_1.GroupCalc()
end event

type cb_ordenar from commandbutton within w_consulta_historico_traslados_activos
integer x = 1554
integer y = 1728
integer width = 402
integer height = 100
integer taborder = 70
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
dw_1.SetSort(a)
dw_1.Sort()
dw_1.GroupCalc()
end event

type cb_filtrar from commandbutton within w_consulta_historico_traslados_activos
integer x = 1554
integer y = 1632
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
string text = "&Filtrar"
end type

event clicked;String a
SetNull(a)
dw_1.SetFilter(a)
dw_1.Filter()
dw_1.GroupCalc()
end event

type mle_1 from multilineedit within w_consulta_historico_traslados_activos
integer x = 59
integer y = 1616
integer width = 933
integer height = 252
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Ventana para la Consulta del Histórico de Traslados de Activos entre Empleados de la Compañía."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_2 from statictext within w_consulta_historico_traslados_activos
integer x = 2939
integer y = 1784
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

type imprimir from picturebutton within w_consulta_historico_traslados_activos
integer x = 2962
integer y = 1612
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
w_segunda.Tag = "Generando Reporte... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)
Open(w_imprime_historico_traslados_activos)
end event

type st_1 from statictext within w_consulta_historico_traslados_activos
integer x = 73
integer y = 36
integer width = 3552
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
string text = "Consulta Histórico de Traslados de Activos"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_consulta_historico_traslados_activos
integer x = 3173
integer y = 1784
integer width = 219
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

type limpiar from picturebutton within w_consulta_historico_traslados_activos
integer x = 3191
integer y = 1612
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

type st_5 from statictext within w_consulta_historico_traslados_activos
integer x = 3438
integer y = 1784
integer width = 151
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

type salir from picturebutton within w_consulta_historico_traslados_activos
integer x = 3415
integer y = 1612
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
	String codigo_cargo, descripcion_cargo, activo_si_no
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

	codigo_cargo			= dw_1.GetItemString(fila,"codigo_cargo")
	descripcion_cargo		= dw_1.GetItemString(fila,"descripcion_cargo")
	activo_si_no			= dw_1.GetItemString(fila,"activo_si_no")
	
	IF IsNull(activo_si_no) THEN activo_si_no = "S"
	
	//*********************************************************//
	//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
	//*********************************************************//
	dw_1.SetItem(fila,1,codigo_cargo)
	dw_1.SetItem(fila,2,descripcion_cargo)
	dw_1.SetItem(fila,3,activo_si_no)
	//*********************************************************//

	//*****************************************************************//
	//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
	//*****************************************************************//
	Integer res
	res = MessageBox("Mensaje - Validación...","¿ Desea Salvar los Cambios Realizados ?",Question!,YesNo!,2)
	IF res = 2 THEN
		Close(w_consulta_historico_traslados_activos)
	ELSE
		Integer acepto
		acepto = dw_1.AcceptText()
		IF acepto > 0 THEN
			dw_1.Update()
			MessageBox("Mensaje - Validación...","! Se ha Actualizado la Báse de Datos ¡",Information!)
			Close(w_consulta_historico_traslados_activos)
		ELSE
			MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
			Close(w_consulta_historico_traslados_activos)
		END IF	
	END IF	
ELSE	
	Close(w_consulta_historico_traslados_activos)
END IF	
end event

type dw_1 from datawindow within w_consulta_historico_traslados_activos
integer x = 41
integer y = 188
integer width = 3602
integer height = 1364
integer taborder = 10
string dataobject = "dw_consulta_historico_traslados_activos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;IF fila > 0 THEN
	dw_1.SelectRow(fila, FALSE)
	fila = GetClickedRow()
	IF fila < 1 THEN 
		MessageBox("Mensaje...","! Por Favor Dar Clicked sobre la fila ¡",Exclamation!)
		RETURN
	END IF	
	dw_1.SelectRow(fila, TRUE)
ELSE
	fila = GetClickedRow()
	IF fila < 1 THEN 
		MessageBox("Mensaje...","! Por Favor Dar Clicked sobre la fila ¡",Exclamation!)
		RETURN
	END IF
	dw_1.SelectRow(fila, TRUE)
END IF	

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

event retrievestart;w_segunda.Tag = "Cargando Datos del DataWindows... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
w_segunda.SetMicrohelp(w_segunda.Tag)				

end event

type rr_2 from roundrectangle within w_consulta_historico_traslados_activos
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 2907
integer y = 1588
integer width = 736
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_consulta_historico_traslados_activos
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 12639424
integer x = 37
integer y = 12
integer width = 3616
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_consulta_historico_traslados_activos
long linecolor = 128
integer linethickness = 4
long fillcolor = 15793151
integer x = 1536
integer y = 1612
integer width = 841
integer height = 232
integer cornerheight = 40
integer cornerwidth = 46
end type

