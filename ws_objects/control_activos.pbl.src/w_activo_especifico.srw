$PBExportHeader$w_activo_especifico.srw
forward
global type w_activo_especifico from window
end type
type p_1 from picture within w_activo_especifico
end type
type st_1 from statictext within w_activo_especifico
end type
end forward

global type w_activo_especifico from window
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
global w_activo_especifico w_activo_especifico

on w_activo_especifico.create
this.p_1=create p_1
this.st_1=create st_1
this.Control[]={this.p_1,&
this.st_1}
end on

on w_activo_especifico.destroy
destroy(this.p_1)
destroy(this.st_1)
end on

type p_1 from picture within w_activo_especifico
integer x = 448
integer y = 424
integer width = 2683
integer height = 568
boolean originalsize = true
boolean focusrectangle = false
end type

type st_1 from statictext within w_activo_especifico
integer x = 1234
integer y = 76
integer width = 1189
integer height = 220
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activo específico"
boolean focusrectangle = false
end type

