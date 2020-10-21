package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Producto;
import com.minimercadolospacos.webminimercadolospacos.models.repository.ProductoRepository;
import com.minimercadolospacos.webminimercadolospacos.service.iface.ProductoService;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
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

    @Override
    public void create(Producto producto) {
        productoRepository.save(producto);
    }

    @Override
    public void update(int id, Producto producto) {
        
        Optional<Producto> existsProducto = productoRepository.findById(id);
        if (existsProducto.isPresent()) {
            existsProducto.get().setId(producto.getId());
            existsProducto.get().setNombreProducto(producto.getNombreProducto());
            existsProducto.get().setDescripcionProducto(producto.getDescripcionProducto());
            existsProducto.get().setImagenProducto(producto.getImagenProducto());
            existsProducto.get().setPrecioUnitario(producto.getPrecioUnitario());
            existsProducto.get().setCantidadProducto(producto.getCantidadProducto());
            productoRepository.save(existsProducto.get());// ademas de insertar tambien sirve para actualizar si el id ya existe.
        }    }

    @Override
    public void delete(int id) {
   Optional<Producto> existsProducto = productoRepository.findById(id);
        if (existsProducto.isPresent()) {
            productoRepository.delete(existsProducto.get());    
        }

    }
}
