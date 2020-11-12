import {AxiosInstance} from "../config/axios-config"
class  ProductoService{
    get(){
        return AxiosInstance.get("producto");
   
    }
}

export default new ProductoService();