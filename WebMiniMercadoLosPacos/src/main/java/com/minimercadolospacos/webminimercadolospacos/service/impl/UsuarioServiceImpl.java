package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import com.minimercadolospacos.webminimercadolospacos.models.repository.UsuarioRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.minimercadolospacos.webminimercadolospacos.service.iface.UsuarioService;


@Service
public class UsuarioServiceImpl implements UsuarioService {
      
    @Autowired
    private UsuarioRepository usuarioRepository;
    
    @Override
    public List<Usuario> getAll() {
        // select * from gender
        List<Usuario> usuarios = new ArrayList<>();
        usuarioRepository.findAll().forEach(usuarios::add);
        return usuarios;
    }
}
