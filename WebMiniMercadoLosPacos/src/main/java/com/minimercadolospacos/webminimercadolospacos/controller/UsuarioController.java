package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import com.minimercadolospacos.webminimercadolospacos.service.iface.UsuarioService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/usuario")
public class UsuarioController {
        @Autowired
    private UsuarioService usuarioService;
    
    // HTTP -> GET, POST, PUT, DELETE
    //Get=traer datos consultas
    //Post 0 me permite realisar todos los vervos pero lo utilisaremos apra crear
    //Put = sirve para actualizar
    //Delete = Sirve para elimimar
    @GetMapping
    public List<Usuario> getAll() {
        return usuarioService.getAll();
    }
    
    
    @PostMapping
    public void create(@RequestBody Usuario usuario){
        usuarioService.create(usuario);
    }
    
    
     @PutMapping("/{id}")
    public void update(@PathVariable long id, @RequestBody Usuario usuario) {
        usuarioService.update(id, usuario);
    }
    
    @DeleteMapping("/{id}")
    public void delete(@PathVariable long id) {
        usuarioService.delete(id);
    }
}
