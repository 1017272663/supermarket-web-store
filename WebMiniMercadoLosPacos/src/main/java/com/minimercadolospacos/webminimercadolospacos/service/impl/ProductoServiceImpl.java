package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Producto;
import com.minimercadolospacos.webminimercadolospacos.models.repository.ProductoRepository;
import com.minimercadolospacos.webminimercadolospacos.service.iface.ProductoService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService{
   @Autowired
    private ProductoRepository productoRepository;
    
    @Override
    public List<Producto> getAll() {
        // select * from gender
        List<Producto> productos = new ArrayList<>();
        productoRepository.findAll().forEach(productos::add);
        return productos;
    }   
}
