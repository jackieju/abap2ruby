*"* components of interface IF_ESF_PROVIDER_TRANSACT_CTRL
interface IF_ESF_PROVIDER_TRANSACT_CTRL
  public .


  methods ON_AFTER_CHECK_TRANSACTION
    importing
      !IN_REJECTED type SESF_BOOLEAN
    changing
      !INOUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods ON_AFTER_CLEANUP_TRANSACTION
    changing
      !INOUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods ON_AFTER_SAVE_TRANSACTION
    importing
      !IN_REJECTED type SESF_BOOLEAN
    changing
      !INOUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods ON_BEFORE_CHECK_TRANSACTION
    exporting
      !OUT_REJECTED type SESF_BOOLEAN
      !OUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods ON_BEFORE_CLEANUP_TRANSACTION
    exporting
      !OUT_REJECTED type SESF_BOOLEAN
      !OUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
  methods ON_BEFORE_SAVE_TRANSACTION
    exporting
      !OUT_REJECTED type SESF_BOOLEAN
      !OUT_MESSAGES type CM_ESI_ROOT=>TT_ESI_ROOT .
endinterface.