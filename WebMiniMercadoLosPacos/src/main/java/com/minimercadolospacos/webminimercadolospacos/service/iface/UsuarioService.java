package com.minimercadolospacos.webminimercadolospacos.service.iface;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import java.util.List;


public interface UsuarioService {
    
        void create(Usuario usuario);
        
        List<Usuario> getAll();
        
        void update(long id, Usuario usuario);
    
        void delete(long id);
}
