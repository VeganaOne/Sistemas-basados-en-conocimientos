(defrule regla1
  (esta-activado (objeto Silla) (locacion Piso))
  (esta-activado (objeto chango) (locacion Piso))
  =>
  (assert (chango-mover (objeto Silla) (locacion Piso)))
  (printout t "R-01: chango movers to la Silla on la Piso" crlf)
)

(defrule regla2
  ?d <- (chango-mover (objeto Silla) (locacion Piso))
  ?f <- (esta-activado (objeto Silla) (locacion Piso))
  (esta-activado (objeto chango) (locacion Piso))
  =>
  (assert (chango-agarrar (objeto Silla)))
  (printout t "R-02: chango agarrars la Silla" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla3
  (chango-agarrar (objeto Silla))
  (esta-activado (objeto chango) (locacion Piso))
  =>
  (assert (chango-mover (objeto Escritorio) (locacion Piso)))
  (printout t "R-03: chango movers to el Escritorio on la Piso" crlf)
)

(defrule regla4
  ?d <- (chango-mover (objeto Escritorio) (locacion Piso))
  ?f <- (esta-activado (objeto chango) (locacion Piso))
  (esta-activado (objeto Escritorio) (locacion Piso))
  (esta-activado (objeto chango) (locacion Piso))
  =>
  (assert (esta-activado (objeto chango) (locacion Escritorio)))
  (printout t "R-04: chango is on el Escritorio" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla5
  (esta-activado (objeto chango) (locacion Escritorio))
  ?d <- (chango-agarrar (objeto Silla))
  =>
  (assert (chango-poner (objeto Silla) (locacion Escritorio)))
  (printout t "R-05: chango pone la Silla on el Escritorio" crlf)
  (retract ?d)
)

(defrule regla6
  ?d <- (chango-poner (objeto Silla) (locacion Escritorio))
  (esta-activado (objeto chango) (locacion Escritorio))
  =>
  (assert (esta-activado (objeto Silla) (locacion Escritorio)))
  (printout t "R-06: Silla is on el Escritorio" crlf)
  (retract ?d)
)

(defrule regla7
  (esta-activado (objeto chango) (locacion Escritorio))
  (esta-activado (objeto Silla) (locacion Escritorio))
  (esta-activado (objeto Escritorio) (locacion Piso))
  =>
  (assert (chango-mover (objeto Silla) (locacion Escritorio)))
  (printout t "R-07: chango movers to la Silla on el Escritorio" crlf)
)

(defrule regla8
  ?d <- (chango-mover (objeto Silla) (locacion Escritorio))
  ?f <- (esta-activado (objeto chango) (locacion Escritorio))
  (esta-activado (objeto Silla) (locacion Escritorio))
  (esta-activado (objeto Escritorio) (locacion Piso))
  =>
  (assert (esta-activado (objeto chango) (locacion Silla)))
  (printout t "R-08: chango is on la Silla" crlf)
  (retract ?d)
  (retract ?f)
)

(defrule regla9
  ?d <- (esta-activado (objeto Platano) (locacion Techo))
  (esta-activado (objeto chango) (locacion Silla))
  (esta-activado (objeto Silla) (locacion Escritorio))
  (esta-activado (objeto Escritorio) (locacion Piso))
  =>
  (assert (chango-agarrar (objeto Platano)))
  (printout t "R-09: chango agarrars la Platano" crlf)
  (retract ?d)
)

(defrule regla10
  ?d <- (chango-agarrar (objeto Platano))
  (esta-activado (objeto chango) (locacion Silla))
  (esta-activado (objeto Silla) (locacion Escritorio))
  (esta-activado (objeto Escritorio) (locacion Piso))
  =>
  (assert (chango-come (objeto Platano)))
  (printout t "R-10: chango comes la Platano" crlf)
  (retract ?d)
)

(defrule regla11
  ?d <- (chango-estado (estado hambriento))
  (chango-come (objeto Platano))
  (esta-activado (objeto chango) (locacion Silla))
  (esta-activado (objeto Silla) (locacion Escritorio))
  (esta-activado (objeto Escritorio) (locacion Piso))
  =>
  (assert (chango-estado (estado Happy)))
  (printout t "R-11: chango is happy" crlf)
  (retract ?d)
)