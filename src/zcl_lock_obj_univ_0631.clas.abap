CLASS zcl_lock_obj_univ_0631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lock_obj_univ_0631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    out->write( |User has started the business process| ).

    TRY.

        DATA(lo_lock_object) = cl_abap_lock_object_factory=>get_instance(
          EXPORTING
            iv_name        = 'EZ_UNI_LOCK_0631' ).

      CATCH cx_abap_lock_failure.

        out->write( |Lock object instance not created| ).

    ENDTRY.

    DATA  lt_parameter TYPE if_abap_lock_object=>tt_parameter.

    lt_parameter = VALUE #(  ( name = 'CLIENT'
                               value = REF #( '100' ) )

                             ( name = 'SOC'
                               value = REF #( 'A010' ) ) ).

    TRY.

        lo_lock_object->enqueue( it_parameter  = lt_parameter ).

      CATCH cx_abap_foreign_lock cx_abap_lock_failure.

        out->write( |Not possible to write on the database. Object is locked| ).

        RETURN.

    ENDTRY.

    out->write( |Lock object is active| ).


    DATA ls_university TYPE zuniversity_0631.

    ls_university = VALUE #( client       = '100'
                             soc          = 'A010'
                             exercise     = '0001'
                             course_price = '1500'
                             currency     = 'EUR'
                             courses      = '00001'
                             unit         = '001'
                             student_id   = '00001234'
                             first_name   = 'Maria'
                             last_name    = 'Perez'
                             course_code  = 'AA' ).

    WAIT UP TO 30 SECONDS.

    MODIFY zuniversity_0631 FROM @ls_university.

    IF sy-subrc EQ 0.
      out->write( |business object was update on the DDBB| ).
    ENDIF.

    TRY.
        lo_lock_object->dequeue( it_parameter  = lt_parameter ).

      CATCH cx_abap_lock_failure.
        out->write( |Lock object was update not released| ).
    ENDTRY.

    out->write( |Lock object was update released| ).

  ENDMETHOD.

ENDCLASS.
