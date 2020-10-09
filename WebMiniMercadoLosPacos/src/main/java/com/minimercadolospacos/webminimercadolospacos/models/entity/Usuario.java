package com.minimercadolospacos.webminimercadolospacos.models.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "usuario")
public class Usuario{
    
    @Id
    @Column(name="user_id")
    private long id;
    
      
    @Column(name="nombre_user")
    private String name;
        
         
    @Column(name="apellido_user")
    private String apellidoUser;
                
    @Column(name="telefono_user")
    private long telefonoUser;
             
    @Column(name="correo")
    private String correo;
                   
    @Column(name="contrasenia")
    private String contrasenia;
    
    @Column(name="direcion_user")
    private String direcionUser;
         
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="rol_id")
    private int rolId;

    /**
     * @return the id
     */
    public long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(long id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the apellidoUser
     */
    public String getApellidoUser() {
        return apellidoUser;
    }

    /**
     * @param apellidoUser the apellidoUser to set
     */
    public void setApellidoUser(String apellidoUser) {
        this.apellidoUser = apellidoUser;
    }

    /**
     * @return the telefonoUser
     */
    public long getTelefonoUser() {
        return telefonoUser;
    }

    /**
     * @param telefonoUser the telefonoUser to set
     */
    public void setTelefonoUser(long telefonoUser) {
        this.telefonoUser = telefonoUser;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the contrasenia
     */
    public String getContrasenia() {
        return contrasenia;
    }

    /**
     * @param contrasenia the contrasenia to set
     */
    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    /**
     * @return the direcionUser
     */
    public String getDirecionUser() {
        return direcionUser;
    }

    /**
     * @param direcionUser the direcionUser to set
     */
    public void setDirecionUser(String direcionUser) {
        this.direcionUser = direcionUser;
    }

    /**
     * @return the rolId
     */
    public int getRolId() {
        return rolId;
    }

    /**
     * @param rolId the rolId to set
     */
    public void setRolId(int rolId) {
        this.rolId = rolId;
    }
                 
}
