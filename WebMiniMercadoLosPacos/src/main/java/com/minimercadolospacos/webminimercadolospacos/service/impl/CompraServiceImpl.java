package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Compra;
import com.minimercadolospacos.webminimercadolospacos.models.repository.CompraRepository;
import com.minimercadolospacos.webminimercadolospacos.service.iface.CompraService;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompraServiceImpl implements CompraService {
    
   @Autowired
    private CompraRepository compraRepository;
    
    @Override
    public List<Compra> getAll() {
        // select * from gender
        List<Compra> compras = new ArrayList<>();
        compraRepository.findAll().forEach(compras::add);
        return compras;
    }
    
}
