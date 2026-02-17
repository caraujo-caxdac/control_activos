$PBExportHeader$w_cambio_usuario.srw
$PBExportComments$Ventana para realizar el cambio de Usuario de la Aplicación
forward
global type w_cambio_usuario from window
end type
type st_6 from statictext within w_cambio_usuario
end type
type ddplb_1 from dropdownpicturelistbox within w_cambio_usuario
end type
type st_5 from statictext within w_cambio_usuario
end type
type pb_1 from picturebutton within w_cambio_usuario
end type
type sle_3 from singlelineedit within w_cambio_usuario
end type
type sle_2 from singlelineedit within w_cambio_usuario
end type
type st_4 from statictext within w_cambio_usuario
end type
type st_3 from statictext within w_cambio_usuario
end type
type sle_1 from singlelineedit within w_cambio_usuario
end type
type st_2 from statictext within w_cambio_usuario
end type
type mle_1 from multilineedit within w_cambio_usuario
end type
type st_1 from statictext within w_cambio_usuario
end type
type rr_1 from roundrectangle within w_cambio_usuario
end type
type rr_2 from roundrectangle within w_cambio_usuario
end type
end forward

global type w_cambio_usuario from window
integer x = 530
integer y = 436
integer width = 2217
integer height = 1132
boolean titlebar = true
string title = "Cambio de Usuario..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
string icon = "C:\Muñecos\ICONS\Cardfil3.ico"
boolean center = true
st_6 st_6
ddplb_1 ddplb_1
st_5 st_5
pb_1 pb_1
sle_3 sle_3
sle_2 sle_2
st_4 st_4
st_3 st_3
sle_1 sle_1
st_2 st_2
mle_1 mle_1
st_1 st_1
rr_1 rr_1
rr_2 rr_2
end type
global w_cambio_usuario w_cambio_usuario

on w_cambio_usuario.create
this.st_6=create st_6
this.ddplb_1=create ddplb_1
this.st_5=create st_5
this.pb_1=create pb_1
this.sle_3=create sle_3
this.sle_2=create sle_2
this.st_4=create st_4
this.st_3=create st_3
this.sle_1=create sle_1
this.st_2=create st_2
this.mle_1=create mle_1
this.st_1=create st_1
this.rr_1=create rr_1
this.rr_2=create rr_2
this.Control[]={this.st_6,&
this.ddplb_1,&
this.st_5,&
this.pb_1,&
this.sle_3,&
this.sle_2,&
this.st_4,&
this.st_3,&
this.sle_1,&
this.st_2,&
this.mle_1,&
this.st_1,&
this.rr_1,&
this.rr_2}
end on

on w_cambio_usuario.destroy
destroy(this.st_6)
destroy(this.ddplb_1)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;//m_principal.m_tablasbásicas.m_cambiodeusuario.Checked = TRUE
sle_1.text = gb_usuario

Integer posicion_ddplb

posicion_ddplb = ddplb_1.FindItem("BD Producción",0)

//*** Funciones para Definir en DropDownList... ***//
//*** Eexisten dos (2) formas de Encontrar un cadena ***//
//*** 1. Sabiendo el Texto a Buscar ***//
//*** ddplb_1.SelectItem("BD Producción",0) ***//
//*** 2. Sabiendo el Número en donde se encuentar ***//
//*** ddplb_1.SelectItem(posicion_ddplb) ***//

ddplb_1.SelectItem(posicion_ddplb)

//ddplb_1.Enabled = FALSE
end event

event close;//m_principal.m_tablasbásicas.m_cambiodeusuario.Checked = FALSE
IF IsNull(gb_usuario) THEN
	CLOSE(w_segunda)
END IF	

end event

type st_6 from statictext within w_cambio_usuario
integer x = 114
integer y = 604
integer width = 512
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
long backcolor = 67108864
boolean enabled = false
string text = "Base de Datos..."
boolean focusrectangle = false
end type

