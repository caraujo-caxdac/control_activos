$PBExportHeader$w_acerca_de_aplicacion.srw
forward
global type w_acerca_de_aplicacion from window
end type
type p_5 from picture within w_acerca_de_aplicacion
end type
type p_3 from picture within w_acerca_de_aplicacion
end type
type sle_filename from singlelineedit within w_acerca_de_aplicacion
end type
type cbx_ispb from checkbox within w_acerca_de_aplicacion
end type
type st_6 from statictext within w_acerca_de_aplicacion
end type
type st_2 from statictext within w_acerca_de_aplicacion
end type
type st_3 from statictext within w_acerca_de_aplicacion
end type
type st_4 from statictext within w_acerca_de_aplicacion
end type
type st_5 from statictext within w_acerca_de_aplicacion
end type
type st_filedescription from statictext within w_acerca_de_aplicacion
end type
type st_companyname from statictext within w_acerca_de_aplicacion
end type
type st_copyright from statictext within w_acerca_de_aplicacion
end type
type st_productname from statictext within w_acerca_de_aplicacion
end type
type st_productversion from statictext within w_acerca_de_aplicacion
end type
type st_1 from statictext within w_acerca_de_aplicacion
end type
end forward

global type w_acerca_de_aplicacion from window
integer width = 2505
integer height = 1004
boolean titlebar = true
string title = "Acerca de la Aplicación..."
boolean controlmenu = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "Information!"
boolean center = true
p_5 p_5
p_3 p_3
sle_filename sle_filename
cbx_ispb cbx_ispb
st_6 st_6
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_filedescription st_filedescription
st_companyname st_companyname
st_copyright st_copyright
st_productname st_productname
st_productversion st_productversion
st_1 st_1
end type
global w_acerca_de_aplicacion w_acerca_de_aplicacion

type variables
private n_versioninfo inv_versionInfo
end variables

on w_acerca_de_aplicacion.create
this.p_5=create p_5
this.p_3=create p_3
this.sle_filename=create sle_filename
this.cbx_ispb=create cbx_ispb
this.st_6=create st_6
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_filedescription=create st_filedescription
this.st_companyname=create st_companyname
this.st_copyright=create st_copyright
this.st_productname=create st_productname
this.st_productversion=create st_productversion
this.st_1=create st_1
this.Control[]={this.p_5,&
this.p_3,&
this.sle_filename,&
this.cbx_ispb,&
this.st_6,&
this.st_2,&
this.st_3,&
this.st_4,&
this.st_5,&
this.st_filedescription,&
this.st_companyname,&
this.st_copyright,&
this.st_productname,&
this.st_productversion,&
this.st_1}
end on

on w_acerca_de_aplicacion.destroy
destroy(this.p_5)
destroy(this.p_3)
destroy(this.sle_filename)
destroy(this.cbx_ispb)
destroy(this.st_6)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_filedescription)
destroy(this.st_companyname)
destroy(this.st_copyright)
destroy(this.st_productname)
destroy(this.st_productversion)
destroy(this.st_1)
end on

event open;m_principal.m_0.m_acercadelaaplicación.Checked = TRUE
// create NVO to be used to access the version information
inv_versionInfo = CREATE n_versionInfo

string ls_Path
string ls_File
cbx_ispb.Visible = FALSE
sle_filename.Visible = FALSE
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

// get and display the various version information strings (the string <NULL> displays if the
// version information was not accessible based on the information not being stamped within
// the EXE file or because of a programming error).
ls_PropertyValue = inv_versionInfo.getDescription(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
st_filedescription.text = ls_PropertyValue

ls_PropertyValue = inv_versionInfo.getCompanyName(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
st_companyname.text = ls_PropertyValue

ls_PropertyValue = inv_versionInfo.getCopyright(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
st_copyright.text = ls_PropertyValue

ls_PropertyValue = inv_versionInfo.getProductName(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
st_productname.text = ls_PropertyValue

ls_PropertyValue = inv_versionInfo.getVersion(ls_EXEName)
if IsNull(ls_PropertyValue) THEN ls_PropertyValue = "<NULL>"
st_productversion.text = ls_PropertyValue
end event

event close;m_principal.m_0.m_acercadelaaplicación.Checked = FALSE
end event

type p_5 from picture within w_acerca_de_aplicacion
integer x = 32
integer y = 24
integer width = 251
integer height = 868
string picturename = "C:\Muñecos\BITMAPS\Imagen_CAXDAC_3.jpg"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type p_3 from picture within w_acerca_de_aplicacion
integer x = 27
integer y = 1304
integer width = 251
integer height = 1276
string picturename = "C:\Muñecos\BITMAPS\Imagen_CAXDAC_2.jpg"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type sle_filename from singlelineedit within w_acerca_de_aplicacion
integer x = 338
integer y = 792
integer width = 626
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cbx_ispb from checkbox within w_acerca_de_aplicacion
integer x = 978
integer y = 784
integer width = 622
integer height = 84
integer taborder = 20
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

type st_6 from statictext within w_acerca_de_aplicacion
integer x = 389
integer y = 572
integer width = 393
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Descripción"
boolean focusrectangle = false
end type

type st_2 from statictext within w_acerca_de_aplicacion
integer x = 389
integer y = 428
integer width = 393
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Compañía"
boolean focusrectangle = false
end type

type st_3 from statictext within w_acerca_de_aplicacion
integer x = 389
integer y = 500
integer width = 393
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Copyright"
boolean focusrectangle = false
end type

type st_4 from statictext within w_acerca_de_aplicacion
integer x = 389
integer y = 284
integer width = 393
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Producto"
boolean focusrectangle = false
end type

type st_5 from statictext within w_acerca_de_aplicacion
integer x = 389
integer y = 356
integer width = 393
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
string text = "Versión"
boolean focusrectangle = false
end type

type st_filedescription from statictext within w_acerca_de_aplicacion
integer x = 846
integer y = 572
integer width = 1632
integer height = 108
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_companyname from statictext within w_acerca_de_aplicacion
integer x = 846
integer y = 428
integer width = 1518
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_copyright from statictext within w_acerca_de_aplicacion
integer x = 846
integer y = 500
integer width = 1518
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_productname from statictext within w_acerca_de_aplicacion
integer x = 846
integer y = 284
integer width = 1518
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_productversion from statictext within w_acerca_de_aplicacion
integer x = 846
integer y = 356
integer width = 1518
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_acerca_de_aplicacion
integer x = 343
integer y = 60
integer width = 2117
integer height = 104
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 128
long backcolor = 67108864
string text = "Caja de Auxilios y de Prestaciones de ACDAC"
alignment alignment = center!
boolean focusrectangle = false
end type

