$PBExportHeader$w_entrada.srw
forward
global type w_entrada from window
end type
type p_3 from picture within w_entrada
end type
type cbx_ispb from checkbox within w_entrada
end type
type sle_filename from singlelineedit within w_entrada
end type
type mle_2 from multilineedit within w_entrada
end type
type cbx_1 from checkbox within w_entrada
end type
type st_2 from statictext within w_entrada
end type
type ddplb_1 from dropdownpicturelistbox within w_entrada
end type
type mle_1 from multilineedit within w_entrada
end type
type p_2 from picture within w_entrada
end type
type st_7 from statictext within w_entrada
end type
type st_5 from statictext within w_entrada
end type
type sle_1 from singlelineedit within w_entrada
end type
type sle_2 from singlelineedit within w_entrada
end type
type st_3 from statictext within w_entrada
end type
type st_4 from statictext within w_entrada
end type
type cb_1 from commandbutton within w_entrada
end type
type cb_2 from commandbutton within w_entrada
end type
type p_1 from picture within w_entrada
end type
type gb_1 from groupbox within w_entrada
end type
type rr_1 from roundrectangle within w_entrada
end type
type rr_2 from roundrectangle within w_entrada
end type
end forward

global type w_entrada from window
integer x = 5
integer y = 4
integer width = 4146
integer height = 1432
boolean titlebar = true
string title = "Entrada de la Aplicación Control de Activos y Cargos Diferidos..."
boolean controlmenu = true
boolean minbox = true
long backcolor = 16777215
string icon = "C:\Muñecos\ICONS\computer_48.ico"
boolean center = true
p_3 p_3
cbx_ispb cbx_ispb
sle_filename sle_filename
mle_2 mle_2
cbx_1 cbx_1
st_2 st_2
ddplb_1 ddplb_1
mle_1 mle_1
p_2 p_2
st_7 st_7
st_5 st_5
sle_1 sle_1
sle_2 sle_2
st_3 st_3
st_4 st_4
cb_1 cb_1
cb_2 cb_2
p_1 p_1
gb_1 gb_1
rr_1 rr_1
rr_2 rr_2
end type
global w_entrada w_entrada

type variables
private n_versioninfo inv_versionInfo
end variables

on w_entrada.create
this.p_3=create p_3
this.cbx_ispb=create cbx_ispb
this.sle_filename=create sle_filename
this.mle_2=create mle_2
this.cbx_1=create cbx_1
this.st_2=create st_2
this.ddplb_1=create ddplb_1
this.mle_1=create mle_1
this.p_2=create p_2
this.st_7=create st_7
this.st_5=create st_5
this.sle_1=create sle_1
this.sle_2=create sle_2
this.st_3=create st_3
this.st_4=create st_4
this.cb_1=create cb_1
this.cb_2=create cb_2
this.p_1=create p_1
this.gb_1=create gb_1
this.rr_1=create rr_1
this.rr_2=create rr_2
this.Control[]={this.p_3,&
this.cbx_ispb,&
this.sle_filename,&
this.mle_2,&
this.cbx_1,&
this.st_2,&
this.ddplb_1,&
this.mle_1,&
this.p_2,&
this.st_7,&
this.st_5,&
this.sle_1,&
this.sle_2,&
this.st_3,&
this.st_4,&
this.cb_1,&
this.cb_2,&
this.p_1,&
this.gb_1,&
this.rr_1,&
this.rr_2}
end on

on w_entrada.destroy
destroy(this.p_3)
destroy(this.cbx_ispb)
destroy(this.sle_filename)
destroy(this.mle_2)
destroy(this.cbx_1)
destroy(this.st_2)
destroy(this.ddplb_1)
destroy(this.mle_1)
destroy(this.p_2)
destroy(this.st_7)
destroy(this.st_5)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.p_1)
destroy(this.gb_1)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;gb_name_user = ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "UserName", "None")
gb_name_computer = ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "ComputerName", "None")
gb_sistema_operativo = ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "SistemaOperativo", "None")
gb_direccion_ip = ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "DireccionIP", "None")
gb_directorio_salida = ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "ArchivosActivos", "None")
gb_nombre_archivo_ayuda = ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "HelpSiste", "None")
gb_path_aplicaciones=ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "PathAplicaciones", "None")
gb_direccion_empresa=ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "DireccionCIA", "None")
gb_ciudad_empresa=ProfileString("C:\AFILLIADOS\PARAMETROS_MAQUINA.INI", "Network", "CiudadCIA", "None")

