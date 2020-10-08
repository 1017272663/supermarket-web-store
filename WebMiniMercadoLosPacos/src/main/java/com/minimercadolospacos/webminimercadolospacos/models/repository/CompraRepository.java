package com.minimercadolospacos.webminimercadolospacos.models.repository;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Compra;
import org.springframework.data.repository.CrudRepository;

public interface CompraRepository extends CrudRepository<Compra, Integer> {
    // select * from gender
    // delete from gender where id = 1
}
