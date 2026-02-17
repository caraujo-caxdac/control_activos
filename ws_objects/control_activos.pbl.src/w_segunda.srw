$PBExportHeader$w_segunda.srw
forward
global type w_segunda from window
end type
type mdi_1 from mdiclient within w_segunda
end type
end forward

global type w_segunda from window
integer x = 9
integer y = 4
integer width = 3593
integer height = 1548
boolean titlebar = true
string title = "Control de Activos Fijos y Cargos Diferidos..."
string menuname = "m_principal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 16777215
string icon = "C:\Muñecos\ICONS\CARDFIL2.ICO"
mdi_1 mdi_1
end type
global w_segunda w_segunda

on w_segunda.create
if this.MenuName = "m_principal" then this.MenuID = create m_principal
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_segunda.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;m_principal.m_seguridad.m_usuarios.Enabled = False
m_principal.m_seguridad.m_operaciones.Enabled = False	
m_principal.m_seguridad.m_permisosdeusuarios.Enabled = False

IF gb_tipo_usuario = "A" THEN
	m_principal.m_seguridad.m_usuarios.Enabled = TRUE
	m_principal.m_seguridad.m_permisosdeusuarios.Enabled = TRUE
	m_principal.m_seguridad.m_operaciones.Enabled = TRUE
END IF	

w_segunda.Title = "Control de Activos y Cargos Diferidos... "+"- "+&
RightTrim(gb_descripcion_usuario)+" -"+" -----> "+TRIM(gb_full_usuario)+&
" - Ambiente -> "+Trim(gb_base_de_datos_ambiente)

w_segunda.Pointer = "Arrow!"
close(w_entrada)

IF gb_copyrigth = gb_version_aplicacion THEN
	w_segunda.Tag = gb_copyrigth+"  Usuario... "+gb_usuario+"     ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(This.Tag)
	Timer(1,w_segunda)
ELSE
	w_segunda.Tag = "*** CUIDADO *** Versión Desactualizada "+gb_copyrigth+"  Usuario... "+gb_usuario+"     ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(This.Tag)
	Timer(1,w_segunda)	
END IF
end event

event timer;IF gb_copyrigth = gb_version_aplicacion THEN
	w_segunda.Tag = gb_copyrigth+"  Usuario... "+gb_usuario+"     ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(This.Tag)
	Timer(1,w_segunda)
ELSE
	w_segunda.Tag = "*** CUIDADO *** Versión Desactualizada "+gb_copyrigth+"  Usuario... "+gb_usuario+"     ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
	w_segunda.SetMicrohelp(This.Tag)
	Timer(1,w_segunda)	
END IF

//w_segunda.Tag = gb_copyrigth+"  Usuario... "+gb_usuario+"     ...Fecha del Sistema... " + string(today(),"dd/mm/yyyy  hh:mm:ss")
//w_segunda.SetMicrohelp(This.Tag)
end event

type mdi_1 from mdiclient within w_segunda
long BackColor=276856960
end type

