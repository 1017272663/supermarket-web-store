package com.minimercadolospacos.webminimercadolospacos.models.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "PRODUCTO")
public class Producto {
        
    @Id
    @Column(name="ID_producto")
    private int idProducto;
    
      
    @Column(name="codi_barras")
    private long codiBarras;
        
         
    @Column(name="nombre_producto")
    private String nombreProducto;
                
    @Column(name="descripcion_producto")
    private String descripcionProducto;
             
    @Column(name="Imagen_producto")
    private String imagenProducto;
                   
    @Column(name="precio_unitario")
    private long precioUnitario;
    
    @Column(name="cantidad_producto")
    private int cantidadProducto;

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
     * @return the codiBarras
     */
    public long getCodiBarras() {
        return codiBarras;
    }

    /**
     * @param codiBarras the codiBarras to set
     */
    public void setCodiBarras(long codiBarras) {
        this.codiBarras = codiBarras;
    }

    /**
     * @return the nombreProducto
     */
    public String getNombreProducto() {
        return nombreProducto;
    }

    /**
     * @param nombreProducto the nombreProducto to set
     */
    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    /**
     * @return the descripcionProducto
     */
    public String getDescripcionProducto() {
        return descripcionProducto;
    }

    /**
     * @param descripcionProducto the descripcionProducto to set
     */
    public void setDescripcionProducto(String descripcionProducto) {
        this.descripcionProducto = descripcionProducto;
    }

    /**
     * @return the imagenProducto
     */
    public String getImagenProducto() {
        return imagenProducto;
    }

    /**
     * @param imagenProducto the imagenProducto to set
     */
    public void setImagenProducto(String imagenProducto) {
        this.imagenProducto = imagenProducto;
    }

    /**
     * @return the precioUnitario
     */
    public long getPrecioUnitario() {
        return precioUnitario;
    }

    /**
     * @param precioUnitario the precioUnitario to set
     */
    public void setPrecioUnitario(long precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    /**
     * @return the cantidadProducto
     */
    public int getCantidadProducto() {
        return cantidadProducto;
    }

    /**
     * @param cantidadProducto the cantidadProducto to set
     */
    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }
                
}
