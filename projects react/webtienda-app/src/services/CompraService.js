import { AxiosInstance } from "../config/axios-config"
class  CompraService{
    get() {
        return AxiosInstance.get("compra");
    }
}

export default  new CompraService();