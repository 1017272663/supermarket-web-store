package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Producto;
import com.minimercadolospacos.webminimercadolospacos.service.iface.ProductoService;
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
@RequestMapping("/producto")
public class ProductoController {
    @Autowired
    private ProductoService productoService;
    
    // HTTP -> GET, POST, PUT, DELETE
    
    @GetMapping
    public List<Producto> getAll() {
        return productoService.getAll();
    }
    
     
    @PostMapping
    public void create(@RequestBody Producto producto){
        productoService.create(producto);
    }
    
    
     @PutMapping("/{id}")
    public void update(@PathVariable int id, @RequestBody Producto producto) {
        productoService.update(id, producto);
    }
    
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        productoService.delete(id);
    }
}
