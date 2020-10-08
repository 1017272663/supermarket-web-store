package com.minimercadolospacos.webminimercadolospacos.models.repository;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import org.springframework.data.repository.CrudRepository;

public interface UsuarioRepository extends CrudRepository<Usuario, Long>{
        //select * from Rol
    //delet from gender where id = 1
}
