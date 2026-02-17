$PBExportHeader$w_consulta_inventario.srw
forward
global type w_consulta_inventario from window
end type
type tab_1 from tab within w_consulta_inventario
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type st_2 from statictext within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_2 st_2
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type st_4 from statictext within tabpage_3
end type
type st_3 from statictext within tabpage_3
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
st_4 st_4
st_3 st_3
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type st_7 from statictext within tabpage_4
end type
type st_6 from statictext within tabpage_4
end type
type st_5 from statictext within tabpage_4
end type
type dw_4 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
st_7 st_7
st_6 st_6
st_5 st_5
dw_4 dw_4
end type
type tabpage_5 from userobject within tab_1
end type
type salir from picturebutton within tabpage_5
end type
type eliminar from picturebutton within tabpage_5
end type
type imprimir from picturebutton within tabpage_5
end type
type grabar from picturebutton within tabpage_5
end type
type st_11 from statictext within tabpage_5
end type
type st_10 from statictext within tabpage_5
end type
type st_9 from statictext within tabpage_5
end type
type st_8 from statictext within tabpage_5
end type
type dw_5 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
salir salir
eliminar eliminar
imprimir imprimir
grabar grabar
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
dw_5 dw_5
end type
type tab_1 from tab within w_consulta_inventario
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type
type st_1 from statictext within w_consulta_inventario
end type
type rr_3 from roundrectangle within w_consulta_inventario
end type
end forward

global type w_consulta_inventario from window
integer x = 5
integer y = 396
integer width = 3383
integer height = 1900
boolean titlebar = true
string title = "Consulta del Inventario..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string icon = "Database!"
tab_1 tab_1
st_1 st_1
rr_3 rr_3
end type
global w_consulta_inventario w_consulta_inventario

type variables
String codigo_tipo_inventario, descripcion_tipo_inventario
String codigo_clase_de_activo, descripcion_clase_activo
String codigo_marca, descripcion_marca
String codigo_modelo, descripcion_corta
Long fila, cta_filas
DataWindowChild dw_responsable
end variables

on w_consulta_inventario.create
this.tab_1=create tab_1
this.st_1=create st_1
this.rr_3=create rr_3
this.Control[]={this.tab_1,&
this.st_1,&
this.rr_3}
end on

on w_consulta_inventario.destroy
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.rr_3)
end on

event close;m_principal.m_manejodeactivos.m_consultainventario.Checked = FALSE
end event

event open;m_principal.m_manejodeactivos.m_consultainventario.Checked = TRUE

IF gb_usuario <> "sa" THEN
	String codigo_menu_ventana, permiso_ventana
	//******************************************************************************//
	//*** ENTRO A BUSCAR LOS PERMISOS EN LA TABLA usuario_permiso_cta_individual ***//
	//******************************************************************************//
	//generar.enabled		= FALSE
	//traer.enabled		= FALSE
	//insertar.enabled	= FALSE
	tab_1.tabpage_5.grabar.enabled		= FALSE
	tab_1.tabpage_5.eliminar.enabled	= FALSE
	tab_1.tabpage_5.salir.enabled		= FALSE
	tab_1.tabpage_5.imprimir.enabled	= FALSE
	//limpiar.enabled 	= FALSE
	permiso_ventana   = "N"
	w_segunda.Tag = "Ejecuntando CURSOR activa_botones... "+"      Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(w_segunda.Tag)
	String nombre_boton
	String permiso_saca, boton_saca

	codigo_menu_ventana = "M20"
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
			tab_1.tabpage_5.grabar.Enabled = TRUE
		END IF
		
		IF Lower(nombre_boton) = "eliminar" AND permiso_saca = "S" THEN
			tab_1.tabpage_5.eliminar.Enabled = TRUE
		END IF
		
		IF Lower(nombre_boton) = "salir" AND permiso_saca = "S" THEN
			tab_1.tabpage_5.salir.Enabled = TRUE
		END IF							

		IF Lower(nombre_boton) = "imprimir" AND permiso_saca = "S" THEN
			tab_1.tabpage_5.imprimir.Enabled = TRUE
		END IF					

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
	CLOSE(w_consulta_inventario)
	RETURN
END IF


tab_1.tabpage_1.dw_1.SetTransObject(SQLCA)
tab_1.tabpage_1.dw_1.Retrieve()
end event

