$PBExportHeader$w_captura_inventario_activos_fijos.srw
forward
global type w_captura_inventario_activos_fijos from window
end type
type p_3 from picture within w_captura_inventario_activos_fijos
end type
type cbx_1 from checkbox within w_captura_inventario_activos_fijos
end type
type cb_1 from commandbutton within w_captura_inventario_activos_fijos
end type
type sle_1 from singlelineedit within w_captura_inventario_activos_fijos
end type
type dw_6 from datawindow within w_captura_inventario_activos_fijos
end type
type em_identificacion_tercero from editmask within w_captura_inventario_activos_fijos
end type
type mle_1 from multilineedit within w_captura_inventario_activos_fijos
end type
type salir from picturebutton within w_captura_inventario_activos_fijos
end type
type st_17 from statictext within w_captura_inventario_activos_fijos
end type
type st_14 from statictext within w_captura_inventario_activos_fijos
end type
type limpiar from picturebutton within w_captura_inventario_activos_fijos
end type
type st_13 from statictext within w_captura_inventario_activos_fijos
end type
type grabar from picturebutton within w_captura_inventario_activos_fijos
end type
type st_16 from statictext within w_captura_inventario_activos_fijos
end type
type st_15 from statictext within w_captura_inventario_activos_fijos
end type
type st_12 from statictext within w_captura_inventario_activos_fijos
end type
type st_11 from statictext within w_captura_inventario_activos_fijos
end type
type em_vida_util from editmask within w_captura_inventario_activos_fijos
end type
type em_vlr_compra from editmask within w_captura_inventario_activos_fijos
end type
type st_9 from statictext within w_captura_inventario_activos_fijos
end type
type st_8 from statictext within w_captura_inventario_activos_fijos
end type
type em_fecha_compra from editmask within w_captura_inventario_activos_fijos
end type
type sle_serial from singlelineedit within w_captura_inventario_activos_fijos
end type
type st_7 from statictext within w_captura_inventario_activos_fijos
end type
type st_6 from statictext within w_captura_inventario_activos_fijos
end type
type dw_1 from datawindow within w_captura_inventario_activos_fijos
end type
type p_2 from picture within w_captura_inventario_activos_fijos
end type
type em_sticker from editmask within w_captura_inventario_activos_fijos
end type
type st_5 from statictext within w_captura_inventario_activos_fijos
end type
type st_2 from statictext within w_captura_inventario_activos_fijos
end type
type dw_5 from datawindow within w_captura_inventario_activos_fijos
end type
type dw_4 from datawindow within w_captura_inventario_activos_fijos
end type
type dw_2 from datawindow within w_captura_inventario_activos_fijos
end type
type dw_3 from datawindow within w_captura_inventario_activos_fijos
end type
type st_3 from statictext within w_captura_inventario_activos_fijos
end type
type st_4 from statictext within w_captura_inventario_activos_fijos
end type
type st_10 from statictext within w_captura_inventario_activos_fijos
end type
type st_1 from statictext within w_captura_inventario_activos_fijos
end type
type gb_1 from groupbox within w_captura_inventario_activos_fijos
end type
type rr_3 from roundrectangle within w_captura_inventario_activos_fijos
end type
type p_1 from picture within w_captura_inventario_activos_fijos
end type
type gb_2 from groupbox within w_captura_inventario_activos_fijos
end type
type gb_3 from groupbox within w_captura_inventario_activos_fijos
end type
type gb_4 from groupbox within w_captura_inventario_activos_fijos
end type
type rr_2 from roundrectangle within w_captura_inventario_activos_fijos
end type
end forward

global type w_captura_inventario_activos_fijos from window
integer x = 5
integer y = 396
integer width = 4082
integer height = 2024
boolean titlebar = true
string title = "Captura del Inventario de Activos Fijos..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "DataWindow5!"
p_3 p_3
cbx_1 cbx_1
cb_1 cb_1
sle_1 sle_1
dw_6 dw_6
em_identificacion_tercero em_identificacion_tercero
mle_1 mle_1
salir salir
st_17 st_17
st_14 st_14
limpiar limpiar
st_13 st_13
grabar grabar
st_16 st_16
st_15 st_15
st_12 st_12
st_11 st_11
em_vida_util em_vida_util
em_vlr_compra em_vlr_compra
st_9 st_9
st_8 st_8
em_fecha_compra em_fecha_compra
sle_serial sle_serial
st_7 st_7
st_6 st_6
dw_1 dw_1
p_2 p_2
em_sticker em_sticker
st_5 st_5
st_2 st_2
dw_5 dw_5
dw_4 dw_4
dw_2 dw_2
dw_3 dw_3
st_3 st_3
st_4 st_4
st_10 st_10
st_1 st_1
gb_1 gb_1
rr_3 rr_3
p_1 p_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
rr_2 rr_2
end type
global w_captura_inventario_activos_fijos w_captura_inventario_activos_fijos

