$PBExportHeader$control_activos.sra
$PBExportComments$Generated Application Object
forward
global type control_activos from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
String gb_descripcion_usuario, gb_full_usuario, gb_usuario, &
		gb_salida, gb_name_user, gb_name_computer, gb_base_de_datos, &
		gb_sistema_operativo, gb_direccion_ip, gb_name_impresora, &
		gb_tipo_usuario, gb_activo_si_no, gb_base_de_datos_ambiente, gb_copyrigth, &
		gb_codigo_ambiente_desarrollo, gb_codigo_aplicacion_caxdac, &
		gb_descripcion_apliacion_caxdac, gb_version_aplicacion, &
		gb_directorio_salida, gb_path_aplicaciones, gb_ciudad_empresa, gb_direccion_empresa
String gb_nombre_archivo_ayuda
Boolean gb_printcancel
Transaction excell
Long gb_cuenta_filas
end variables

global type control_activos from application
string appname = "control_activos"
string appruntimeversion = "22.2.0.3441"
end type
global control_activos control_activos

on control_activos.create
appname="control_activos"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on control_activos.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;OPEN(w_entrada)
end event