type tab_1 from tab within w_consulta_inventario
integer x = 50
integer y = 308
integer width = 3282
integer height = 1452
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
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3246
integer height = 1324
long backcolor = 16777215
string text = "Tipo de Inventario"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "ArrangeIcons!"
long picturemaskcolor = 536870912
string powertiptext = "Tipos de Inventarios"
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer x = 50
integer y = 156
integer width = 2866
integer height = 664
integer taborder = 10
string title = "none"
string dataobject = "dw_consulta_tipo_inventario_01"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF tab_1.tabpage_1.dw_1.RowCount() = 0 THEN RETURN

codigo_tipo_inventario			= tab_1.tabpage_1.dw_1.GetItemString(row,"codigo_tipo_inventario")
descripcion_tipo_inventario	= tab_1.tabpage_1.dw_1.GetItemString(row,"descripcion_tipo_inventario")

tab_1.tabpage_2.dw_2.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_2.Retrieve(codigo_tipo_inventario)

tab_1.tabpage_2.st_2.Text="Tipo Inventario -> "+trim(descripcion_tipo_inventario)+" ("+Trim(codigo_tipo_inventario)+")..."

tab_1.SelectedTab = 2
tab_1.tabpage_2.dw_2.SetFocus()
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3246
integer height = 1324
long backcolor = 16777215
string text = "Clase Activo"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "CheckIn!"
long picturemaskcolor = 536870912
string powertiptext = "Clases de Activos"
st_2 st_2
dw_2 dw_2
end type

on tabpage_2.create
this.st_2=create st_2
this.dw_2=create dw_2
this.Control[]={this.st_2,&
this.dw_2}
end on

on tabpage_2.destroy
destroy(this.st_2)
destroy(this.dw_2)
end on

type st_2 from statictext within tabpage_2
integer x = 50
integer y = 40
integer width = 1797
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Tipo de Inventario..."
boolean focusrectangle = false
end type

type dw_2 from datawindow within tabpage_2
integer x = 41
integer y = 172
integer width = 2747
integer height = 876
integer taborder = 20
string title = "none"
string dataobject = "dw_clase_activos_01"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF tab_1.tabpage_2.dw_2.RowCount() = 0 THEN RETURN

codigo_clase_de_activo			= tab_1.tabpage_2.dw_2.GetItemString(row,"codigo_clase_de_activo")
descripcion_clase_activo		= tab_1.tabpage_2.dw_2.GetItemString(row,"descripcion_clase_activo")

tab_1.tabpage_3.dw_3.SetTransObject(SQLCA)
tab_1.tabpage_3.dw_3.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo)

tab_1.tabpage_3.st_3.Text="Tipo Inventario -> "+trim(descripcion_tipo_inventario)+" ("+Trim(codigo_tipo_inventario)+")..."
tab_1.tabpage_3.st_4.Text="Clase Activo -> "+trim(descripcion_clase_activo)+" ("+Trim(codigo_clase_de_activo)+")..."

tab_1.SelectedTab = 3
tab_1.tabpage_3.dw_3.SetFocus()
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3246
integer height = 1324
long backcolor = 16777215
string text = "Fabricante"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "Cursor!"
long picturemaskcolor = 536870912
string powertiptext = "Fabricantes o Marcas"
st_4 st_4
st_3 st_3
dw_3 dw_3
end type

on tabpage_3.create
this.st_4=create st_4
this.st_3=create st_3
this.dw_3=create dw_3
this.Control[]={this.st_4,&
this.st_3,&
this.dw_3}
end on

on tabpage_3.destroy
destroy(this.st_4)
destroy(this.st_3)
destroy(this.dw_3)
end on

type st_4 from statictext within tabpage_3
integer x = 55
integer y = 104
integer width = 2194
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Clase de Activo..."
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_3
integer x = 55
integer y = 24
integer width = 2194
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Tipo de Inventario..."
boolean focusrectangle = false
end type

type dw_3 from datawindow within tabpage_3
integer x = 55
integer y = 204
integer width = 2720
integer height = 896
integer taborder = 20
string title = "none"
string dataobject = "dw_consulta_fabricantes_01"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF tab_1.tabpage_3.dw_3.RowCount() = 0 THEN RETURN

codigo_marca			= tab_1.tabpage_3.dw_3.GetItemString(row,"codigo_marca")
descripcion_marca		= tab_1.tabpage_3.dw_3.GetItemString(row,"descripcion_marca")

