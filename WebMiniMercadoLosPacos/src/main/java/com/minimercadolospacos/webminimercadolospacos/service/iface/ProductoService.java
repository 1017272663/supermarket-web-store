package com.minimercadolospacos.webminimercadolospacos.service.iface;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Producto;
import java.util.List;


public interface ProductoService {
    
    void create(Producto producto);
    
    List<Producto> getAll();
    
    void update(int id, Producto producto);
    
    void delete(int id);
}
