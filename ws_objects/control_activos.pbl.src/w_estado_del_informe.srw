$PBExportHeader$w_estado_del_informe.srw
$PBExportComments$Ventana para ver el estado de un Informe de Archivo Plano.
forward
global type w_estado_del_informe from window
end type
type p_1 from picture within w_estado_del_informe
end type
type p_2 from picture within w_estado_del_informe
end type
type sle_2 from singlelineedit within w_estado_del_informe
end type
type hpb_1 from hprogressbar within w_estado_del_informe
end type
type sle_1 from singlelineedit within w_estado_del_informe
end type
type st_1 from statictext within w_estado_del_informe
end type
type gb_1 from groupbox within w_estado_del_informe
end type
type rr_1 from roundrectangle within w_estado_del_informe
end type
end forward

global type w_estado_del_informe from window
integer width = 2821
integer height = 776
boolean titlebar = true
string title = "Informe de Estado..."
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Menu5!"
boolean center = true
p_1 p_1
p_2 p_2
sle_2 sle_2
hpb_1 hpb_1
sle_1 sle_1
st_1 st_1
gb_1 gb_1
rr_1 rr_1
end type
global w_estado_del_informe w_estado_del_informe

on w_estado_del_informe.create
this.p_1=create p_1
this.p_2=create p_2
this.sle_2=create sle_2
this.hpb_1=create hpb_1
this.sle_1=create sle_1
this.st_1=create st_1
this.gb_1=create gb_1
this.rr_1=create rr_1
this.Control[]={this.p_1,&
this.p_2,&
this.sle_2,&
this.hpb_1,&
this.sle_1,&
this.st_1,&
this.gb_1,&
this.rr_1}
end on

on w_estado_del_informe.destroy
destroy(this.p_1)
destroy(this.p_2)
destroy(this.sle_2)
destroy(this.hpb_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.rr_1)
end on

type p_1 from picture within w_estado_del_informe
integer x = 37
integer y = 280
integer width = 219
integer height = 192
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\List.png"
boolean focusrectangle = false
end type

type p_2 from picture within w_estado_del_informe
integer x = 2542
integer y = 276
integer width = 219
integer height = 192
boolean originalsize = true
string picturename = "C:\Muñecos\BITMAPS\folder_add_48.png"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_estado_del_informe
integer x = 1033
integer y = 524
integer width = 1001
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Porcentaje Avance"
boolean border = false
boolean displayonly = true
end type

type hpb_1 from hprogressbar within w_estado_del_informe
integer x = 256
integer y = 424
integer width = 2281
integer height = 80
boolean bringtotop = true
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type

type sle_1 from singlelineedit within w_estado_del_informe
integer x = 256
integer y = 312
integer width = 2281
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
string text = "Nombre Archivo..."
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_estado_del_informe
integer x = 64
integer y = 48
integer width = 2706
integer height = 116
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long backcolor = 15780518
string text = "*** Ventana de Estado del Informe ***"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_estado_del_informe
integer x = 27
integer y = 236
integer width = 2757
integer height = 420
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
string text = "Guardando Arhivo..."
end type

type rr_1 from roundrectangle within w_estado_del_informe
integer linethickness = 4
long fillcolor = 15780518
integer x = 37
integer y = 24
integer width = 2752
integer height = 164
integer cornerheight = 40
integer cornerwidth = 46
end type

