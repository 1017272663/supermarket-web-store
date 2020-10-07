package com.minimercadolospacos.webminimercadolospacos.models.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Compra")
public class Compra {
      
    @Id
    @Column(name="ID_pedido")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idPedido;
    
    @Column(name="ID_producto")
    private int idProducto;
        
    @Column(name="ID_user")
    private long idUser;
                
    @Column(name="total_compra")
    private long totalCompra;
             
    @Column(name="total_descuento")
    private long totalDescuento;
                   
    @Column(name="cantidad_productos")
    private long cantidadProductos;
    
    @Column(name="fecha_compra")
    private  java.sql.Date  fechaCompra;
    
      @Column(name="hora_compra")
    private java.sql.Time horaCompra;
      
      /*java.sql.Timestamp – Fecha y hora*/
}
