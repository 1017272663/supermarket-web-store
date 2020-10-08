
package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import com.minimercadolospacos.webminimercadolospacos.models.repository.RolRepository;
import com.minimercadolospacos.webminimercadolospacos.service.iface.RolService;
import java.util.ArrayList;
import java.util.List;
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
    
}
