$PBExportHeader$w_escoge_reporte_inventario_fisico.srw
forward
global type w_escoge_reporte_inventario_fisico from window
end type
type rb_3 from radiobutton within w_escoge_reporte_inventario_fisico
end type
type st_3 from statictext within w_escoge_reporte_inventario_fisico
end type
type st_2 from statictext within w_escoge_reporte_inventario_fisico
end type
type imprimir from picturebutton within w_escoge_reporte_inventario_fisico
end type
type salir from picturebutton within w_escoge_reporte_inventario_fisico
end type
type rb_2 from radiobutton within w_escoge_reporte_inventario_fisico
end type
type rb_1 from radiobutton within w_escoge_reporte_inventario_fisico
end type
type st_1 from statictext within w_escoge_reporte_inventario_fisico
end type
type gb_1 from groupbox within w_escoge_reporte_inventario_fisico
end type
type rr_3 from roundrectangle within w_escoge_reporte_inventario_fisico
end type
type rr_1 from roundrectangle within w_escoge_reporte_inventario_fisico
end type
end forward

global type w_escoge_reporte_inventario_fisico from window
integer width = 1664
integer height = 1536
boolean titlebar = true
string title = "Tipos de Informes..."
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Menu5!"
boolean center = true
rb_3 rb_3
st_3 st_3
st_2 st_2
imprimir imprimir
salir salir
rb_2 rb_2
rb_1 rb_1
st_1 st_1
gb_1 gb_1
rr_3 rr_3
rr_1 rr_1
end type
global w_escoge_reporte_inventario_fisico w_escoge_reporte_inventario_fisico

on w_escoge_reporte_inventario_fisico.create
this.rb_3=create rb_3
this.st_3=create st_3
this.st_2=create st_2
this.imprimir=create imprimir
this.salir=create salir
this.rb_2=create rb_2
this.rb_1=create rb_1
this.st_1=create st_1
this.gb_1=create gb_1
this.rr_3=create rr_3
this.rr_1=create rr_1
this.Control[]={this.rb_3,&
this.st_3,&
this.st_2,&
this.imprimir,&
this.salir,&
this.rb_2,&
this.rb_1,&
this.st_1,&
this.gb_1,&
this.rr_3,&
this.rr_1}
end on

on w_escoge_reporte_inventario_fisico.destroy
destroy(this.rb_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.imprimir)
destroy(this.salir)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.rr_3)
destroy(this.rr_1)
end on

type rb_3 from radiobutton within w_escoge_reporte_inventario_fisico
integer x = 105
integer y = 580
integer width = 1243
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 67108864
string text = "Informe por Responsable para Entrega"
end type

type st_3 from statictext within w_escoge_reporte_inventario_fisico
integer x = 1408
integer y = 1360
integer width = 160
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Salir"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_escoge_reporte_inventario_fisico
integer x = 1143
integer y = 1360
integer width = 270
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 16777215
string text = "Imprimir"
alignment alignment = center!
boolean focusrectangle = false
end type

type imprimir from picturebutton within w_escoge_reporte_inventario_fisico
integer x = 1184
integer y = 1180
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
string picturename = "C:\Muñecos\BITMAPS\printer.png"
alignment htextalign = left!
string powertiptext = "Imprimir Inventario"
end type

event clicked;IF rb_1.Checked = TRUE THEN
	OPEN(w_imprime_activo_fisico_x_tipo_inventario)
END IF
IF rb_2.Checked = TRUE THEN
	OPEN(w_imprime_activo_fisico_x_responsable)
END IF
IF rb_3.Checked = TRUE THEN
	OPEN(w_imprime_activo_fisico_x_resp_x_entrega)
END IF
end event

type salir from picturebutton within w_escoge_reporte_inventario_fisico
integer x = 1399
integer y = 1180
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
boolean cancel = true
string picturename = "c:\muñecos\bitmaps\puerta_02.bmp"
alignment htextalign = left!
string powertiptext = "Cerrar Ventana"
end type

event clicked;Close(w_escoge_reporte_inventario_fisico)
end event

type rb_2 from radiobutton within w_escoge_reporte_inventario_fisico
integer x = 105
integer y = 496
integer width = 1225
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 67108864
string text = "Informe por Responsable"
end type

type rb_1 from radiobutton within w_escoge_reporte_inventario_fisico
integer x = 105
integer y = 412
integer width = 1225
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 67108864
string text = "Informe por Tipo de Inventario"
end type

type st_1 from statictext within w_escoge_reporte_inventario_fisico
integer x = 50
integer y = 48
integer width = 1559
integer height = 104
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 65535
long backcolor = 8421504
boolean enabled = false
string text = "Reportes del Inventario Físico"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_escoge_reporte_inventario_fisico
integer x = 59
integer y = 308
integer width = 1458
integer height = 620
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Verdana"
long textcolor = 128
long backcolor = 67108864
string text = "Reportes... "
end type

type rr_3 from roundrectangle within w_escoge_reporte_inventario_fisico
long linecolor = 65535
integer linethickness = 5
long fillcolor = 8421504
integer x = 23
integer y = 20
integer width = 1605
integer height = 156
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_1 from roundrectangle within w_escoge_reporte_inventario_fisico
long linecolor = 128
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1138
integer y = 1156
integer width = 480
integer height = 276
integer cornerheight = 40
integer cornerwidth = 46
end type