tab_1.tabpage_4.dw_4.SetTransObject(SQLCA)
tab_1.tabpage_4.dw_4.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca)

tab_1.tabpage_4.st_5.Text="Tipo Inventario -> "+trim(descripcion_tipo_inventario)+" ("+Trim(codigo_tipo_inventario)+")..."
tab_1.tabpage_4.st_6.Text="Clase Activo -> "+trim(descripcion_clase_activo)+" ("+Trim(codigo_clase_de_activo)+")..."
tab_1.tabpage_4.st_7.Text="Fabricante -> "+trim(descripcion_marca)+" ("+Trim(codigo_marca)+")..."

tab_1.SelectedTab = 4
tab_1.tabpage_4.dw_4.SetFocus()
end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3246
integer height = 1324
long backcolor = 16777215
string text = "Módelo"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "Custom035!"
long picturemaskcolor = 536870912
string powertiptext = "Módelos de Activos"
st_7 st_7
st_6 st_6
st_5 st_5
dw_4 dw_4
end type

on tabpage_4.create
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.dw_4=create dw_4
this.Control[]={this.st_7,&
this.st_6,&
this.st_5,&
this.dw_4}
end on

on tabpage_4.destroy
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.dw_4)
end on

type st_7 from statictext within tabpage_4
integer x = 1861
integer y = 28
integer width = 722
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Fabricante..."
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_4
integer x = 55
integer y = 124
integer width = 1751
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Clase de Activo..."
boolean focusrectangle = false
end type

type st_5 from statictext within tabpage_4
integer x = 55
integer y = 32
integer width = 1751
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Tipo de Inventario..."
boolean focusrectangle = false
end type

type dw_4 from datawindow within tabpage_4
integer x = 59
integer y = 220
integer width = 2432
integer height = 744
integer taborder = 20
string title = "none"
string dataobject = "dw_consulta_modelos_01"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF tab_1.tabpage_4.dw_4.RowCount() = 0 THEN RETURN

codigo_modelo			= tab_1.tabpage_4.dw_4.GetItemString(row,"codigo_modelo")
descripcion_corta		= tab_1.tabpage_4.dw_4.GetItemString(row,"descripcion_corta")

tab_1.tabpage_5.dw_5.SetTransObject(SQLCA)
tab_1.tabpage_5.dw_5.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo)

tab_1.tabpage_5.st_8.Text="Tipo Inventario -> "+trim(descripcion_tipo_inventario)+" ("+Trim(codigo_tipo_inventario)+")..."
tab_1.tabpage_5.st_9.Text="Clase Activo -> "+trim(descripcion_clase_activo)+" ("+Trim(codigo_clase_de_activo)+")..."
tab_1.tabpage_5.st_10.Text="Fabricante -> "+trim(descripcion_marca)+" ("+Trim(codigo_marca)+")..."
tab_1.tabpage_5.st_11.Text="Modelo -> "+trim(descripcion_corta)+" ("+Trim(codigo_modelo)+")..."

cta_filas = tab_1.tabpage_5.dw_5.RowCount()	

tab_1.SelectedTab = 5
tab_1.tabpage_5.dw_5.SetFocus()
end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3246
integer height = 1324
long backcolor = 16777215
string text = "Inventario"
long tabtextcolor = 16711680
long tabbackcolor = 16777215
string picturename = "DataPipeline!"
long picturemaskcolor = 536870912
string powertiptext = "Inventario Físico"
salir salir
eliminar eliminar
imprimir imprimir
grabar grabar
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
dw_5 dw_5
end type

on tabpage_5.create
this.salir=create salir
this.eliminar=create eliminar
this.imprimir=create imprimir
this.grabar=create grabar
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.dw_5=create dw_5
this.Control[]={this.salir,&
this.eliminar,&
this.imprimir,&
this.grabar,&
this.st_11,&
this.st_10,&
this.st_9,&
this.st_8,&
this.dw_5}
end on

on tabpage_5.destroy
destroy(this.salir)
destroy(this.eliminar)
destroy(this.imprimir)
destroy(this.grabar)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.dw_5)
end on

type salir from picturebutton within tabpage_5
integer x = 3031
integer y = 1120
integer width = 183
integer height = 160
integer taborder = 30
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

event clicked;Close(w_consulta_inventario)
end event