IF gb_name_user = "None" THEN
	gb_name_user = ""
END IF	

IF gb_name_computer = "None" THEN
	gb_name_computer = ""
END IF

IF gb_sistema_operativo = "None" THEN
	gb_sistema_operativo = ""
END IF

IF gb_direccion_ip = "None" THEN
	gb_direccion_ip = ""
END IF

IF gb_path_aplicaciones = "None" THEN
	gb_path_aplicaciones = ""
END IF

Integer posicion_ddplb

posicion_ddplb = ddplb_1.FindItem("BD Producción",0)

//*** Funciones para Definir en DropDownList... ***//
//*** Eexisten dos (2) formas de Encontrar un cadena ***//
//*** 1. Sabiendo el Texto a Buscar ***//
//*** ddplb_1.SelectItem("BD Producción",0) ***//
//*** 2. Sabiendo el Número en donde se encuentar ***//
//*** ddplb_1.SelectItem(posicion_ddplb) ***//

ddplb_1.SelectItem(posicion_ddplb)

ddplb_1.Enabled = FALSE

inv_versionInfo = CREATE n_versionInfo

string ls_Path
string ls_File
cbx_ispb.Visible = FALSE
sle_filename.Visible = FALSE

gb_path_aplicaciones = gb_path_aplicaciones+"\Aplicacion Control Activos\control_activos.exe"
sle_filename.text = gb_path_aplicaciones

string ls_EXEName
string ls_PropertyValue

// if the EXE SLE is blank, assume it's the currently running process
// and set the EXE name to NULL to indicate that
ls_EXEName = Trim(sle_filename.text)
if Len(ls_EXEName) = 0 then
	setNull(ls_EXEName)
end if

// set the indicator value as to whether this is or is not a PB-generated application
inv_versionInfo.setIsPBApp(cbx_isPB.checked)

