*"* components of interface IF_ESF_PROVIDER_INTERACT_CTRL
interface IF_ESF_PROVIDER_INTERACT_CTRL
  public .


  interface IF_ESF_TYPES load .
  methods DO_POST_PROCESSING
    importing
      !IN_OVERRULING_CODE type IF_ESF_TYPES=>TY_OVERRULING_CODE optional
    changing
      !INOUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods DO_PRE_PROCESSING .
  methods CLOSE_SESSION
    importing
      !SESSION_HAND_OVER type SESF_BOOLEAN optional .
endinterface.