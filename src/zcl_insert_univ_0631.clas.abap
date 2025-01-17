CLASS zcl_insert_univ_0631 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_univ_0631 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DELETE FROM zuniversity_0631.

    MODIFY zuniversity_0631 FROM TABLE @( VALUE #( ( soc          = '0001'
                                                     exercise     = '2023'
                                                     course_price = '1500'
                                                     currency     = 'EUR'
                                                     courses      = '00001'
                                                     unit         = '001'
                                                     student_id   = '00001234'
                                                     first_name   = 'Maria'
                                                     last_name    = 'Perez'
                                                     course_code  = 'AA' )

                                                   ( soc          = '0002'
                                                     exercise     = '2023'
                                                     course_price = '1500'
                                                     currency     = 'EUR'
                                                     courses      = '00001'
                                                     unit         = '002'
                                                     student_id   = '00002345'
                                                     first_name   = 'Carlos'
                                                     last_name    = 'Gomez'
                                                     course_code  = 'AA' )

                                                   ( soc          = '0003'
                                                     exercise     = '2024'
                                                     course_price = '2500'
                                                     currency     = 'EUR'
                                                     courses      = '00002'
                                                     unit         = '001'
                                                     student_id   = '00006789'
                                                     first_name   = 'Diego'
                                                     last_name    = 'Ramirez'
                                                     course_code  = 'AB' )

                                                   ( soc          = '0004'
                                                     exercise     = '2024'
                                                     course_price = '2500'
                                                     currency     = 'EUR'
                                                     courses      = '00003'
                                                     unit         = '001'
                                                     student_id   = '00001256'
                                                     first_name   = 'Carlos'
                                                     last_name    = 'Gonzalez'
                                                     course_code  = 'AB' )

                                                   ( soc          = '0005'
                                                     exercise     = '2024'
                                                     course_price = '3500'
                                                     currency     = 'EUR'
                                                     courses      = '00003'
                                                     unit         = '004'
                                                     student_id   = '00007891'
                                                     first_name   = 'Ana'
                                                     last_name    = 'Lopez'
                                                     course_code  = 'AC' )  ) ).


    IF sy-subrc EQ 0.

      out->write( |{ sy-dbcnt } rows affected| ).

    ENDIF.


  ENDMETHOD.

ENDCLASS.