type ddplb_1 from dropdownpicturelistbox within w_cambio_usuario
integer x = 677
integer y = 596
integer width = 672
integer height = 228
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
string pointer = "HyperLink!"
long textcolor = 16711680
boolean vscrollbar = true
string item[] = {"BD Producción","BD Prueba"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2}
string picturename[] = {"DatabaseProfile!","DataPipeline!"}
long picturemaskcolor = 536870912
end type

type st_5 from statictext within w_cambio_usuario
integer x = 1536
integer y = 572
integer width = 279
integer height = 76
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
long backcolor = 65280
boolean enabled = false
string text = "Cambiar"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_cambio_usuario
integer x = 1490
integer y = 256
integer width = 366
integer height = 300
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
string pointer = "HyperLink!"
boolean default = true
boolean originalsize = true
string picturename = "c:\muñecos\bitmaps\globe03.bmp"
alignment htextalign = left!
end type

event clicked;IF sle_2.Text = "" THEN 
	IF IsNull(gb_usuario) THEN
		MessageBox("MENSAJE DE CONEXION...","! La Aplicación se CERRARA ¡",Exclamation!)
		CLOSE(w_segunda)
	ELSE
		CLOSE(w_cambio_usuario)
	END IF	
	RETURN
END IF

Integer rta
rta = MessageBox("Mensaje...","¿ "+gb_usuario+" está Seguro de Cambiar de Login ?",Question!,YesNoCancel!,3)
IF rta = 3 THEN
	IF IsNull(gb_usuario) THEN
		MessageBox("MENSAJE DE CONEXION...","! La Aplicación se CERRARA ¡",Exclamation!)
		CLOSE(w_segunda)
	ELSE
		CLOSE(w_cambio_usuario)
	END IF	
	RETURN
END IF

IF rta = 2 THEN 
	RETURN
END IF	

DISCONNECT USING SQLCA;

IF ddplb_1.Text = "" THEN
	MessageBox("Mensaje de CONEXION...","! Por Favor debe Escoger la Base de Datos a Trabaja ¡",Information!)
	RETURN
END IF	

IF ddplb_1.Text = "BD Producción" THEN
	gb_base_de_datos = "general"
ELSE
	gb_base_de_datos = "gene"
END IF	


string usuario
String servidor

SQLCA.DBMS = profilestring("c:\afilliados\conexion.ini","Parametros","Manejador","SYC")

SQLCA.DBParm = "Host='"+gb_name_computer+"'"

IF gb_base_de_datos = "general" THEN
	SQLCA.Database = profilestring("c:\afilliados\conexion.ini","Parametros","Base_Datos","None")
	MessageBox("Mensaje de CONEXION...","! "+TRIM(sle_2.text)+" Usted va a Trabajar en la Base de Datos de PRODUCCION ¡",Information!)
ELSE
	SQLCA.Database = profilestring("c:\afilliados\conexion.ini","Prueba","Base_Datos","None")	
	MessageBox("Mensaje de CONEXION...","! "+TRIM(sle_2.text)+" Usted va a Trabajar en la Base de Datos de PRUEBAS ¡",Information!)	
END IF


SQLCA.ServerName = profilestring("c:\afilliados\conexion.ini","Parametros","Servidor","CAXDAC_SUN")

SQLCA.LogID =  sle_2.text

SQLCA.LogPass = sle_3.text

SQLCA.AutoCommit = TRUE	

connect using SQLCA;

IF SQLCA.SQLCode <> 0 THEN
	sle_1.Text = "*** Sin Conexión ***"
	w_segunda.Title = "Sistema de Jurídica...      "+"- NO EXISTE CONEXION -"
	w_segunda.Tag = "Usuario... " + "SIN CONEXION          ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")	
	Messagebox("MENSAJE DE CONEXION...","! La Conexión a la Báse de Datos fue Fallida ¡",Exclamation!)
	SetNull(gb_usuario)
	RETURN
