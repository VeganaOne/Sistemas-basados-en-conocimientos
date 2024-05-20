(defrule usuario-no-compra
  (usuario (codigo-usuario ?ic) (nombre ?n))
  (not (pedido (codigo-usuario ?ic)))
  =>
  (printout t "R-01: El usuario " ?n " no ha realizado ninguna compra." crlf)
)

(defrule promocion-usuario-no-compra
  (usuario (codigo-usuario ?ic) (nombre ?n))
  (not (pedido (codigo-usuario ?ic)))
  =>
  (assert (traer-promocion ?ic 5))
  (printout t "R-02: El usuario " ?n " tiene un 5% de promocion para su primera compra." crlf)
)

(defrule traer-usuario-promocion
  ?lcd <- (traer-promocion ?ic ?d)
  (usuario (codigo-usuario ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "R-03: Llamando al usuario " ?n " al telefono " ?t " para ofrecerle una promocion del " ?d "%." crlf)
  (retract ?lcd)
)

(defrule imprimir-productos-apple
  (producto (marca Apple) (modelo ?m))
  =>
  (printout t "R-04: Producto de Apple: " ?m "." crlf)
)

(defrule imprimir-productos-computadora
  (producto (categoria Computadora) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "R-05: Computadora de " ?ma ", modelo " ?mo ", cuesta $" ?p "." crlf)
)

(defrule imprimir-productos-menos-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (< ?p 18000)))
  =>
  (printout t "R-06: Producto Barato (< $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

(defrule imprimir-productos-mas-18
  (producto (marca ?ma) (modelo ?mo) (precio ?p & : (> ?p 18000)))
  =>
  (printout t "R-07: Producto Caro (> $18,000) de " ?ma ", modelo " ?mo " cuesta $" ?p "." crlf)
)

(defrule imprimir-productos-precio
  (producto (codigo-producto ?ip) (marca ?ma) (modelo ?mo) (precio ?p))
  =>
  (printout t "R-08: " ?ip " | " ?ma " | " ?mo " | " ?p crlf)
)

(defrule promocion-usuario-dos-compras
  (usuario (codigo-usuario ?ic) (nombre ?n))
  (pedido (codigo-usuario ?ic) (codigo-pedido ?io1))
  (pedido (codigo-usuario ?ic) (codigo-pedido ?io2 & : (neq ?io1 ?io2)))
  =>
  (assert (traer-promocion ?ic 10))
  (printout t "R-09: El usuario " ?n " tiene un 10% de promocion para su tercera compra." crlf)
)

(defrule meses-sin-intereses-bbva
  (pedido (codigo-pedido ?io) (codigo-usuario ?ic) (tarjeta BBVA ?g))
  (usuario (codigo-usuario ?ic) (nombre ?n))
  =>
  (printout t "R-10: El pedido " ?io " del usuario " ?n " tiene 12 MSI por BBVA." crlf)
)

(defrule promocion-dos-productos-misma-marca
  (pedido (codigo-pedido ?io) (codigo-usuario ?ic))
  (usuario (codigo-usuario ?ic) (nombre ?n))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip1))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip2))
  (producto (codigo-producto ?ip1) (marca ?ma))
  (producto (codigo-producto ?ip2) (marca ?ma & : (neq ?ip1 ?ip2)))
  =>
  (assert (traer-promocion ?ic 15))
  (printout t "R-11: El pedido " ?io " del usuario " ?n " tiene un 15% de promocion por tener dos productos de la marca " ?ma "." crlf)
)

(defrule imprimir-ciudad-usuarioes
  (usuario (nombre ?n) (ciudad ?c))
  =>
  (printout t "R-12: El usuario " ?n " vive en " ?c "." crlf)
)

(defrule imprimir-productos-menos-comprados
  (producto (codigo-producto ?ip) (marca ?ma) (modelo ?mo))
  (not (producto-pedido (codigo-producto ?ip)))
  =>
  (printout t "R-13: Producto menos comprado: " ?ma " " ?mo "." crlf)
)

(defrule imprimir-productos-pedido
  (pedido (codigo-pedido ?io) (codigo-usuario ?ic))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip))
  (producto (codigo-producto ?ip) (marca ?ma) (modelo ?mo))
  =>
  (printout t "R-14: Producto de El pedido " ?io ": " ?ma " " ?mo "." crlf)
)

(defrule promocion-dos-productos-misma-categoria
  (pedido (codigo-pedido ?io) (codigo-usuario ?ic))
  (usuario (codigo-usuario ?ic) (nombre ?n))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip1))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip2))
  (producto (codigo-producto ?ip1) (categoria ?ca))
  (producto (codigo-producto ?ip2) (categoria ?ca & : (neq ?ip1 ?ip2)))
  =>
  (assert (traer-promocion ?ic 15))
  (printout t "R-15: El pedido " ?io " del usuario " ?n " tiene un 15% de promocion por tener dos productos de la categoria " ?ca "." crlf)
)

(defrule promocion-usuario-primera-pedido
  (pedido (codigo-usuario ?ic) (codigo-pedido 1))
  (usuario (codigo-usuario ?ic) (nombre ?n))
  =>
  (assert (traer-promocion ?ic 50))
  (printout t "R-16: El usuario " ?n " tiene un 50% de promocion por haber hecho la primera pedido de la tienda." crlf)
)

(defrule promocion-mica-protector
  (pedido (codigo-pedido ?io) (codigo-usuario ?ic))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip))
  (producto (codigo-producto ?ip) (categoria Celular))
  (usuario (codigo-usuario ?ic) (nombre ?n))
  =>
  (assert (traer-promocion ?ic 20))
  (printout t "R-17: El usuario " ?n " tiene un 20% de promocion en una mica y un protector de pantalla por comprar un celular." crlf)
)

(defrule promocion-usuario-hermosillo
  (usuario (codigo-usuario ?ic) (nombre ?n) (ciudad "Hermosillo"))
  =>
  (assert (traer-promocion ?ic 10))
  (printout t "R-18: El usuario " ?n " tiene un 10% de promocion por vivir en Hermosillo." crlf)
)

(defrule seguro-usuario-computadora
  (pedido (codigo-pedido ?io) (codigo-usuario ?ic))
  (producto-pedido (codigo-pedido ?io) (codigo-producto ?ip))
  (producto (codigo-producto ?ip) (modelo ?m) (categoria Computadora))
  (usuario (codigo-usuario ?ic) (nombre ?n))
  =>
  (assert (traer-seguro ?ic))
  (printout t "R-19: El usuario " ?n " compro una Computadora " ?m ", se le ofrecera un seguro." crlf)
)

(defrule traer-usuario-seguro
  ?lcs <- (traer-seguro ?ic)
  (usuario (codigo-usuario ?ic) (nombre ?n) (telefono ?t))
  =>
  (printout t "R-20: Llamando al usuario " ?n " al telefono " ?t " para ofrecerle un seguro." crlf)
  (retract ?lcs)
)