ls_PropertyValue = inv_versionInfo.getCopyright(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
mle_2.text = "Copyright "+ls_PropertyValue

gb_codigo_ambiente_desarrollo 	= "APB"
gb_codigo_aplicacion_caxdac		= "CAF"
end event

type p_3 from picture within w_entrada
integer x = 23
integer y = 756
integer width = 1125
integer height = 600
string picturename = "C:\Muñecos\BITMAPS\image_PC.jpg"
boolean focusrectangle = false
end type

type cbx_ispb from checkbox within w_entrada
integer x = 1623
integer y = 864
integer width = 622
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = "PB-generated EXE"
boolean checked = true
end type

type sle_filename from singlelineedit within w_entrada
integer x = 1609
integer y = 776
integer width = 626
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type mle_2 from multilineedit within w_entrada
integer x = 1307
integer y = 1200
integer width = 832
integer height = 64
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Copyright"
boolean border = false
alignment alignment = center!
boolean displayonly = true
end type

type cbx_1 from checkbox within w_entrada
integer x = 3287
integer y = 992
integer width = 754
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 32768
long backcolor = 16777215
string text = "Cambiar Base de Datos"
boolean lefttext = true
end type

event clicked;IF cbx_1.Checked = TRUE THEN
	ddplb_1.Enabled = TRUE
ELSE
	ddplb_1.Enabled = FALSE
END IF	
end event

type st_2 from statictext within w_entrada
integer x = 2949
integer y = 892
integer width = 443
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
string text = "Base de Datos..."
boolean focusrectangle = false
end type

type ddplb_1 from dropdownpicturelistbox within w_entrada
integer x = 3424
integer y = 880
integer width = 622
integer height = 332
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 16711680
boolean sorted = false
boolean vscrollbar = true
string item[] = {"BD Producción","BD Pruebas","BD Contingencia"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3}
string picturename[] = {"CreateLibrary5!","Query5!","ExecuteSQL5!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;//IF ddplb_1.Text = "BD Producción" THEN
//	gb_base_de_datos = "general"
//ELSE
//	gb_base_de_datos = "gene"
//END IF	
//
end event

type mle_1 from multilineedit within w_entrada
integer x = 1307
integer y = 1112
integer width = 832
integer height = 96
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Departamento de Sistemas CAXDAC  PB 2022 R2 Build 2828"
boolean border = false
alignment alignment = center!
boolean displayonly = true
end type

type p_2 from picture within w_entrada
integer x = 2551
integer y = 692
integer width = 366
integer height = 336
string picturename = "C:\Muñecos\BITMAPS\Candado_01.png"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_7 from statictext within w_entrada
integer x = 2949
integer y = 672
integer width = 443
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
string text = "Usuario..."
boolean focusrectangle = false
end type

type st_5 from statictext within w_entrada
integer x = 23
integer y = 556
integer width = 2139
integer height = 208
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 16777215
boolean enabled = false
string text = "Aplicación Control de Activos y Cargos Diferidos"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_entrada
integer x = 3424
integer y = 664
integer width = 622
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 16711680
borderstyle borderstyle = stylelowered!
end type

event losefocus;
IF this.Text = 'ddiaz' THEN 
	cbx_1.Checked = TRUE
	cbx_1.TriggerEvent("Clicked")
	ddplb_1.Text = "BD Pruebas" 
ELSE
	cbx_1.Checked = FALSE
	cbx_1.TriggerEvent("Clicked")
	ddplb_1.Text = "BD Producción" 
END IF
end event

type sle_2 from singlelineedit within w_entrada
integer x = 3424
integer y = 772
integer width = 622
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 16711680
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_entrada
boolean visible = false
integer x = 1211
integer y = 1260
integer width = 434
integer height = 104
string dragicon = "Application!"
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
string text = "Usuario:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_entrada
integer x = 2949
integer y = 780
integer width = 443
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
string text = "Password..."
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_entrada
integer x = 2633
integer y = 1136
integer width = 558
integer height = 108
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Aceptar"
boolean default = true
end type

event clicked;IF gb_name_computer = "" THEN
	MessageBox("Mensaje...","! Comuniquese con su Administrador para el Archivo parametros_maquina.ini !",StopSign!)
	RETURN
END IF

IF ddplb_1.Text = "" THEN
	MessageBox("Mensaje de CONEXION...","! Por Favor debe Escoger la Base de Datos a Trabaja ¡",Information!)
	RETURN
END IF	

gb_copyrigth = mle_2.Text

IF ddplb_1.Text = "BD Producción" THEN
	//*************************************//
	//*** Base de Datos de Contingencia ***//
	//*************************************//	
	SQLCA.DBMS = profilestring("c:\afilliados\conexion.ini","Parametros","Manejador","ASE Adaptive Server Enterprise")
	SQLCA.Database = profilestring("c:\afilliados\conexion.ini","Parametros","Base_Datos","general")
	SQLCA.ServerName = profilestring("c:\afilliados\conexion.ini","Parametros","Servidor","CAXDAC-SUN")
	SQLCA.DBParm = "Release='15',Host='"+gb_name_computer+"', AppName = 'Sistemas"+"', PWDialog=1"
	//*************************************//		
ELSE
	IF ddplb_1.Text = "BD Pruebas" THEN
		//*****************************************//
		//*** Base de Datos de Prueba de CAXDAC ***//
		//*****************************************//
		SQLCA.DBMS = profilestring("c:\afilliados\conexion.ini","Prueba","Manejador","ASE Adaptive Server Enterprise")
		SQLCA.Database = profilestring("c:\afilliados\conexion.ini","Prueba","Base_Datos","gene")
		SQLCA.ServerName = profilestring("c:\afilliados\conexion.ini","Prueba","Servidor","CAXDAC_SUN")
		SQLCA.DBParm = "Release='15',Host='"+gb_name_computer+"', AppName = 'Sistemas"+"', PWDialog=1"
		//*****************************************//
	ELSE
		//**************************************************//
		//*** Base de Datos de Contingencia - COLSERVICE ***//
		//**************************************************//
		SQLCA.DBMS = profilestring("c:\afilliados\conexion.ini","Contingencia","Manejador","ASE Adaptive Server Enterprise")
		SQLCA.Database = profilestring("c:\afilliados\conexion.ini","Contingencia","Base_Datos","general")
		SQLCA.ServerName = profilestring("c:\afilliados\conexion.ini","Contingencia","Servidor","CONTINGENCIA")
		SQLCA.DBParm = "Release='15',Host='"+gb_name_computer+"', AppName = 'Sistemas"+"', PWDialog=1"
		//**************************************************//
	END IF	
END IF

IF ddplb_1.Text = "BD Producción" OR ddplb_1.Text = "BD Contingencia" THEN
	gb_base_de_datos = "general"
ELSE
	gb_base_de_datos = "gene"
END IF	

gb_base_de_datos_ambiente = ddplb_1.Text

SetPointer(HourGlass!)

IF gb_base_de_datos = "" OR IsNull(gb_base_de_datos) THEN
	MessageBox("Mensaje...","! Debe Escoger la Base de Datos para Trabajar ¡",Information!)
	RETURN
END IF	

string usuario

gb_usuario = sle_1.text

IF ddplb_1.Text = "BD Producción" THEN
	MessageBox("Mensaje de CONEXION...","! "+gb_usuario+" Usted va a Trabajar en la Base de Datos de PRODUCCION ¡",Information!)
ELSE
	IF ddplb_1.Text = "BD Pruebas" THEN
		MessageBox("Mensaje de CONEXION...","! "+gb_usuario+" Usted va a Trabajar en la Base de Datos de PRUEBAS ¡",Information!)	
	ELSE
		MessageBox("Mensaje de CONEXION - CUIDADO...","! "+gb_usuario+" Usted va a Trabajar en la Base de Datos de Contingencia ¡",Information!)			
	END IF	
END IF

SQLCA.LogID =  sle_1.text

SQLCA.LogPass = sle_2.text

SQLCA.AutoCommit = TRUE

connect using SQLCA;

IF SQLCA.SQLCode <> 0 THEN
	Messagebox("Mensaje - Error de Conexión...","! Número del Error -> "+String(SQLCA.SQLCode)+&
		" Descripción... "+Trim(SQLCA.SQLErrText)+" ¡",Information!)
ELSE
	String usuario_busca
	SELECT login_name, descripcion_login, tipo_usuario INTO :usuario_busca, :gb_descripcion_usuario, :gb_tipo_usuario &
		FROM usuarios_activos_fijos WHERE login_name = :gb_usuario;
			
	SELECT fullname INTO :gb_full_usuario FROM master..syslogins WHERE master..syslogins.name = :gb_usuario;			
			
	IF usuario_busca = "" OR IsNull(usuario_busca) THEN
		MessageBox("Mensaje... Usuario... "+gb_usuario,"! Este Usuario NO está Autorizado para la Aplicación ¡",Information!)
		close(w_entrada)
		RETURN
	END IF

	//*************************************************//
	//*** Validación de la Versión de la Aplicación ***//
	//*************************************************//	
	SELECT COUNT(*) INTO :gb_cuenta_filas FROM sistemas_aplicaciones_caxdac WHERE &
		codigo_ambiente_desarrollo = :gb_codigo_ambiente_desarrollo AND codigo_aplicacion_caxdac = :gb_codigo_aplicacion_caxdac;
		
	IF gb_cuenta_filas = 0 THEN
		MessageBox("Mensaje - Seguridad...","! No EXISTE Versión en la Base de Datos para esta Aplicación, Hablese con el Administrador del Sistema para Solucionar este Proble ¡",StopSign!)
		RETURN
	END IF	
	
	SELECT descripcion_apliacion_caxdac, version_aplicacion INTO :gb_descripcion_apliacion_caxdac, :gb_version_aplicacion &
		FROM sistemas_aplicaciones_caxdac WHERE &
		codigo_ambiente_desarrollo = :gb_codigo_ambiente_desarrollo AND codigo_aplicacion_caxdac = :gb_codigo_aplicacion_caxdac;

	IF gb_copyrigth <> gb_version_aplicacion OR IsNull(gb_version_aplicacion) THEN
		MessageBox("Mensaje - Seguridad...","! La Versión de esta Aplicación es DIFERENTE a la última Versión Liberada por SISTEMAS ¡"+&
			"~r~n~r~n*** Comuniquese con el Dpto. de Sistemas para que le Actualice la Versión de su Aplicación ***",Exclamation!)
	END IF
	//*************************************************//	
		
	open(w_segunda)
END IF

end event

type cb_2 from commandbutton within w_entrada
integer x = 3419
integer y = 1136
integer width = 558
integer height = 108
integer taborder = 60
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;close(w_entrada)
end event

type p_1 from picture within w_entrada
integer x = 9
integer y = 12
integer width = 4114
integer height = 524
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\CAXDAC Imagen.JPG"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_entrada
integer x = 2496
integer y = 584
integer width = 1582
integer height = 496
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Datos de Entrada"
borderstyle borderstyle = styleraised!
end type

type rr_1 from roundrectangle within w_entrada
long linecolor = 128
integer linethickness = 4
long fillcolor = 16777215
integer x = 1280
integer y = 1104
integer width = 882
integer height = 168
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_entrada
long linecolor = 65280
integer linethickness = 4
long fillcolor = 128
integer x = 2496
integer y = 1112
integer width = 1614
integer height = 152
integer cornerheight = 40
integer cornerwidth = 46
end type

