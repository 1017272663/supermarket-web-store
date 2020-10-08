package com.minimercadolospacos.webminimercadolospacos.models.repository;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import org.springframework.data.repository.CrudRepository;



public interface RolRepository extends CrudRepository<Rol, Integer> {
    //select * from Rol
    //delet from gender where id = 1
    
}