type variables
Long fila, cta_filas

DataWindowChild dw_hijo_dw_1, dw_hijo_dw_2, dw_hijo_dw_3, dw_hijo_dw_4, dw_hijo_dw_5, dw_hijo_dw_6
String codigo_tipo_inventario, descripcion_tipo_inventario
String descripcion_clase_activo, codigo_clase_de_activo
String codigo_marca, descripcion_marca
String codigo_modelo, descripcion_modelo, descripcion_corta
String clase_documento, descripcion_tercero, descripcion_cargo
String clase_documento_tercero, descripcion_documento_tercero, descripcion_tercero_tercero
Double identificacion_tercero
Double identificacion
Double placa_inventario, valor_compra
String serial
Date fecha_compra
Integer vida_util_meses
end variables

on w_captura_inventario_activos_fijos.create
this.p_3=create p_3
this.cbx_1=create cbx_1
this.cb_1=create cb_1
this.sle_1=create sle_1
this.dw_6=create dw_6
this.em_identificacion_tercero=create em_identificacion_tercero
this.mle_1=create mle_1
this.salir=create salir
this.st_17=create st_17
this.st_14=create st_14
this.limpiar=create limpiar
this.st_13=create st_13
this.grabar=create grabar
this.st_16=create st_16
this.st_15=create st_15
this.st_12=create st_12
this.st_11=create st_11
this.em_vida_util=create em_vida_util
this.em_vlr_compra=create em_vlr_compra
this.st_9=create st_9
this.st_8=create st_8
this.em_fecha_compra=create em_fecha_compra
this.sle_serial=create sle_serial
this.st_7=create st_7
this.st_6=create st_6
this.dw_1=create dw_1
this.p_2=create p_2
this.em_sticker=create em_sticker
this.st_5=create st_5
this.st_2=create st_2
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_2=create dw_2
this.dw_3=create dw_3
this.st_3=create st_3
this.st_4=create st_4
this.st_10=create st_10
this.st_1=create st_1
this.gb_1=create gb_1
this.rr_3=create rr_3
this.p_1=create p_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.rr_2=create rr_2
this.Control[]={this.p_3,&
this.cbx_1,&
this.cb_1,&
this.sle_1,&
this.dw_6,&
this.em_identificacion_tercero,&
this.mle_1,&
this.salir,&
this.st_17,&
this.st_14,&
this.limpiar,&
this.st_13,&
this.grabar,&
this.st_16,&
this.st_15,&
this.st_12,&
this.st_11,&
this.em_vida_util,&
this.em_vlr_compra,&
this.st_9,&
this.st_8,&
this.em_fecha_compra,&
this.sle_serial,&
this.st_7,&
this.st_6,&
this.dw_1,&
this.p_2,&
this.em_sticker,&
this.st_5,&
this.st_2,&
this.dw_5,&
this.dw_4,&
this.dw_2,&
this.dw_3,&
this.st_3,&
this.st_4,&
this.st_10,&
this.st_1,&
this.gb_1,&
this.rr_3,&
this.p_1,&
this.gb_2,&
this.gb_3,&
this.gb_4,&
this.rr_2}
end on

on w_captura_inventario_activos_fijos.destroy
destroy(this.p_3)
destroy(this.cbx_1)
destroy(this.cb_1)
destroy(this.sle_1)
destroy(this.dw_6)
destroy(this.em_identificacion_tercero)
destroy(this.mle_1)
destroy(this.salir)
destroy(this.st_17)
destroy(this.st_14)
destroy(this.limpiar)
destroy(this.st_13)
destroy(this.grabar)
destroy(this.st_16)
destroy(this.st_15)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.em_vida_util)
destroy(this.em_vlr_compra)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.em_fecha_compra)
destroy(this.sle_serial)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.dw_1)
destroy(this.p_2)
destroy(this.em_sticker)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_10)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.rr_3)
destroy(this.p_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.rr_2)
end on

event open;m_principal.m_manejodeactivos.m_capturadelinventario.Checked = TRUE

