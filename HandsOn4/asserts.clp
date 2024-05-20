(deffacts usuarioes
  (usuario (codigo-usuario 1) (nombre "Mateo")   (ciudad "Tijuana")    (telefono 7085375475))
  (usuario (codigo-usuario 2) (nombre "Grecia") (ciudad "Leon")    (telefono 2431457643))
  (usuario (codigo-usuario 3) (nombre "Lucas")    (ciudad "Chihuahua") (telefono 3314429610))
  (usuario (codigo-usuario 4) (nombre "Santiago")   (ciudad "Merida")          (telefono 3318939629))
  (usuario (codigo-usuario 5) (nombre "Luz")   (ciudad "Cancun")    (telefono 4865543002))
  (usuario (codigo-usuario 6) (nombre "Victor")  (ciudad "Mexicali")       (telefono 3389441138))
  (usuario (codigo-usuario 7) (nombre "Marco") (ciudad "Hermosillo")    (telefono 5587564498))
)

(deffacts productos
  (producto (codigo-producto 1) (marca Xiaomi)   (modelo "Mi band 8") (categoria Reloj)       (precio 3000))  
  (producto (codigo-producto 2) (marca Apple)   (modelo "Mac Book Air")   (categoria Computadora) (precio 30000))
  (producto (codigo-producto 3) (marca Samsung) (modelo "Galaxy S24")     (categoria Celular)     (precio 15000))
  (producto (codigo-producto 4) (marca Sony) (modelo "Pantalla LED")  (categoria TV)          (precio 45000))
  (producto (codigo-producto 5) (marca Lenovo)      (modelo "Yoga")        (categoria Computadora) (precio 14000))
  (producto (codigo-producto 6) (marca Apple) (modelo "iPad Air 5")  (categoria Tablet)      (precio 26000))
  (producto (codigo-producto 7) (marca Apple)   (modelo "IPhone 15")      (categoria Celular)     (precio 25000))
)

(deffacts pedidoes
  (pedido (codigo-pedido 1) (codigo-usuario 5) (tarjeta Rappi Visa))
  (pedido (codigo-pedido 2) (codigo-usuario 5) (tarjeta Liverpool Visa))
  (pedido (codigo-pedido 3) (codigo-usuario 2) (tarjeta Platacard Mastercard))
  (pedido (codigo-pedido 4) (codigo-usuario 3) (tarjeta Didi Mastercard))
  (pedido (codigo-pedido 5) (codigo-usuario 1) (tarjeta BBVA Visa))
)

(deffacts productos-pedidoes
  (producto-pedido (codigo-pedido 1) (codigo-producto 1) (cantcodigoad 1))
  (producto-pedido (codigo-pedido 1) (codigo-producto 7) (cantcodigoad 1))

  (producto-pedido (codigo-pedido 2) (codigo-producto 2) (cantcodigoad 1))

  (producto-pedido (codigo-pedido 3) (codigo-producto 3) (cantcodigoad 1))
  (producto-pedido (codigo-pedido 3) (codigo-producto 6) (cantcodigoad 1))

  (producto-pedido (codigo-pedido 4) (codigo-producto 7) (cantcodigoad 1))

  (producto-pedido (codigo-pedido 5) (codigo-producto 2) (cantcodigoad 1))
  (producto-pedido (codigo-pedido 5) (codigo-producto 5) (cantcodigoad 1))
)

