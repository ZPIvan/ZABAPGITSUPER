*&---------------------------------------------------------------------*
*& Report ZFILTEROP23
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZFILTEROP23.
*Filter Operator Test23
*Filter Operator Test23
*Filter Operator Test23
*Filter Operator Test23
TABLES: spfli.
*DATA: lt_flights_all TYPE STANDARD TABLE OF spfli,
*      lt_flight_lh   TYPE STANDARD TABLE OF spfli.
*
*SELECT *  FROM spfli
*          INTO TABLE @lt_flights_all.
*IF sy-subrc = 0.
*
*  LOOP AT lt_flights_all INTO DATA(ls_flight) WHERE carrid = 'LH' OR carrid = 'QF' OR carrid = 'AA'.
*
*    APPEND ls_flight TO lt_flight_lh.
*    WRITE: / ls_flight-carrid,ls_flight-connid.
*    CLEAR: ls_flight.
*  ENDLOOP.
*ENDIF.

*with Filter constructor Operator

DATA: lt_flights_all TYPE STANDARD TABLE OF spfli
                     WITH NON-UNIQUE SORTED KEY carrid
                     COMPONENTS carrid,

      lt_flight_lh   TYPE STANDARD TABLE OF spfli.

SELECT *  FROM spfli
          INTO TABLE @lt_flights_all.
IF sy-subrc = 0.

lt_flight_lh = FILTER #( lt_flights_all USING KEY carrid
                                        WHERE carrid = 'LH ' ).

ENDIF.
LOOP AT lt_flight_lh INTO DATA(ls_flight).
  WRITE: / ls_flight-carrid,ls_flight-connid.
ENDLOOP.