type eliminar from picturebutton within tabpage_5
integer x = 2455
integer y = 1120
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
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\data_table.png"
alignment htextalign = left!
string powertiptext = "Eliminar una Fila"
end type

event clicked;IF IsNull(codigo_tipo_inventario) OR IsNull(codigo_clase_de_activo) OR IsNull(codigo_marca) OR IsNull(codigo_modelo) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Escoger Algún Dato de Entrada ¡",Stopsign!)
	RETURN
END IF

//**********************************************************************************//
//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
//**********************************************************************************//

//**************************************************//
//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
//**************************************************//
String serial
Double valor_compra
Date fecha_compra
Integer placa_inventario, vida_util_meses

placa_inventario		= tab_1.tabpage_5.dw_5.GetItemNumber(fila,"placa_inventario")
serial					= tab_1.tabpage_5.dw_5.GetItemString(fila,"serial")
fecha_compra			= tab_1.tabpage_5.dw_5.GetItemDate(fila,"fecha_compra")
valor_compra			= tab_1.tabpage_5.dw_5.GetItemNumber(fila,"valor_compra")
vida_util_meses		= tab_1.tabpage_5.dw_5.GetItemNumber(fila,"vida_util_meses")

string mensj
integer resp, codigo_busca
Long cuenta_filas
//************************************************************************//
//*** BUSCA EN LA TABLA DE activos_modelo_modelo_inventario PARA VER SI EXISTE ***//
//************************************************************************//
//SELECT COUNT(*) INTO :cuenta_filas FROM activos_modelo_modelo_inventario WHERE codigo_modelo = :codigo_modelo;
//
//IF cuenta_filas > 0 THEN
//	MessageBox("Mensaje - Validación...","! YA Existen Modelos Asociados a esta Marca ¡",StopSign!)
//	RETURN
//END IF	
//************************************************************************//
Integer  net
net = MessageBox("Mensaje - Validación...","¿ Está Seguro de Eliminar el Activo ?"+"~r~n~r~n"+&
			"...Placa... "+String(placa_inventario)+"~r~n"+&
			"...Serial "+Trim(serial)+"~r~n"+&
			"...Fecha de Compra "+String(fecha_compra,"dd/mm/yyyy")+"~r~n"+&
			"...Valor de Compra "+String(valor_compra,"$###,###,###,###"),Question!,YesNo!,2)

IF net = 2 THEN
	RETURN
ELSE
	IF tab_1.tabpage_5.dw_5.DeleteRow(fila) = -1 then
		Messagebox("Mensaje - Validación...","! Error al Eliminar la Fila ¡",Information!)
		tab_1.tabpage_5.dw_5.SetTransObject(SQLCA)
		tab_1.tabpage_5.dw_5.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo)
		cta_filas = tab_1.tabpage_5.dw_5.RowCount()
	ELSE
		tab_1.tabpage_5.dw_5.Update()		
		tab_1.tabpage_5.dw_5.SetTransObject(SQLCA)
		tab_1.tabpage_5.dw_5.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo)
		MessageBox("Mensaje - Validación...","! Se ha Eliminado un Registro de la Báse de Datos ¡",Information!)
		cta_filas = tab_1.tabpage_5.dw_5.RowCount()
	END IF	
END IF
end event

type imprimir from picturebutton within tabpage_5
integer x = 2651
integer y = 1120
integer width = 183
integer height = 160
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir Inventario"
end type

event clicked;OPEN(w_escoge_reporte_inventario_fisico)
end event

type grabar from picturebutton within tabpage_5
integer x = 2839
integer y = 1120
integer width = 183
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\database_save.png"
alignment htextalign = left!
string powertiptext = "Actualizar Inventario Físico"
end type

event clicked;IF IsNull(codigo_tipo_inventario) OR IsNull(codigo_clase_de_activo) OR IsNull(codigo_marca) OR IsNull(codigo_modelo) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta Escoger Algún Dato de Entrada ¡",Stopsign!)
	RETURN
END IF

//**********************************************************************************//
//*** EL COMMAND BUTTON ESTA POR FUERA DEL DATAWINDOOWS PERO EN LA MISMA VENTANA ***//
//**********************************************************************************//

