package com.minimercadolospacos.webminimercadolospacos.models.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "compra")
public class Compra {
      
    @Id
    @Column(name="pedido_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
               
    @Column(name="total_compra")
    private long totalCompra;
             
    @Column(name="total_descuento")
    private long totalDescuento;
                   
    @Column(name="cantidad_productos")
    private long cantidadProductos;
    
    @Column(name="fecha_compra")
    private  LocalDate  fechaCompra;
    
      @Column(name="hora_compra")
    private LocalTime horaCompra;
         
      /*
      java.sql.Date -Fecha
      java.sql.Time - Hora
      java.sql.Timestamp – Fecha y hora
      LocalDateTime - Fecha y Hora*/
   @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="producto_id")
    private int idProducto;
        
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private long idUser;

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the totalCompra
     */
    public long getTotalCompra() {
        return totalCompra;
    }

    /**
     * @param totalCompra the totalCompra to set
     */
    public void setTotalCompra(long totalCompra) {
        this.totalCompra = totalCompra;
    }

    /**
     * @return the totalDescuento
     */
    public long getTotalDescuento() {
        return totalDescuento;
    }

    /**
     * @param totalDescuento the totalDescuento to set
     */
    public void setTotalDescuento(long totalDescuento) {
        this.totalDescuento = totalDescuento;
    }

    /**
     * @return the cantidadProductos
     */
    public long getCantidadProductos() {
        return cantidadProductos;
    }

    /**
     * @param cantidadProductos the cantidadProductos to set
     */
    public void setCantidadProductos(long cantidadProductos) {
        this.cantidadProductos = cantidadProductos;
    }

    /**
     * @return the fechaCompra
     */
    public LocalDate getFechaCompra() {
        return fechaCompra;
    }

    /**
     * @param fechaCompra the fechaCompra to set
     */
    public void setFechaCompra(LocalDate fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    /**
     * @return the horaCompra
     */
    public LocalTime getHoraCompra() {
        return horaCompra;
    }

    /**
     * @param horaCompra the horaCompra to set
     */
    public void setHoraCompra(LocalTime horaCompra) {
        this.horaCompra = horaCompra;
    }

    /**
     * @return the idProducto
     */
    public int getIdProducto() {
        return idProducto;
    }

    /**
     * @param idProducto the idProducto to set
     */
    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    /**
     * @return the idUser
     */
    public long getIdUser() {
        return idUser;
    }

    /**
     * @param idUser the idUser to set
     */
    public void setIdUser(long idUser) {
        this.idUser = idUser;
    }
    
 
}
