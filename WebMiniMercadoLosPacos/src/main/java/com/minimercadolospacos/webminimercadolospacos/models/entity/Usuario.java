package com.minimercadolospacos.webminimercadolospacos.models.entity;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "Usuario")
public class Usuario {
    
    @Id
    @Column(name="ID_user")
    private long idUser;
    
      
    @Column(name="nombre_user")
    private String nombreUser;
        
         
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
    @JoinColumn(name="ID_rol")
    private int idRol;

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

    /**
     * @return the nombreUser
     */
    public String getNombreUser() {
        return nombreUser;
    }

    /**
     * @param nombreUser the nombreUser to set
     */
    public void setNombreUser(String nombreUser) {
        this.nombreUser = nombreUser;
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
     * @return the idRol
     */
    public int getIdRol() {
        return idRol;
    }

    /**
     * @param idRol the idRol to set
     */
    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }
                 
}
