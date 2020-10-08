package com.minimercadolospacos.webminimercadolospacos.models.repository;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Producto;
import org.springframework.data.repository.CrudRepository;

public interface ProductoRepository extends CrudRepository<Producto, Integer> {
    // select * from gender
    // delete from gender where id = 1
}
