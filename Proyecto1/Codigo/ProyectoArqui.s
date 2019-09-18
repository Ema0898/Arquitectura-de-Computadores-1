esperarInput:
  MOVER r2, 0
  MOVER r1, 104
  LOAD r0, [r1]
  COMP r0, 1
  SALTOIG iniciarAlgoritmo
  SUM r2, r2, 9
  SUM r1, r1, 4
  LOAD r0, [r1]
  COMP r0, 1
  SALTOIG iniciarAlgoritmo
  SUM r2, r2, 9
  SUM r1, r1, 4
  LOAD r0, [r1]
  COMP r0, 1
  SALTOIG iniciarAlgoritmo
  SALTO esperarInput

iniciarAlgoritmo:
  MOVER r0, 116
  MOVER r1, 0
  STORE r1, [r0]
  MOVER r5, 127
  MOVER r0, 0
  MOVER r1, 100
  SUM r1, r1, 100
  SUM r1, r1, 100
  SUM r1, r1, 100
  MOVER r3, 120
  MOVER r4, 80
  MUL r4, r4, 50
  SUM r4, r4, 3
  MUL r4, r4, 40
  SALTO llenarPrimeraFila

llenarPrimeraFila:
  COMP r0, r1
  SALTOIG procesarImagenIni
  STORE r5, [r4]
  SUM r4, r4, 1
  SUM r0, r0, 1
  MOVER r6, 0
  MOVER r7, 2
  SALTO llenarPrimeraFila

procesarImagenIni:
  MOVER r1, 100
  SUM r1, r1, 100
  SUM r1, r1, 100
  SUM r1, r1, 100
  MOVER r5, 127

procesarImagen:
  COMP r7, r1
  SALTOIG llenarFilaFinalIni
  COMP r6, r1
  SALTOIG llenarPixelFinal
  COMP r6, 0
  SALTOIG llenarPixelInicial
  SALTO convolucion

llenarFilaFinalIni:
  MOVER r0, 0

llenarFilaFinal:
  COMP r0, r1
  SALTOIG finalizar
  STORE r5, [r4]
  SUM r4, r4, 1
  SUM r0, r0, 1
  SALTO llenarFilaFinal

finalizar:
  MOVER r0, 116
  MOVER r1, 1
  STORE r1, [r0]
  SALTO esperarInput

llenarPixelFinal:
  STORE r5, [r4]
  SUM r4, r4, 1
  SUM r7, r7, 1
  SUM r3, r3, 2
  MOVER r6, 0
  SALTO procesarImagen

llenarPixelInicial:
  STORE r5, [r4]
  SUM r4, r4, 1
  SUM r6, r6, 2
  SALTO procesarImagen

convolucion:
  MOVER r1, 0
  MOVER r5, 0
  LOAD r0, [r2]
  LOAD r9, [r3]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 1
  LOAD r0, [r2, 1]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 1
  LOAD r0, [r2, 2]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 100
  SUM r5, r5, 100
  SUM r5, r5, 100
  SUM r5, r5, 98
  LOAD r0, [r2, 3]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 1
  LOAD r0, [r2, 4]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 1
  LOAD r0, [r2, 5]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 100
  SUM r5, r5, 100
  SUM r5, r5, 100
  SUM r5, r5, 98
  LOAD r0, [r2, 6]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 1
  LOAD r0, [r2, 7]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  SUM r5, r5, 1
  LOAD r0, [r2, 8]
  LOAD r9, [r3, r5]
  MUL r10, r0, r9
  SUM r1, r1, r10
  STORE r1, [r4]
  SUM r3, r3, 1
  SUM r4, r4, 1
  SUM r6, r6, 1
  SALTO procesarImagenIni