//**************************************************//
//*** ASIGANCION EN LAS COLUMNAS DEL DATAWINDOWS ***//
//**************************************************//
String serial, estado_activo
Double valor_compra
Date fecha_compra, fecha_de_baja
Integer placa_inventario, vida_util_meses
//*****************************************************************//
//*** SE NECESITA PARA CAMBIAR UN STRING LA FUNCION AcceptTex() ***//
//*****************************************************************//
IF tab_1.tabpage_5.dw_5.AcceptText() = 1 THEN

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

placa_inventario		= tab_1.tabpage_5.dw_5.GetItemNumber(fila,"placa_inventario")
serial					= tab_1.tabpage_5.dw_5.GetItemString(fila,"serial")
fecha_compra			= tab_1.tabpage_5.dw_5.GetItemDate(fila,"fecha_compra")
valor_compra			= tab_1.tabpage_5.dw_5.GetItemNumber(fila,"valor_compra")
vida_util_meses		= tab_1.tabpage_5.dw_5.GetItemNumber(fila,"vida_util_meses")
estado_activo			= tab_1.tabpage_5.dw_5.GetItemString(fila,"estado_activo")
fecha_de_baja			= tab_1.tabpage_5.dw_5.GetItemDate(fila,"fecha_de_baja")
	
IF IsNull(placa_inventario) THEN
	MessageBox("Mensaje - Validación...","! Hace Falta la Placa de Inventario ¡",StopSign!)
	RETURN
END IF
	
//*********************************************************//
//*** ASIGANCION DE LAS DATOS A LA FILA DEL DATAWINDOWS ***//
//*********************************************************//
tab_1.tabpage_5.dw_5.SetItem(fila,1,placa_inventario)
tab_1.tabpage_5.dw_5.SetItem(fila,2,serial)
tab_1.tabpage_5.dw_5.SetItem(fila,3,fecha_compra)	
tab_1.tabpage_5.dw_5.SetItem(fila,4,valor_compra)
tab_1.tabpage_5.dw_5.SetItem(fila,5,vida_util_meses)
tab_1.tabpage_5.dw_5.SetItem(fila,12,estado_activo)
tab_1.tabpage_5.dw_5.SetItem(fila,13,fecha_de_baja)
//*********************************************************//

Long total_filas, posicion_fila
total_filas = tab_1.tabpage_5.dw_5.RowCount()
posicion_fila = 1
DO WHILE posicion_fila <= total_filas
	placa_inventario		= tab_1.tabpage_5.dw_5.GetItemNumber(posicion_fila,"placa_inventario")
	serial					= tab_1.tabpage_5.dw_5.GetItemString(posicion_fila,"serial")
	fecha_compra			= tab_1.tabpage_5.dw_5.GetItemDate(posicion_fila,"fecha_compra")
	valor_compra			= tab_1.tabpage_5.dw_5.GetItemNumber(posicion_fila,"valor_compra")
	vida_util_meses		= tab_1.tabpage_5.dw_5.GetItemNumber(posicion_fila,"vida_util_meses")
	estado_activo			= tab_1.tabpage_5.dw_5.GetItemString(posicion_fila,"estado_activo")
	fecha_de_baja			= tab_1.tabpage_5.dw_5.GetItemDate(posicion_fila,"fecha_de_baja")	
	

	IF IsNull(placa_inventario) THEN 
		MessageBox("Mensaje - Validación...","! Hace Falta la Placa de Inventario en la Fila "+String(posicion_fila,"000,000")+" ¡",StopSign!)
		RETURN
	END IF

	IF IsNull(serial) THEN 
		MessageBox("Mensaje - Validación...","! Hace Falta el Serial en la Fila "+String(posicion_fila,"000,000")+" ¡",StopSign!)
		RETURN
	END IF
	
	IF IsNull(fecha_compra) THEN 
		MessageBox("Mensaje - Validación...","! Hace Falta la Fecha de Compra en la Fila "+String(posicion_fila,"000,000")+" ¡",StopSign!)
		RETURN
	END IF
	
	IF IsNull(vida_util_meses) THEN 
		vida_util_meses = 0
	END IF		
	
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,1,placa_inventario)
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,2,serial)
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,3,fecha_compra)	
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,4,valor_compra)
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,5,vida_util_meses)
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,12,estado_activo)
	tab_1.tabpage_5.dw_5.SetItem(posicion_fila,13,fecha_de_baja)	
	
	IF tab_1.tabpage_5.dw_5.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron los Cambios en la Fila "+String(posicion_fila,"000,000")+" ¡",StopSign!)
		RETURN
	END IF	
	
	posicion_fila = posicion_fila + 1
