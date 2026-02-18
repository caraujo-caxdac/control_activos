$PBExportHeader$w_depreciacion_activos.srw
forward
global type w_depreciacion_activos from window
end type
type p_1 from picture within w_depreciacion_activos
end type
type st_1 from statictext within w_depreciacion_activos
end type
end forward

global type w_depreciacion_activos from window
integer width = 3803
integer height = 1584
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
st_1 st_1
end type
global w_depreciacion_activos w_depreciacion_activos

on w_depreciacion_activos.create
this.p_1=create p_1
this.st_1=create st_1
this.Control[]={this.p_1,&
this.st_1}
end on

on w_depreciacion_activos.destroy
destroy(this.p_1)
destroy(this.st_1)
end on

type p_1 from picture within w_depreciacion_activos
integer x = 302
integer y = 308
integer width = 3127
integer height = 900
boolean originalsize = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_depreciacion_activos
integer x = 1010
integer y = 60
integer width = 1522
integer height = 192
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Depreciación Activos"
alignment alignment = center!
boolean focusrectangle = false
end type

