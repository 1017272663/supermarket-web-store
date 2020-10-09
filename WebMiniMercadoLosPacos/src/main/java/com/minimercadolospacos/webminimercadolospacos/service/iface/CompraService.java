package com.minimercadolospacos.webminimercadolospacos.service.iface;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Compra;
import java.util.List;


public interface CompraService {
    
    void create(Compra compra);
    
    List<Compra> getAll();
    
    void update(int id, Compra compra);
    
    void delete(int id);
}
