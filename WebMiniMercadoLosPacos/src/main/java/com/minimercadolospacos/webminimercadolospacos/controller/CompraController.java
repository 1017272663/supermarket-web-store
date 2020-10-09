package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Compra;
import com.minimercadolospacos.webminimercadolospacos.service.iface.CompraService;
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
@RequestMapping("/compra")
public class CompraController {
      @Autowired
    private CompraService compraService;
    
    // HTTP -> GET, POST, PUT, DELETE
    
    @GetMapping
    public List<Compra> getAll() {
        return compraService.getAll();
    }
    
    @PostMapping
    public void create(@RequestBody Compra compra) {
        compraService.create(compra);
    }
    
    @PutMapping("/{id}")
    public void update(@PathVariable int id, @RequestBody Compra compra) {
        compraService.update(id, compra);
    }
    
    @DeleteMapping("/{id}")
    public void delete(@PathVariable int id) {
        compraService.delete(id);
    }
}
