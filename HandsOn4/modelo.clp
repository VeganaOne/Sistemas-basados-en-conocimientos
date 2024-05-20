(deftemplate usuario
  (slot codigo-usuario)
  (slot nombre)
  (slot ciudad)
  (slot telefono)
)

(deftemplate producto
  (slot codigo-producto)
  (slot marca)
  (slot modelo)
  (slot categoria)
  (slot precio)
)

(deftemplate pedido
  (slot codigo-pedido)
  (slot codigo-usuario)
  (multislot tarjeta)
)

(deftemplate producto-pedido
  (slot codigo-pedido)
  (slot codigo-producto)
  (slot cantcodigoad (default 1))
)