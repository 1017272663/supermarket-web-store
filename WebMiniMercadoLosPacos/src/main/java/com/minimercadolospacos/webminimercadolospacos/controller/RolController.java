package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import com.minimercadolospacos.webminimercadolospacos.service.iface.RolService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;

@RestController
@RequestMapping("/rol")
public class RolController {
    
    @Autowired
    private RolService rolService;
    
    //HTTP -> GET, POST, PUT, DELETE
    
    @GetMapping
    public List<Rol> getAll(){
       return rolService.getAll();
    }
 
    @PostMapping
    public void create(@RequestBody Rol rol){
        rolService.create(rol);
    }
    
    
     @PutMapping("/{id}")
    public void update(@PathVariable int id, @RequestBody Rol rol) {
        rolService.update(id, rol);
    }
    
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        rolService.delete(id);
    }
    
}