IF gb_usuario <> "sa" THEN
	String codigo_menu_ventana, permiso_ventana
	//******************************************************************************//
	//*** ENTRO A BUSCAR LOS PERMISOS EN LA TABLA usuario_permiso_cta_individual ***//
	//******************************************************************************//
	//generar.enabled		= FALSE
	//traer.enabled		= FALSE
	//insertar.enabled	= FALSE
	grabar.enabled		= FALSE
	//eliminar.enabled	= FALSE
	salir.enabled		= FALSE
	//imprimir.enabled	= FALSE
	limpiar.enabled 	= FALSE
	permiso_ventana   = "N"
	w_segunda.Tag = "Ejecuntando CURSOR activa_botones... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	String nombre_boton
	String permiso_saca, boton_saca

	codigo_menu_ventana = "M10"
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
		
		IF Lower(nombre_boton) = "grabar" AND permiso_saca = "S" THEN
			grabar.Enabled = TRUE
		END IF
		
//		IF Lower(nombre_boton) = "eliminar" AND permiso_saca = "S" THEN
//			eliminar.Enabled = TRUE
//		END IF
		
		IF Lower(nombre_boton) = "salir" AND permiso_saca = "S" THEN
			salir.Enabled = TRUE
		END IF							

//		IF Lower(nombre_boton) = "imprimir" AND permiso_saca = "S" THEN
//			imprimir.Enabled = TRUE
//		END IF					

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
	CLOSE(w_captura_inventario_activos_fijos)
	RETURN
END IF

cbx_1.Checked = TRUE

SetNull(codigo_tipo_inventario)
SetNull(codigo_clase_de_activo)
SetNull(codigo_marca)
SetNull(codigo_modelo)
SetNull(clase_documento)
SetNull(identificacion)
SetNull(descripcion_tercero)

SetNull(placa_inventario)
SetNull(valor_compra)
SetNull(fecha_compra)
SetNull(vida_util_meses)
setNull(serial)
SetNull(clase_documento_tercero)
SetNull(identificacion_tercero)
SetNull(descripcion_tercero_tercero)

sle_1.text = "Tercero para Factura"

dw_3.Enabled = FALSE
dw_4.Enabled = FALSE
dw_5.Enabled = FALSE

dw_2.Enabled = TRUE
dw_2.SetFocus()

end event

event close;m_principal.m_manejodeactivos.m_capturadelinventario.Checked = FALSE
end event

type p_3 from picture within w_captura_inventario_activos_fijos
integer x = 3054
integer y = 1520
integer width = 137
integer height = 112
boolean bringtotop = true
string picturename = "C:\Muñecos\BITMAPS\rolodex4.bmp"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_captura_inventario_activos_fijos
integer x = 2478
integer y = 1676
integer width = 722
integer height = 68
integer taborder = 150
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Hacer Comprobante"
boolean lefttext = true
end type

type cb_1 from commandbutton within w_captura_inventario_activos_fijos
integer x = 1902
integer y = 1656
integer width = 517
integer height = 92
integer taborder = 130
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cargar Tercero"
end type

event clicked;Long cuenta_filas
em_identificacion_tercero.GetData(identificacion_tercero)

IF IsNull(clase_documento_tercero) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar la Clase de Documento del Tercero de la Factura ¡",StopSign!)
	RETURN
END IF

IF IsNull(identificacion_tercero) OR identificacion_tercero = 0 THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar la Identificación del Tercero de la Factura ¡",StopSign!)
	RETURN
END IF

SELECT COUNT(*) INTO :cuenta_filas FROM terceros &
		WHERE clase_documento = :clase_documento_tercero AND identificacion = :identificacion_tercero;
		
IF cuenta_filas = 0 THEN
	MessageBox("Mensaje - Validación...","! No EXISTE en la BD de Terceros esta Identificación "+Trim(clase_documento_tercero)+&
				"-"+String(identificacion_tercero,"###,###,###,###")+" ¡",StopSign!)
	RETURN
END IF

SELECT descripcion_tercero INTO :descripcion_tercero_tercero FROM terceros &
		WHERE clase_documento = :clase_documento_tercero AND identificacion = :identificacion_tercero;

sle_1.text = descripcion_tercero_tercero
end event

type sle_1 from singlelineedit within w_captura_inventario_activos_fijos
integer x = 1102
integer y = 1776
integer width = 1321
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "Tercero para Factura"
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_captura_inventario_activos_fijos
integer x = 1102
integer y = 1552
integer width = 1317
integer height = 92
integer taborder = 110
string title = "none"
string dataobject = "dw_child_clase_documento_terceros"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_6.InsertRow(0)
dw_6.GetChild("descripcion_documento",dw_hijo_dw_6)
dw_hijo_dw_6.SetTransObject(SQLCA)
dw_hijo_dw_6.Retrieve()
end event

