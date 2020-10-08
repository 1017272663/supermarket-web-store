package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import com.minimercadolospacos.webminimercadolospacos.service.iface.UsuarioService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/Usuario")
public class UsuarioController {
        @Autowired
    private UsuarioService usuarioService;
    
    // HTTP -> GET, POST, PUT, DELETE
    
    @GetMapping
    public List<Usuario> getAll() {
        return usuarioService.getAll();
    }
}