LOOP

//*****************************************************************//
//*** ACTUALIZACION DE LA BASE DE DATOS CON LA FUNCION Update() ***//
//*****************************************************************//
Integer acepto
Integer rtn 

rtn = tab_1.tabpage_5.dw_5.Update(True, True)
IF rtn = 1 THEN
	COMMIT USING SQLCA;
	MessageBox("Mensaje - Validación...","! La Báse de Datos ha sido Actualizada ¡",Information!)
	tab_1.tabpage_5.dw_5.SetTransObject(SQLCA)
	tab_1.tabpage_5.dw_5.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo)
	cta_filas = tab_1.tabpage_5.dw_5.RowCount()	
ELSE
	ROLLBACK USING SQLCA;
	MessageBox("Mensaje - Validación...","! No se Pudo Actualizar la Báse de Datos ¡",Information!)
	tab_1.tabpage_5.dw_5.SetTransObject(SQLCA)
	tab_1.tabpage_5.dw_5.Retrieve(codigo_tipo_inventario,codigo_clase_de_activo,codigo_marca,codigo_modelo)
	cta_filas = tab_1.tabpage_5.dw_5.RowCount()
END IF
//*****************************************************************//
end event

type st_11 from statictext within tabpage_5
integer x = 1810
integer y = 136
integer width = 1353
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Modelo..."
boolean focusrectangle = false
end type

type st_10 from statictext within tabpage_5
integer x = 1810
integer y = 40
integer width = 1353
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Fabicante..."
boolean focusrectangle = false
end type

type st_9 from statictext within tabpage_5
integer x = 50
integer y = 136
integer width = 1723
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Clase de Activo..."
boolean focusrectangle = false
end type

type st_8 from statictext within tabpage_5
integer x = 50
integer y = 40
integer width = 1723
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
boolean italic = true
long textcolor = 8388608
long backcolor = 16777215
string text = "Tipo de Inventario..."
boolean focusrectangle = false
end type

type dw_5 from datawindow within tabpage_5
integer x = 14
integer y = 232
integer width = 3218
integer height = 864
integer taborder = 20
string title = "none"
string dataobject = "dw_consulta_inventario_01"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;fila = tab_1.tabpage_5.dw_5.GetClickedRow( )
end event

event itemchanged;Double identificacion_responsable
String clase_documento_responsable, descripcion_tercero_responsable

IF dwo.Name = "identificacion_responsable" THEN
	IF tab_1.tabpage_5.dw_5.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron todos los Cambios (Identificación) ¡",Information!)
		RETURN
	END IF			

	identificacion_responsable			= dw_responsable.GetItemNumber(dw_responsable.GetRow(),"identificacion")
	clase_documento_responsable		= dw_responsable.GetItemString(dw_responsable.GetRow(),"clase_documento")
	descripcion_tercero_responsable	= dw_responsable.GetItemString(dw_responsable.GetRow(),"descripcion_tercero")	

	tab_1.tabpage_5.dw_5.SetItem(row,6,clase_documento_responsable)
	tab_1.tabpage_5.dw_5.SetItem(row,7,identificacion_responsable)
	
	IF tab_1.tabpage_5.dw_5.AcceptText() = 1 THEN

	ELSE	
		MessageBox("Mensaje - Validación...","! No se Aceptaron todos los Cambios (Identificación) ¡",Information!)
		RETURN
	END IF

	MessageBox("Mensaje - Validación...","! Se Asignara el Activo a -> "+Trim(descripcion_tercero_responsable)+" ("+&
			Trim(clase_documento_responsable)+" - "+String(identificacion_responsable,"###,###,###,###")+") ¡",Information!)
END IF
end event

event constructor;tab_1.tabpage_5.dw_5.GetChild("identificacion_responsable",dw_responsable)
dw_responsable.SetTransObject(SQLCA)
dw_responsable.Retrieve()
end event

type st_1 from statictext within w_consulta_inventario
integer x = 59
integer y = 52
integer width = 3227
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
string text = "Consulta de Inventario"
alignment alignment = center!
boolean focusrectangle = false
end type

type rr_3 from roundrectangle within w_consulta_inventario
long linecolor = 8388608
integer linethickness = 5
long fillcolor = 12639424
integer x = 23
integer y = 28
integer width = 3291
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

