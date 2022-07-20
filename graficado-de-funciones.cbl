IDENTIFICATION DIVISION.
PROGRAM-ID. GRAFICADO-DE-FUNCIONES.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 COORDENADAS.
    05 X                PIC 99 COMP-3.
    05 Y                PIC 99 COMP-3.

01 MAP-VARIABLES.
    05 MAP-IN-VAL       COMP-2.
    05 MAP-IN-MIN       COMP-2.
    05 MAP-IN-MAX       COMP-2.
    05 MAP-OUT-VAL      COMP-2.
    05 MAP-OUT-MIN      COMP-2.
    05 MAP-OUT-MAX      COMP-2. 

PROCEDURE DIVISION.
    PERFORM VARYING X FROM 1 BY 1 UNTIL X EQUALS 80
        MOVE X      TO MAP-IN-VAL
    *> Transportar los valores para x de [1, 80] a [0, 2*PI]
        MOVE 1      TO MAP-IN-MIN
        MOVE 80     TO MAP-IN-MAX
        MOVE 0      TO MAP-OUT-MIN
        COMPUTE MAP-OUT-MAX = 2 * FUNCTION PI
        PERFORM MAP
    *> Aplicación de la función seno
        COMPUTE MAP-IN-VAL = FUNCTION SIN(MAP-OUT-VAL)
    *> Transporta los valores para y de [-1, 1] a [21, 1]
        MOVE -1     TO MAP-IN-MIN
        MOVE 1      TO MAP-IN-MAX
        MOVE 21     TO MAP-OUT-MIN
        MOVE 1      TO MAP-OUT-MAX
        PERFORM MAP
    *> Grafica la función
        MOVE MAP-OUT-VAL TO Y
        DISPLAY 'X' COLUMN X LINE Y
    END-PERFORM.
    DISPLAY ' ' COLUMN 1 LINE 23.
STOP RUN.
    
MAP.
    *> Transporta el valor del argumento desde unos rangos a otros dados. Sacada de la función map de Arduino
    COMPUTE MAP-OUT-VAL = (MAP-IN-VAL - MAP-IN-MIN) * (MAP-OUT-MAX - MAP-OUT-MIN) / (MAP-IN-MAX - MAP-IN-MIN) + MAP-OUT-MIN.
    
END PROGRAM GRAFICADO-DE-FUNCIONES.
