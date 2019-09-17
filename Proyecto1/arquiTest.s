MOVER r1, 0
MOVER r2, 10

loop:
  COMP r1, r2
  SALTOIG terminar
  SUM r1, r1, 1
  SALTO loop

terminar:
  MOVER r3, 10