import React, {useState, useEffect} from "react";
import ProductoService from "../services/ProductoService";
import {Row, Col, Container, CardDeck} from 'react-bootstrap';
import CardProducto from '../components/CardProducto';
import Swal from "sweetalert2";

const HomeView = () => {


 
   const[producto, setProducto] = useState(null);
 
    useEffect(() => {
        handleGetProducto();
    }, []);


    const handleGetProducto = async () => {
        
        try{
            Swal.fire({
                allowOutsideClick: false,
                icon: 'info',
                text: 'Por favor espere...',
                timer: 1000
            })
    
            Swal.showLoading();

            const resp=  await ProductoService.get();
            setProducto(resp.data)
           // Swal.close()
        }catch(error){
            console.log(error);
            Swal.close()
            Swal.fire({
                allowOutsideClick: false,
                icon: 'error',
                title: 'Oops...',
                text: 'Se a presentado un error a la hora de listar los productos', 
            })
        }
    }


    const handleDeleteProducto = (id) =>{
        ProductoService.delete(id).then(resp =>{
            console.log(resp);
            handleGetProducto();
        }, (err) =>{
            console.log('Error al eliminar', err);
        });
    }

    const handleRenderProducto = () =>{
        if (!producto || producto.length ===0){
            return <div>No existen datos </div>;
        }

        const colums= 4;

        let rows = Math.floor(producto.length / colums);
        const resto = producto.length % colums;
        if(resto !==0){
            rows = rows + 1; 
        }

        const arrayRows = [...Array(rows)];
        return arrayRows.map((row, index) => {
            return(
                <CardDeck key={index}>
                    {
                        producto.slice(
                            index === 0 ? index : index * colums,
                            index === 0 ? colums : index * colums + colums
                        ).map((producto, index) => {
                            return <CardProducto
                            key={index}
                            id={producto.id}
                            image = {producto.imagenProducto}
                            name ={producto.nombreProducto}
                            handleDeleteProducto={handleDeleteProducto}/>
                        })
                    }
                </CardDeck>
            );
        });
    }


    return(
        <Container> 
            {handleRenderProducto()}
        </Container>
    );

}

export default HomeView;