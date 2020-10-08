package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import com.minimercadolospacos.webminimercadolospacos.service.iface.RolService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