ELSE
	gb_usuario = sle_2.text	
	String usuario_busca
	SELECT login_name, descripcion_login, tipo_usuario, activo_si_no &
			INTO :usuario_busca, :gb_descripcion_usuario, :gb_tipo_usuario, :gb_activo_si_no FROM &
			usuarios_juridica WHERE login_name = :gb_usuario;
			
	IF usuario_busca = "" OR IsNull(usuario_busca) THEN
		sle_1.Text = "*** Sin Conexión ***"
		MessageBox("MENSAJE DE CONEXION...","! Este Usuario NO está Autorizado para la Aplicación ¡",Exclamation!)
		SetNull(gb_usuario)
		w_segunda.Title = "Sistema de Jurídica...      "+"- NO EXISTE CONEXION -"
		w_segunda.Tag = "Usuario... " + "SIN CONEXION          ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
		RETURN
	END IF		

	SELECT fullname INTO :gb_full_usuario FROM master..syslogins WHERE master..syslogins.name = :gb_usuario;

	IF gb_base_de_datos = "general" THEN
		w_segunda.Title = "Sistema de Jurídica...  BD de Producción...  "+"- "+RightTrim(gb_descripcion_usuario)+" - ---> "+TRIM(gb_full_usuario)
	ELSE
		w_segunda.Title = "Sistema de Jurídica...  BD de Prueba...  "+"- "+RightTrim(gb_descripcion_usuario)+" - ---> "+TRIM(gb_full_usuario)
	END IF	

	m_principal.m_seguridad.m_usuarios.Enabled = False
	m_principal.m_seguridad.m_permisosdeusuarios.Enabled = False
	m_principal.m_seguridad.m_operaciones.Enabled = False	

	IF gb_tipo_usuario <> "A" THEN	
		m_principal.m_seguridad.m_usuarios.Enabled = False
		m_principal.m_seguridad.m_operaciones.Enabled = False
		m_principal.m_seguridad.m_permisosdeusuarios.Enabled = False
	ELSE
		m_principal.m_seguridad.m_usuarios.Enabled = TRUE
		m_principal.m_seguridad.m_operaciones.Enabled = TRUE
		m_principal.m_seguridad.m_permisosdeusuarios.Enabled = TRUE
	END IF		
	
	w_segunda.Pointer = "Arrow!"
	w_segunda.Tag = "Usuario... " + gb_usuario+"     ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(This.Tag)
	Close(w_cambio_usuario)
	RETURN
END IF

end event

type sle_3 from singlelineedit within w_cambio_usuario
integer x = 677
integer y = 492
integer width = 672
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_cambio_usuario
integer x = 677
integer y = 384
integer width = 672
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_cambio_usuario
integer x = 114
integer y = 496
integer width = 512
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
long backcolor = 67108864
boolean enabled = false
string text = "Password Nuevo..."
boolean focusrectangle = false
end type

type st_3 from statictext within w_cambio_usuario
integer x = 114
integer y = 392
integer width = 512
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
long backcolor = 67108864
boolean enabled = false
string text = "Usuario Nuevo..."
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_cambio_usuario
integer x = 677
integer y = 228
integer width = 672
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_cambio_usuario
integer x = 114
integer y = 248
integer width = 512
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 32768
long backcolor = 67108864
boolean enabled = false
string text = "Usuario Actual..."
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_cambio_usuario
integer x = 64
integer y = 740
integer width = 873
integer height = 224
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Abadi MT Condensed Light"
long textcolor = 8388608
string text = "Ventana para Cambiar de Usuario en la Aplicación. Ingrese el Nuevo Usuario y el Nuevo Password."
boolean displayonly = true
borderstyle borderstyle = styleshadowbox!
end type

type st_1 from statictext within w_cambio_usuario
integer x = 407
integer y = 48
integer width = 1399
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Calisto MT"
long textcolor = 16711680
long backcolor = 16777215
boolean enabled = false
string text = "Cambiar de Usuario (Login)"
alignment alignment = center!
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_cambio_usuario
long linecolor = 16711680
integer linethickness = 4
long fillcolor = 16777215
integer x = 201
integer y = 24
integer width = 1815
integer height = 144
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_cambio_usuario
long linecolor = 8421376
integer linethickness = 4
long fillcolor = 65280
integer x = 1440
integer y = 200
integer width = 471
integer height = 468
integer cornerheight = 40
integer cornerwidth = 46
end type

