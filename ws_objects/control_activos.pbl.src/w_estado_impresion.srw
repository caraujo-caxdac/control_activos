$PBExportHeader$w_estado_impresion.srw
$PBExportComments$Ventana que informa el estado de la Impresión de un Reportes Cualquiera
forward
global type w_estado_impresion from window
end type
type pb_2 from picturebutton within w_estado_impresion
end type
type sle_2 from singlelineedit within w_estado_impresion
end type
type sle_1 from singlelineedit within w_estado_impresion
end type
type st_3 from statictext within w_estado_impresion
end type
end forward

global type w_estado_impresion from window
integer x = 206
integer y = 488
integer width = 1819
integer height = 712
boolean titlebar = true
string title = "Estado de Impresión..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 79741120
string icon = "C:\Muñecos\ICONS\print.ico"
boolean center = true
pb_2 pb_2
sle_2 sle_2
sle_1 sle_1
st_3 st_3
end type
global w_estado_impresion w_estado_impresion

on w_estado_impresion.create
this.pb_2=create pb_2
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.Control[]={this.pb_2,&
this.sle_2,&
this.sle_1,&
this.st_3}
end on

on w_estado_impresion.destroy
destroy(this.pb_2)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
end on

type pb_2 from picturebutton within w_estado_impresion
integer x = 827
integer y = 384
integer width = 247
integer height = 208
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
boolean default = true
boolean originalsize = true
string picturename = "c:\muñecos\bitmaps\afp.bmp"
string powertiptext = "Cancelar Impresión"
end type

event clicked;//string cancelar
//// Asigno la structura lst_impresion a la variable lst_impresion //
//st_cancelar_impresion lst_cancelar_impresion
//
//lst_cancelar_impresion.cancelar  = "S"
//closewithreturn(parent,lst_cancelar_impresion)
gb_printcancel = FALSE
CLOSE(w_estado_impresion)
end event

type sle_2 from singlelineedit within w_estado_impresion
integer x = 247
integer y = 256
integer width = 1298
integer height = 92
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217856
long backcolor = 65535
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_estado_impresion
integer x = 576
integer y = 76
integer width = 1175
integer height = 140
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
boolean displayonly = true
end type

type st_3 from statictext within w_estado_impresion
integer x = 55
integer y = 76
integer width = 494
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Nombre Reporte..."
boolean focusrectangle = false
end type

