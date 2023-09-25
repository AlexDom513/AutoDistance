# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "c_recvScaling" -parent ${Page_0}
  ipgui::add_param $IPINST -name "c_trigScaling" -parent ${Page_0}
  ipgui::add_param $IPINST -name "c_waitScaling" -parent ${Page_0}


}

proc update_PARAM_VALUE.c_recvScaling { PARAM_VALUE.c_recvScaling } {
	# Procedure called to update c_recvScaling when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.c_recvScaling { PARAM_VALUE.c_recvScaling } {
	# Procedure called to validate c_recvScaling
	return true
}

proc update_PARAM_VALUE.c_trigScaling { PARAM_VALUE.c_trigScaling } {
	# Procedure called to update c_trigScaling when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.c_trigScaling { PARAM_VALUE.c_trigScaling } {
	# Procedure called to validate c_trigScaling
	return true
}

proc update_PARAM_VALUE.c_waitScaling { PARAM_VALUE.c_waitScaling } {
	# Procedure called to update c_waitScaling when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.c_waitScaling { PARAM_VALUE.c_waitScaling } {
	# Procedure called to validate c_waitScaling
	return true
}


proc update_MODELPARAM_VALUE.c_trigScaling { MODELPARAM_VALUE.c_trigScaling PARAM_VALUE.c_trigScaling } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.c_trigScaling}] ${MODELPARAM_VALUE.c_trigScaling}
}

proc update_MODELPARAM_VALUE.c_waitScaling { MODELPARAM_VALUE.c_waitScaling PARAM_VALUE.c_waitScaling } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.c_waitScaling}] ${MODELPARAM_VALUE.c_waitScaling}
}

proc update_MODELPARAM_VALUE.c_recvScaling { MODELPARAM_VALUE.c_recvScaling PARAM_VALUE.c_recvScaling } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.c_recvScaling}] ${MODELPARAM_VALUE.c_recvScaling}
}

