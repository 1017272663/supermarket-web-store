import React, { useState } from "react";
import {Button, Container} from 'react-bootstrap';
import CreateProductoModal from '../components/CreateProductoModal';
import ProductoService from '../services/ProductoService';
import Swal from 'sweetalert2';
import Animate from 'animate.css';
export const ProductoView = () => {
    const [show, setShow] = useState(false);

    const handleClose = () =>{
        setShow(false)
    }

    const handleOpenModal = ()=>{
        setShow(true)
    }

    const handleSaveProducto = async (producto) =>{

        Swal.fire({
            allowOutsideClick: false,
            icon: 'info',
            text: 'Por favor espere...',
        })

        Swal.showLoading();
                            Swal.fire({
                                allowOutsideClick: false,
                                title: '¿Quieres guardar El producto?',
                                showDenyButton: true,
                                showCancelButton: false,
                                confirmButtonText: `Guardar`,
                                denyButtonText: `No Guardar`,
                                icon: 'question'
                              }).then((result) => {
                                if (result.isConfirmed) {
                                   

                                    ProductoService.create(producto)
                                    .then((resp) =>{
                                        Swal.close()
                                        console.log(resp);
                                        Swal.fire( {   
                                            allowOutsideClick: false,
                                            title:'Guardado exitosamente', 
                                            icon: 'success'})
                                        handleClose();
                                        
                                    }, (error) =>{
                                        Swal.close()
                                        console.log(error);
                                        Swal.fire({
                                            title: 'Error',
                                            icon: 'error',
                                            text: 'Se presentó un error al guardar el producto'
                                        })
                                    });
                                } else if (result.isDenied) {
                                    Swal.fire({ 
                                        allowOutsideClick: false,
                                        title: 'Los Cambios no se an guardado',
                                        icon: 'info'})                                
                                }
                              })
                      
    }

    return (
        <Container>
            <Button onClick={handleOpenModal} variant="primary">Crear Producto</Button>
            {
                show &&
                <CreateProductoModal
                    show={show}
                    handleClose={handleClose}
                    handleSaveProducto = {handleSaveProducto}/>
     }
        </Container>
    )
}
export default ProductoView;