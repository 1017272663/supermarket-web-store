
package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import com.minimercadolospacos.webminimercadolospacos.models.repository.RolRepository;
import com.minimercadolospacos.webminimercadolospacos.service.iface.RolService;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RolServiceImpl implements RolService {

    @Autowired
    private RolRepository rolRepository;
    
    @Override
    public List<Rol> getAll() {
        //select * from rol
        List<Rol> rols= new ArrayList<>();
        rolRepository.findAll().forEach(rols::add);
        return rols;
    }

    @Override
    public void create(Rol rol) {
        rolRepository.save(rol);// crea o inferta la informacion con los datos que se le pasan pr medio de usuario
    }

    @Override
    public void update(int id, Rol rol) {
   Optional<Rol> existsRol = rolRepository.findById(id);
        if (existsRol.isPresent()) {  
            existsRol.get().setId(rol.getId());
            existsRol.get().setName(rol.getName());
         rolRepository.save(existsRol.get());// ademas de insertar tambien sirve para actualizar si el id ya existe.
        }
    }

    @Override
    public void delete(int id) {
             // DELETE FROM usuario where id= 1;
        Optional<Rol> existsRol = rolRepository.findById(id);
        if (existsRol.isPresent()) {
            rolRepository.delete(existsRol.get());
    }
    
    }
    
}
