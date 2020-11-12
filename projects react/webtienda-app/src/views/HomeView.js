import React, {useState, useEffect} from "react";
import UsuarioService from "../services/UsuarioService";
import axios from "axios";

const HomeView = () => {


 
   const[usuarios, setUsuarios] = useState(null);
 
    useEffect(() => {
        handleGetUsuario();
    }, []);


    const handleGetUsuario = async () => {
        try{
          
            const resp=  await UsuarioService.get();
 
            //const resp= [{"id":1,"name":"sabina","apellidoUser":"gonzales","telefonoUser":3215801010,"correo":"sabina@gmail.com","contrasenia":"123","direcionUser":"calle 1 carrera 1","rolId":{"id":1,"name":"Cliente"}},{"id":2,"name":"salme","apellidoUser":"herrera","telefonoUser":3215801011,"correo":"salomo726@gmail.com","contrasenia":"123","direcionUser":"calle 2 carreara 5","rolId":{"id":1,"name":"Cliente"}},{"id":3,"name":"salomon","apellidoUser":"almeida","telefonoUser":3215801012,"correo":"salomo716@gmail.com","contrasenia":"123","direcionUser":"calle 3 carrera 9","rolId":{"id":1,"name":"Cliente"}},{"id":4,"name":"samantha","apellidoUser":"sanchez","telefonoUser":3215801013,"correo":"salomo746@gmail.com","contrasenia":"123","direcionUser":"calle 3 carrera 9","rolId":{"id":1,"name":"Cliente"}},{"id":5,"name":"samuel","apellidoUser":"garzon","telefonoUser":3215801014,"correo":"samuelsalud158@saludpet.v.co","contrasenia":"123","direcionUser":"calle 5 carrera 8","rolId":{"id":1,"name":"Cliente"}},{"id":6,"name":"sara","apellidoUser":"alvarez","telefonoUser":3215801015,"correo":"sara243@hotmai.com","contrasenia":"123","direcionUser":"calle 8 carrera 1","rolId":{"id":1,"name":"Cliente"}},{"id":7,"name":"napoleon","apellidoUser":"piedrahita","telefonoUser":3215801016,"correo":"salomo748@gmail.com","contrasenia":"123","direcionUser":"calle 9 carrera 9","rolId":{"id":1,"name":"Cliente"}},{"id":8,"name":"john","apellidoUser":"nzales","telefonoUser":3215801017,"correo":"LaParka@quenotepille.ric.co","contrasenia":"123","direcionUser":"calle 20 carrera 45","rolId":{"id":1,"name":"Cliente"}},{"id":9,"name":"pedro","apellidoUser":"Guzman","telefonoUser":3215801018,"correo":"pedro.adasd@hotmai.com","contrasenia":"123","direcionUser":"calle 21 carrera 69","rolId":{"id":1,"name":"Cliente"}},{"id":10,"name":"alicia","apellidoUser":"montreal","telefonoUser":3215801019,"correo":"salomo746@gmail.com","contrasenia":"123","direcionUser":"calle 22 carrera 98","rolId":{"id":2,"name":"Vendedor"}},{"id":11,"name":"carla","apellidoUser":"jaramillo","telefonoUser":3215801020,"correo":"salomo946@gmail.com","contrasenia":"123","direcionUser":"calle 23 carrera 63","rolId":{"id":2,"name":"Vendedor"}},{"id":12,"name":"jesus","apellidoUser":"alcasares","telefonoUser":3215801021,"correo":"jesus@teama.edu.co","contrasenia":"123","direcionUser":"calle 29 carrera 64","rolId":{"id":2,"name":"Vendedor"}},{"id":13,"name":"juan","apellidoUser":"Alvarez","telefonoUser":3215801022,"correo":"salomo746@gmail.com","contrasenia":"123","direcionUser":"calle 30 carrera 11","rolId":{"id":2,"name":"Vendedor"}},{"id":14,"name":"sara","apellidoUser":"nzales","telefonoUser":3215801023,"correo":"sara243@hotmai.com","contrasenia":"123","direcionUser":"calle 8 carrera 1","rolId":{"id":3,"name":"Administrador"}},{"id":15,"name":"juan","apellidoUser":"piedrahita","telefonoUser":3215801024,"correo":"juanadminitrador@gmail.com","contrasenia":"123","direcionUser":"calle 32 carrera 12","rolId":{"id":3,"name":"Administrador"}}];
            console.log(resp)
            setUsuarios(resp.data)
        }catch(error){
            console.log(error);
        }
    }

    return <div>{
        <p>{
            usuarios && usuarios.map((usuario, index) =>{
            return <li key={index}>{usuario.name}</li>
            })
        }</p>
    }</div>

  //  return <div>Estoy en home</div>
}

export default HomeView;