event itemchanged;clase_documento_tercero  		= dw_hijo_dw_6.GetItemString(dw_hijo_dw_6.GetRow(),"clase_documento")
descripcion_documento_tercero	= dw_hijo_dw_6.GetItemString(dw_hijo_dw_6.GetRow(),"descripcion_documento")

end event

type em_identificacion_tercero from editmask within w_captura_inventario_activos_fijos
integer x = 1102
integer y = 1660
integer width = 512
integer height = 92
integer taborder = 120
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###,###,###,###"
end type

type mle_1 from multilineedit within w_captura_inventario_activos_fijos
integer x = 59
integer y = 1544
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
string text = "Ventana para la Captura Final del Inventario Fisíco de la Empresa."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type salir from picturebutton within w_captura_inventario_activos_fijos
integer x = 3785
integer y = 1548
integer width = 183
integer height = 160
integer taborder = 180
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;Close(w_captura_inventario_activos_fijos)
end event

type st_17 from statictext within w_captura_inventario_activos_fijos
integer x = 3781
integer y = 1732
integer width = 187
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

type st_14 from statictext within w_captura_inventario_activos_fijos
integer x = 3360
integer y = 1732
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
string text = "Limpar"
alignment alignment = center!
boolean focusrectangle = false
end type

type limpiar from picturebutton within w_captura_inventario_activos_fijos
integer x = 3369
integer y = 1548
integer width = 183
integer height = 160
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\database_refresh.png"
alignment htextalign = left!
string powertiptext = "Limpiar Ventana"
end type

event clicked;dw_2.DeleteRow(1)
dw_2.InsertRow(0)
dw_2.GetChild("descripcion_tipo_inventario",dw_hijo_dw_2)
dw_hijo_dw_2.SetTransObject(SQLCA)
dw_hijo_dw_2.Retrieve()

dw_3.DeleteRow(1)
dw_3.InsertRow(0)
dw_3.GetChild("descripcion_clase_activo",dw_hijo_dw_3)

dw_4.DeleteRow(1)
dw_4.InsertRow(0)
dw_4.GetChild("descripcion_marca",dw_hijo_dw_4)

dw_5.DeleteRow(1)
dw_5.InsertRow(0)
dw_5.GetChild("descripcion_corta",dw_hijo_dw_5)

