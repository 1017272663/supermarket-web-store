package com.minimercadolospacos.webminimercadolospacos.service.impl;

import com.minimercadolospacos.webminimercadolospacos.models.entity.Rol;
import com.minimercadolospacos.webminimercadolospacos.models.entity.Usuario;
import com.minimercadolospacos.webminimercadolospacos.models.repository.RolRepository;
import com.minimercadolospacos.webminimercadolospacos.models.repository.UsuarioRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.minimercadolospacos.webminimercadolospacos.service.iface.UsuarioService;
import java.util.Optional;


@Service
public class UsuarioServiceImpl implements UsuarioService {
      
    @Autowired
    private UsuarioRepository usuarioRepository;
    @Autowired
    private RolRepository rolRepository;
    
    @Override
    public List<Usuario> getAll() {
        // select * from gender
        List<Usuario> usuarios = new ArrayList<>();
        usuarioRepository.findAll().forEach(usuarios::add);
        return usuarios;
    }

    @Override
    public void create(Usuario usuario) {
       Optional<Rol> rol = rolRepository.findById(usuario.getRolId().getId());
        if (rol.isPresent()) {
            usuarioRepository.save(usuario);// crea o inferta la informacion con los datos que se le pasan pr medio de usuario
        }
    }

    //@Transactional Consultar
    @Override
    public void update(long id, Usuario usuario) {
        Optional<Usuario> existsUsuario = usuarioRepository.findById(id);
        if (existsUsuario.isPresent()) {
            existsUsuario.get().setId(usuario.getId());
            existsUsuario.get().setName(usuario.getName());
            existsUsuario.get().setApellidoUser(usuario.getApellidoUser());
            existsUsuario.get().setTelefonoUser(usuario.getTelefonoUser());
            existsUsuario.get().setCorreo(usuario.getCorreo());
            existsUsuario.get().setContrasenia(usuario.getContrasenia());
            existsUsuario.get().setDirecionUser(usuario.getDirecionUser());
            Optional<Rol> rol = rolRepository.findById(usuario.getRolId().getId());
            if (rol.isPresent()) {
                existsUsuario.get().setRolId(usuario.getRolId());
            }
             usuarioRepository.save(existsUsuario.get());// ademas de insertar tambien sirve para actualizar si el id ya existe.
        }
    }

    @Override
    public void delete(long id) {
        // DELETE FROM usuario where id= 1;
             Optional<Usuario> existsUsuario = usuarioRepository.findById(id);
        if (existsUsuario.isPresent()) {
            usuarioRepository.delete(existsUsuario.get());
            //DELETE FROM usuario   para eliminar todos los datos
        }   //usuarioRepository.deleteAll();
    }
}
