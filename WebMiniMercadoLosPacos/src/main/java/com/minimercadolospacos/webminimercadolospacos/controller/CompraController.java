package com.minimercadolospacos.webminimercadolospacos.controller;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Compra;
import com.minimercadolospacos.webminimercadolospacos.service.iface.CompraService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
}