dw_1.DeleteRow(1)
dw_1.InsertRow(0)
dw_1.GetChild("descripcion_tercero",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()

dw_6.DeleteRow(1)
dw_6.InsertRow(0)
dw_6.GetChild("descripcion_documento",dw_hijo_dw_6)
dw_hijo_dw_6.SetTransObject(SQLCA)
dw_hijo_dw_6.Retrieve()


SetNull(codigo_tipo_inventario)
SetNull(codigo_clase_de_activo)
SetNull(codigo_marca)
SetNull(codigo_modelo)
SetNull(clase_documento)
SetNull(identificacion)
SetNull(descripcion_tercero)

SetNull(placa_inventario)
SetNull(valor_compra)
SetNull(fecha_compra)
SetNull(vida_util_meses)
setNull(serial)
SetNull(clase_documento_tercero)
SetNull(identificacion_tercero)
SetNull(descripcion_tercero_tercero)

em_sticker.Text = ""
em_vlr_compra.Text = ""
em_fecha_compra.Text = ""
em_vida_util.Text = ""
sle_serial.Text = ""
em_identificacion_tercero.Text = ""
sle_1.text = "Tercero para Factura"
cbx_1.Checked = TRUE

dw_3.Enabled = FALSE
dw_4.Enabled = FALSE
dw_5.Enabled = FALSE

dw_2.Enabled = TRUE
dw_2.SetFocus()
end event

type st_13 from statictext within w_captura_inventario_activos_fijos
integer x = 3570
integer y = 1732
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
string text = "Grabar"
alignment alignment = center!
boolean focusrectangle = false
end type

type grabar from picturebutton within w_captura_inventario_activos_fijos
integer x = 3575
integer y = 1548
integer width = 183
integer height = 160
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string picturename = "C:\Muñecos\BITMAPS\database_save.png"
alignment htextalign = left!
string powertiptext = "Grabar Inventario"
end type

event clicked;String frase_salida, estado_activo
Integer rta
Long cuenta_filas_tabla

estado_activo = "A"

em_sticker.GetData(placa_inventario)
em_vlr_compra.GetData(valor_compra)
em_fecha_compra.GetData(fecha_compra)
vida_util_meses = Integer(em_vida_util.Text)
serial=sle_serial.Text

IF cbx_1.Checked = TRUE THEN
	IF IsNull(clase_documento_tercero) OR IsNull(identificacion_tercero) OR IsNull(descripcion_tercero_tercero) THEN
		MessageBox("Mensaje - Validación...","! Hace Falta Ingresar la Identificación del Vendendor del Activo para la Contabilización ¡",StopSign!)
		RETURN		
	END IF
END IF

IF IsNull(codigo_tipo_inventario) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar el Tipo de Inventario ¡",StopSign!)
	RETURN
END IF
IF IsNull(codigo_clase_de_activo) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar la Clase de Activo ¡",StopSign!)
	RETURN
END IF
IF IsNull(codigo_marca) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar el Fabricante ¡",StopSign!)
	RETURN
END IF
IF IsNull(codigo_modelo) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar el Modelo ¡",StopSign!)
	RETURN
END IF
IF IsNull(identificacion) OR IsNull(clase_documento) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar el Responsable ¡",StopSign!)
	RETURN
END IF
IF IsNull(placa_inventario) OR placa_inventario = 0 THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar la Placa de Inventario o Sticker ¡",StopSign!)
	RETURN
END IF
IF IsNull(valor_compra) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar el Valor de Compra ¡",StopSign!)
	RETURN
END IF
IF IsNull(fecha_compra) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar la Fecha de Compra ¡",StopSign!)
	RETURN
END IF
IF IsNull(serial) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Ingresar el Serial ¡",StopSign!)
	RETURN
END IF
IF IsNull(vida_util_meses) THEN
	vida_util_meses = 0
END IF


SELECT COUNT(*) INTO :cuenta_filas_tabla FROM activos_inventario_fisico WHERE codigo_tipo_inventario = :codigo_tipo_inventario AND &
	codigo_clase_de_activo = :codigo_clase_de_activo AND codigo_marca = :codigo_marca AND &
	codigo_modelo = :codigo_modelo AND placa_inventario = :placa_inventario;
	
IF cuenta_filas_tabla = 1 THEN
	MessageBox("Mensaje - Validación...","! Ya EXISTE este Modelo de Activo con la Placa de Inventario (Sticker) ¡",StopSign!)
	RETURN
END IF

frase_salida = "Está Seguro de Registrar el Activo de las Siguientes Características :"+"~r~n~r~n"+&
					"...Tipo de Inventario : "+Trim(descripcion_tipo_inventario)+" ("+Trim(codigo_tipo_inventario)+")"+"~r~n"+&
					"...Clase de Activo      : "+Trim(descripcion_clase_activo)+" ("+Trim(codigo_clase_de_activo)+")"+"~r~n"+&
					"...Fabricante               : "+Trim(descripcion_marca)+" ("+Trim(codigo_marca)+")"+"~r~n"+&
					"...Modelo                   : "+Trim(descripcion_corta)+" ("+Trim(codigo_modelo)+")"+"~r~n"+&
					"...Responsable            : "+Trim(descripcion_tercero)+" ("+Trim(clase_documento)+"-"+String(identificacion,"###,###,###,###")+")"+"~r~n"+&
					"----------------------------------------------------------"+"~r~n"+&
					"...Placa Inventario   : "+String(placa_inventario)+"~r~n"+&
					"...Serial             : "+trim(serial)+"~r~n"+&					
					"...Valor de Compra    : "+String(valor_compra,"$###,###,###,###")+"~r~n"+&
					"...Fecha de Compra    : "+String(fecha_compra,"dd/mmm/yyyy")+"~r~n"+&
					"...Vida Util (meses)  : "+String(vida_util_meses,"###")+"~r~n"
					
					
rta = MessageBox("Mensaje - Validación...",frase_salida,Question!,YesNo!,2)

IF rta = 2 THEN RETURN

IF cbx_1.Checked = TRUE THEN
	//********************************//
	//*** Contabilizamos la Compra ***//
	//********************************//
	st_error lst_error
	w_segunda.Tag = "! ESPERE POR FAVOR ¡ Ejecutando Procedimiento Almacenado activos_contabiliza_compra... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)

	SetPointer(HourGlass!)

	lst_error = fx_activos_contabiliza_compra(DateTime(fecha_compra), valor_compra, clase_documento_tercero, identificacion_tercero, codigo_tipo_inventario)
	w_captura_inventario_activos_fijos.Pointer = "Arrow!"

	IF lst_error.codigo_error <> 2 THEN
		MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
		RETURN
	ELSE
		MessageBox("Mensaje - Validación... ",lst_error.mensaje_error,StopSign!)
	END IF	
	//********************************//	
END IF

INSERT INTO activos_inventario_fisico (codigo_tipo_inventario, codigo_clase_de_activo, codigo_marca, codigo_modelo, &
		placa_inventario, serial, clase_documento_responsable, identificacion_responsable, fecha_compra, valor_compra, &
		vida_util_meses, estado_activo) &
		VALUES(:codigo_tipo_inventario, :codigo_clase_de_activo, :codigo_marca, :codigo_modelo, &
		:placa_inventario, :serial, :clase_documento, :identificacion, :fecha_compra, :valor_compra, &
		:vida_util_meses, :estado_activo);

IF SQLCA.SQLCode  <> 0 THEN
	w_segunda.Tag = "Ocurrió un Error en la Inserción de una Fila... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)		
	MessageBox("Error de la Base de Datos - Código "+string(SQLCA.SQLCode)+"...","Mensaje : "+Trim(SQLCA.SQLErrText)+"~r~n~r~n"+&
				" ! Error INSERTANDO en la Tabla ¡",StopSign!)
	w_segunda.Tag = "Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	RETURN
ELSE
	MessageBox("Mensaje - Validación...","! Se INSERTO una Fila en la Base de Datos ¡",Information!)
END IF

dw_2.DeleteRow(1)
dw_2.InsertRow(0)
dw_2.GetChild("descripcion_tipo_inventario",dw_hijo_dw_2)
dw_hijo_dw_2.SetTransObject(SQLCA)
dw_hijo_dw_2.Retrieve()

dw_3.DeleteRow(1)
dw_3.InsertRow(0)
dw_3.GetChild("descripcion_clase_activo",dw_hijo_dw_3)

dw_4.DeleteRow(1)
dw_4.InsertRow(0)
dw_4.GetChild("descripcion_marca",dw_hijo_dw_4)

dw_5.DeleteRow(1)
dw_5.InsertRow(0)
dw_5.GetChild("descripcion_corta",dw_hijo_dw_5)

dw_1.DeleteRow(1)
dw_1.InsertRow(0)
dw_1.GetChild("descripcion_tercero",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()

SetNull(codigo_tipo_inventario)
SetNull(codigo_clase_de_activo)
SetNull(codigo_marca)
SetNull(codigo_modelo)
SetNull(clase_documento)
SetNull(identificacion)
SetNull(descripcion_tercero)

SetNull(placa_inventario)
SetNull(valor_compra)
SetNull(fecha_compra)
SetNull(vida_util_meses)
setNull(serial)

em_sticker.Text = ""
em_vlr_compra.Text = ""
em_fecha_compra.Text = ""
em_vida_util.Text = ""
sle_serial.Text = ""


dw_3.Enabled = FALSE
dw_4.Enabled = FALSE
dw_5.Enabled = FALSE

dw_2.Enabled = TRUE
dw_2.SetFocus()

end event

type st_16 from statictext within w_captura_inventario_activos_fijos
integer x = 3511
integer y = 1340
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "(Meses)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_15 from statictext within w_captura_inventario_activos_fijos
integer x = 2373
integer y = 1340
integer width = 539
integer height = 64
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

type st_12 from statictext within w_captura_inventario_activos_fijos
integer x = 2350
integer y = 1340
integer width = 539
integer height = 64
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

type st_11 from statictext within w_captura_inventario_activos_fijos
integer x = 3483
integer y = 1144
integer width = 453
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Vida Util..."
boolean focusrectangle = false
end type

type em_vida_util from editmask within w_captura_inventario_activos_fijos
integer x = 3483
integer y = 1232
integer width = 453
integer height = 92
integer taborder = 100
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
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "1~~60"
end type

type em_vlr_compra from editmask within w_captura_inventario_activos_fijos
integer x = 2921
integer y = 1232
integer width = 544
integer height = 92
integer taborder = 90
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
string mask = "$###,###,###"
end type

type st_9 from statictext within w_captura_inventario_activos_fijos
integer x = 2921
integer y = 1148
integer width = 608
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Valor de Compra..."
boolean focusrectangle = false
end type

type st_8 from statictext within w_captura_inventario_activos_fijos
integer x = 2350
integer y = 1148
integer width = 539
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Fecha de Compra..."
boolean focusrectangle = false
end type

type em_fecha_compra from editmask within w_captura_inventario_activos_fijos
integer x = 2350
integer y = 1232
integer width = 544
integer height = 92
integer taborder = 80
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
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type sle_serial from singlelineedit within w_captura_inventario_activos_fijos
integer x = 1536
integer y = 1232
integer width = 786
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_captura_inventario_activos_fijos
integer x = 1536
integer y = 1148
integer width = 608
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Serial..."
boolean focusrectangle = false
end type

type st_6 from statictext within w_captura_inventario_activos_fijos
integer x = 87
integer y = 1148
integer width = 608
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Persona Responsable..."
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_captura_inventario_activos_fijos
integer x = 87
integer y = 1232
integer width = 1431
integer height = 92
integer taborder = 60
string title = "none"
string dataobject = "dw_child_personas_responsables"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.InsertRow(0)
dw_1.GetChild("descripcion_tercero",dw_hijo_dw_1)
dw_hijo_dw_1.SetTransObject(SQLCA)
dw_hijo_dw_1.Retrieve()
end event

event itemchanged;clase_documento  		= dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"clase_documento")
identificacion  		= dw_hijo_dw_1.GetItemNumber(dw_hijo_dw_1.GetRow(),"identificacion")
descripcion_tercero	= dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"descripcion_tercero")
descripcion_cargo		= dw_hijo_dw_1.GetItemString(dw_hijo_dw_1.GetRow(),"descripcion_cargo")

