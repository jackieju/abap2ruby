*"* components of interface IF_ESF_PROVIDER_INIT
interface IF_ESF_PROVIDER_INIT
  public .


  types TY_TRANSACTION_PATTERN type I .

  constants CO_TP_SAVE_AND_CONTINUE type TY_TRANSACTION_PATTERN value 0. "#EC NOTEXT
  constants CO_TP_SAVE_AND_EXIT type TY_TRANSACTION_PATTERN value 1. "#EC NOTEXT

  interface IF_ESF_PROVIDER_INIT load .
  methods INIT
    importing
      !IN_PROVIDER_CONTEXT type ref to IF_ESF_PROVIDER_CONTEXT
      !IN_BO_NAME type STRING optional
    changing
      !INOUT_PREFERRED_TRX_PATTERN type TY_TRANSACTION_PATTERN default IF_ESF_PROVIDER_INIT=>CO_TP_SAVE_AND_CONTINUE .
endinterface.