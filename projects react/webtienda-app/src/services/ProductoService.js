import {AxiosInstance} from "../config/axios-config"
class  ProductoService{
    get(){
        return AxiosInstance.get("producto");
   
    }

    delete(id){
        return AxiosInstance.delete(`producto/${id}`);
    }

    create(producto) {
        return AxiosInstance.post("producto", producto);
    }
}

export default new ProductoService();