Integer rta
rta = MessageBox("Mensaje - Validación...","¿ Desea Cargar el Activo a "+Trim(descripcion_tercero)+" ?",Question!,YesNo!,2)


end event

type p_2 from picture within w_captura_inventario_activos_fijos
integer x = 2994
integer y = 632
integer width = 718
integer height = 264
string picturename = "C:\Muñecos\BITMAPS\codigo_barras.png"
boolean focusrectangle = false
end type

type em_sticker from editmask within w_captura_inventario_activos_fijos
integer x = 2857
integer y = 464
integer width = 987
integer height = 140
integer taborder = 50
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 8388608
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##########"
end type

type st_5 from statictext within w_captura_inventario_activos_fijos
integer x = 2857
integer y = 344
integer width = 841
integer height = 72
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 16777215
string text = "Número de Sticker..."
boolean focusrectangle = false
end type

type st_2 from statictext within w_captura_inventario_activos_fijos
integer x = 69
integer y = 688
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Modelo..."
boolean focusrectangle = false
end type

type dw_5 from datawindow within w_captura_inventario_activos_fijos
integer x = 640
integer y = 676
integer width = 1966
integer height = 92
integer taborder = 40
string title = "none"
string dataobject = "dw_child_modelo_activo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_5.InsertRow(0)
dw_5.GetChild("descripcion_corta",dw_hijo_dw_5)

