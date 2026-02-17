$PBExportHeader$w_usuario_antiguo.srw
forward
global type w_usuario_antiguo from window
end type
type mle_1 from multilineedit within w_usuario_antiguo
end type
type st_10 from statictext within w_usuario_antiguo
end type
type limpiar from picturebutton within w_usuario_antiguo
end type
type st_11 from statictext within w_usuario_antiguo
end type
type salir from picturebutton within w_usuario_antiguo
end type
type st_2 from statictext within w_usuario_antiguo
end type
type st_1 from statictext within w_usuario_antiguo
end type
type sle_1 from singlelineedit within w_usuario_antiguo
end type
type rr_1 from roundrectangle within w_usuario_antiguo
end type
type rr_2 from roundrectangle within w_usuario_antiguo
end type
end forward

global type w_usuario_antiguo from window
integer x = 823
integer y = 360
integer width = 1815
integer height = 816
boolean titlebar = true
string title = "Nombre Usuario Antiguo..."
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string icon = "C:\Muñecos\ICONS\Cad0a.ico"
boolean center = true
mle_1 mle_1
st_10 st_10
limpiar limpiar
st_11 st_11
salir salir
st_2 st_2
st_1 st_1
sle_1 sle_1
rr_1 rr_1
rr_2 rr_2
end type
global w_usuario_antiguo w_usuario_antiguo

on w_usuario_antiguo.create
this.mle_1=create mle_1
this.st_10=create st_10
this.limpiar=create limpiar
this.st_11=create st_11
this.salir=create salir
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.rr_1=create rr_1
this.rr_2=create rr_2
this.Control[]={this.mle_1,&
this.st_10,&
this.limpiar,&
this.st_11,&
this.salir,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.rr_1,&
this.rr_2}
end on

on w_usuario_antiguo.destroy
destroy(this.mle_1)
destroy(this.st_10)
destroy(this.limpiar)
destroy(this.st_11)
destroy(this.salir)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.rr_1)
destroy(this.rr_2)
end on

type mle_1 from multilineedit within w_usuario_antiguo
integer x = 37
integer y = 460
integer width = 882
integer height = 200
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
string text = "Ventana para el Ingreso del Usuario de quien se va a trasladar los permisos."
borderstyle borderstyle = styleshadowbox!
end type

type st_10 from statictext within w_usuario_antiguo
integer x = 1266
integer y = 600
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

type limpiar from picturebutton within w_usuario_antiguo
integer x = 1280
integer y = 432
integer width = 183
integer height = 160
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\database_refresh.png"
string powertiptext = "Limpiar Ventana"
end type

event clicked;sle_1.text = ""
sle_1.SetFocus()

end event

type st_11 from statictext within w_usuario_antiguo
integer x = 1490
integer y = 600
integer width = 183
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

type salir from picturebutton within w_usuario_antiguo
integer x = 1486
integer y = 432
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
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
string powertiptext = "Cerrar Ventana"
end type

event clicked;string nombre_usuario
nombre_usuario = TRIM(sle_1.text)
IF nombre_usuario = "" THEN
	SetNull(nombre_usuario)
END IF	
st_usuarios lst_usuarios
lst_usuarios.nombre_usuario = nombre_usuario

CloseWithReturn(w_usuario_antiguo,lst_usuarios)	




end event

type st_2 from statictext within w_usuario_antiguo
integer x = 27
integer y = 44
integer width = 1751
integer height = 88
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 16711680
long backcolor = 67108864
boolean enabled = false
string text = "Nombre de Usuario Antiguo"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_usuario_antiguo
integer x = 293
integer y = 228
integer width = 443
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 65280
long backcolor = 32896
boolean enabled = false
string text = "Nombre Usuario"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_usuario_antiguo
integer x = 805
integer y = 220
integer width = 631
integer height = 92
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "HyperLink!"
long textcolor = 134217856
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type rr_1 from roundrectangle within w_usuario_antiguo
long linecolor = 65280
integer linethickness = 4
long fillcolor = 32896
integer x = 229
integer y = 184
integer width = 1307
integer height = 172
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_usuario_antiguo
long linecolor = 16711680
integer linethickness = 8
long fillcolor = 16711680
integer x = 1211
integer y = 412
integer width = 512
integer height = 280
integer cornerheight = 40
integer cornerwidth = 46
end type

