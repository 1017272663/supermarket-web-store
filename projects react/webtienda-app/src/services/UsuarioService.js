import {AxiosInstance} from "../config/axios-config"
class  UsuarioService{
    get(){
        return AxiosInstance.get("usuario");
    }
}

export default new UsuarioService();