end event

event itemchanged;codigo_modelo  		= dw_hijo_dw_5.GetItemString(dw_hijo_dw_5.GetRow(),"codigo_modelo")
descripcion_modelo	= dw_hijo_dw_5.GetItemString(dw_hijo_dw_5.GetRow(),"descripcion_modelo")
descripcion_corta		= dw_hijo_dw_5.GetItemString(dw_hijo_dw_5.GetRow(),"descripcion_corta")

Integer rta
rta = MessageBox("Mensaje - Validación...","¿ Desea Escoger el Modelo "+Trim(descripcion_corta)+&
	" (Código "+Trim(codigo_modelo)+") ?",Question!,YesNo!,2)

em_sticker.SetFocus()
end event

type dw_4 from datawindow within w_captura_inventario_activos_fijos
integer x = 640
integer y = 572
integer width = 1966
integer height = 92
integer taborder = 30
string title = "none"
string dataobject = "dw_child_empresas_activos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_4.InsertRow(0)
dw_4.GetChild("descripcion_marca",dw_hijo_dw_4)

end event

event itemchanged;codigo_marca  		= dw_hijo_dw_4.GetItemString(dw_hijo_dw_4.GetRow(),"codigo_marca")
descripcion_marca	= dw_hijo_dw_4.GetItemString(dw_hijo_dw_4.GetRow(),"descripcion_marca")

Integer rta
rta = MessageBox("Mensaje - Validación...","¿ Desea Constultar la Marca "+Trim(descripcion_marca)+&
	" (Código "+Trim(codigo_marca)+") ?",Question!,YesNo!,2)

IF rta = 2 THEN RETURN
dw_4.Enabled = FALSE
dw_5.Enabled = TRUE
dw_hijo_dw_5.settransobject(sqlca)
dw_hijo_dw_5.retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca)
dw_5.SetFocus()

end event

