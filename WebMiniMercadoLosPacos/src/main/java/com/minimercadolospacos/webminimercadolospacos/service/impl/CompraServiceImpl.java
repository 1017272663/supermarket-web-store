package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Compra;
import com.minimercadolospacos.webminimercadolospacos.models.entity.Producto;
import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import com.minimercadolospacos.webminimercadolospacos.models.repository.CompraRepository;
import com.minimercadolospacos.webminimercadolospacos.models.repository.ProductoRepository;
import com.minimercadolospacos.webminimercadolospacos.models.repository.UsuarioRepository;
import com.minimercadolospacos.webminimercadolospacos.service.iface.CompraService;
import java.time.LocalDate;
import java.time.LocalTime;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompraServiceImpl implements CompraService {
    
   @Autowired
    private CompraRepository compraRepository;
    @Autowired
    private UsuarioRepository usuarioRepository;
    @Autowired
    private ProductoRepository productoRepository;
    
    @Override
    public List<Compra> getAll() {
        // select * from gender
        List<Compra> compras = new ArrayList<>();
        compraRepository.findAll().forEach(compras::add);
        return compras;
    }

    @Override
    public void create(Compra compra) {

      Optional<Usuario> usuario = usuarioRepository.findById(compra.getIdUser().getId());
        if (usuario.isPresent()) {
            Optional<Producto> producto = productoRepository.findById(compra.getIdProducto().getId());
            if (producto.isPresent()) {
               compra.setFechaCompra(LocalDate.now());//Fecha del sistema
               compra.setHoraCompra(LocalTime.now());//Hora del sistema
               compraRepository.save(compra);// crea o inferta la informacion con los datos que se le pasan pr medio de usuario
            }            
        }
    }

    
    @Override
    public void update(int id, Compra compra) {
        
          Optional<Compra> existsCompra = compraRepository.findById(id);
        if (existsCompra.isPresent()) {
            existsCompra.get().setId(compra.getId());//posibilida de cambiar la ID
            existsCompra.get().setTotalCompra(compra.getTotalCompra());
            existsCompra.get().setTotalDescuento(compra.getTotalDescuento());
            existsCompra.get().setCantidadProductos(compra.getCantidadProductos());
          /*existsCompra.get().setFechaCompra(compra.getFechaCompra());
            existsCompra.get().setHoraCompra(compra.getHoraCompra());
         */   
            Optional<Producto> producto = productoRepository.findById(compra.getIdProducto().getId());
            if (producto.isPresent()) {
                existsCompra.get().setIdProducto(compra.getIdProducto());
            }
            
            Optional<Usuario> usuario = usuarioRepository.findById(compra.getIdUser().getId());
            if (usuario.isPresent()) {
                existsCompra.get().setIdUser(compra.getIdUser());
            }
             compraRepository.save(existsCompra.get());// ademas de insertar tambien sirve para actualizar si el id ya existe.
        }
   
    }

    @Override
    public void delete(int id) {    
        Optional<Compra> existsCompra = compraRepository.findById(id);
        
        if (existsCompra.isPresent()) {
            compraRepository.delete(existsCompra.get());
    
        }
    }
}