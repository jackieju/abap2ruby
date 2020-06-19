class CL_A1FIA_OWL_CO_GL definition
  public
  inheriting from CL_A1FIA_OWL2_CO
  create public .

public section.
*"* public components of class CL_A1FIA_OWL_CO_GL
*"* do not include other source files here!!!

  methods DERIVE_ACCESS_CONTEXT_CODE
    redefinition .
protected section.
*"* protected components of class CL_A1FIA_OWL_CO_GL
*"* do not include other source files here!!!
private section.
*"* private components of class CL_A1FIA_OWL_CO_GL
*"* do not include other source files here!!!
ENDCLASS.



CLASS CL_A1FIA_OWL_CO_GL IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method CL_A1FIA_OWL_CO_GL->DERIVE_ACCESS_CONTEXT_CODE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_WORK_CENTER_NAME            TYPE        STRING
* | [<---] EV_ACCESS_CONTEXT_CODE         TYPE        RBAM_ACCESS_CTX_CODE
* +--------------------------------------------------------------------------------------</SIGNATURE>
METHOD DERIVE_ACCESS_CONTEXT_CODE.

  CALL METHOD super->derive_access_context_code
    EXPORTING
      iv_work_center_name     = iv_work_center_name
    IMPORTING
      ev_access_context_code = ev_access_context_code.

  IF ev_access_context_code IS INITIAL.
    ev_access_context_code = if_a1fia_access_context=>co_gl_access_context.
  ENDIF.

ENDMETHOD.
ENDCLASS.