type dw_2 from datawindow within w_captura_inventario_activos_fijos
integer x = 640
integer y = 364
integer width = 1970
integer height = 92
integer taborder = 10
string title = "none"
string dataobject = "dw_child_tipos_inventarios"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_2.InsertRow(0)
dw_2.GetChild("descripcion_tipo_inventario",dw_hijo_dw_2)
dw_hijo_dw_2.SetTransObject(SQLCA)
dw_hijo_dw_2.Retrieve()
end event

event itemchanged;codigo_tipo_inventario  		= dw_hijo_dw_2.GetItemString(dw_hijo_dw_2.GetRow(),"codigo_tipo_inventario")
descripcion_tipo_inventario	= dw_hijo_dw_2.GetItemString(dw_hijo_dw_2.GetRow(),"descripcion_tipo_inventario")

Integer rta
rta = MessageBox("Mensaje - Validación...","¿ Desea Constultar el Tipo de Inventario de "+Trim(descripcion_tipo_inventario)+&
	" (Código "+Trim(codigo_tipo_inventario)+") ?",Question!,YesNo!,2)

IF rta = 2 THEN RETURN
dw_2.Enabled = FALSE
dw_3.Enabled = TRUE
dw_3.SetFocus()

dw_hijo_dw_3.SetTransObject(SQLCA)
dw_hijo_dw_3.Retrieve(codigo_tipo_inventario)

end event

type dw_3 from datawindow within w_captura_inventario_activos_fijos
integer x = 640
integer y = 464
integer width = 1966
integer height = 92
integer taborder = 20
string title = "none"
string dataobject = "dw_child_clase_activo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_3.InsertRow(0)
dw_3.GetChild("descripcion_clase_activo",dw_hijo_dw_3)

end event

event itemchanged;codigo_clase_de_activo  	= dw_hijo_dw_3.GetItemString(dw_hijo_dw_3.GetRow(),"codigo_clase_de_activo")
descripcion_clase_activo	= dw_hijo_dw_3.GetItemString(dw_hijo_dw_3.GetRow(),"descripcion_clase_activo")

Integer rta
rta = MessageBox("Mensaje - Validación...","¿ Desea Constultar la Clase de Activo "+Trim(descripcion_clase_activo)+&
	" (Código "+Trim(codigo_clase_de_activo)+") ?",Question!,YesNo!,2)

IF rta = 2 THEN RETURN
dw_3.Enabled = FALSE
dw_4.Enabled = TRUE
dw_4.SetFocus()

dw_hijo_dw_4.SetTransObject(SQLCA)
dw_hijo_dw_4.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo)
end event

type st_3 from statictext within w_captura_inventario_activos_fijos
integer x = 69
integer y = 580
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Fabricante..."
boolean focusrectangle = false
end type

type st_4 from statictext within w_captura_inventario_activos_fijos
integer x = 69
integer y = 392
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Tipo de Inventario..."
boolean focusrectangle = false
end type

type st_10 from statictext within w_captura_inventario_activos_fijos
integer x = 69
integer y = 484
integer width = 530
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Clase de Activo..."
boolean focusrectangle = false
end type

type st_1 from statictext within w_captura_inventario_activos_fijos
integer x = 59
integer y = 52
integer width = 3963
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
string text = "Captura del Inventario"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_captura_inventario_activos_fijos
integer x = 46
integer y = 280
integer width = 2647
integer height = 644
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Modelo..."
end type

type rr_3 from roundrectangle within w_captura_inventario_activos_fijos
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 12639424
integer x = 23
integer y = 28
integer width = 4027
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

type p_1 from picture within w_captura_inventario_activos_fijos
integer x = 64
integer y = 756
integer width = 283
integer height = 152
boolean bringtotop = true
string picturename = "C:\Muñecos\BITMAPS\image_PC.jpg"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_captura_inventario_activos_fijos
integer x = 2738
integer y = 280
integer width = 1230
integer height = 644
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
end type

type gb_3 from groupbox within w_captura_inventario_activos_fijos
integer x = 41
integer y = 1076
integer width = 3945
integer height = 364
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
string text = "Otros Datos del Activo Fijo"
end type

type gb_4 from groupbox within w_captura_inventario_activos_fijos
integer x = 1065
integer y = 1472
integer width = 2167
integer height = 428
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Información del Tercero de la Factura..."
end type

type rr_2 from roundrectangle within w_captura_inventario_activos_fijos
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 3314
integer y = 1524
integer width = 704
integer height = 292
integer cornerheight = 40
integer cornerwidth = 46
end type

