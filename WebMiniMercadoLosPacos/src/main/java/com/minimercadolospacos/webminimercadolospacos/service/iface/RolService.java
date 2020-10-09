package com.minimercadolospacos.webminimercadolospacos.service.iface;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import java.util.List;


public interface RolService {
    void create(Rol rol);
        
    List<Rol> getAll();
    
    void update(int id, Rol rol);
    
    void delete(int id);
}
