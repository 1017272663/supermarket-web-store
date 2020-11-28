import React, {useState} from 'react';
import {Modal, Button, Form, FormGroup, FormLabel, FormControl} from 'react-bootstrap';

function CreateProductoModal(props){
    // props
    const {show, handleClose} = props;
    // estados
    const [id, setId] = useState(null);
    const [nombreProducto, setNombreProducto] = useState(null);
    const [descripcionProducto, setDescripcionProducto] = useState(null);
    const [imagenProducto, setImagenProducto] = useState(null);
    const [precioUnitario, setPrecioUnitario] = useState(null);
    const [cantidadProducto, setCantidadProducto] = useState(null);


const handleOnChange = (e) =>{
    const name = e.target.name;
    const value = e.target.value;

    switch(name) {
        case "id":
            setId(value ? value : null);
            break;
        case "nombreProducto":
            setNombreProducto(value ? value : null);
            break;
        case "descripcionProducto":
            setDescripcionProducto(value ? value : null);
            break;
        case "imagenProducto":
            setImagenProducto(value ? value : null);
            break;
        case "precioUnitario":
            setPrecioUnitario(value ? value : null);
            break;
        case "cantidadProducto":
            setCantidadProducto(value ? value : null);
            break;
        default:
            break;
    }
}
    return(
        <Modal backdrop="static" show={show} onHide={handleClose}>
            <Modal.Header closeButton>
                <Modal.Title>Modal title</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <Form>
                    <FormGroup>

                    <FormLabel>
                            Id Codigo de Barras
                        </FormLabel>
                        <FormControl 
                            name="id"
                            onChange={handleOnChange}
                            value={id ? id : ""}/>
                            

                        <FormLabel>
                            Nombre Del Producto
                        </FormLabel>
                        <FormControl 
                            name="nombreProducto"
                            onChange={handleOnChange}
                            value={nombreProducto ? nombreProducto : ""}/>

                        <FormLabel>
                            Descripción
                        </FormLabel>
                        <FormControl 
                            name="descripcionProducto"
                            onChange={handleOnChange}
                            value={descripcionProducto ? descripcionProducto : ""}/>

                        <FormLabel>
                            Imagen URL
                        </FormLabel>
                        <FormControl 
                            name="imagenProducto"
                            onChange={handleOnChange}
                            value={imagenProducto ? imagenProducto : ""}/>

                        <FormLabel>
                            Precio individual de cada producto
                        </FormLabel>
                        <FormControl 
                            name="precioUnitario"
                            onChange={handleOnChange}
                            value={precioUnitario ? precioUnitario : ""}/>
                        <FormLabel>
                            Cantidad de productos
                        </FormLabel>
                        <FormControl
                            name= "cantidadProducto"
                            onChange={handleOnChange}
                            value={cantidadProducto ? cantidadProducto : ""}/>
                    </FormGroup>
                </Form>
            </Modal.Body>
            <Modal.Footer>
                <Button variant="secondary" onClick={handleClose}>
                    Close</Button>
                <Button 
                    variant="primary"   
                    onClick={() => props.handleSaveProducto({
                        id,
                        nombreProducto,
                        descripcionProducto,
                        imagenProducto,
                        precioUnitario,
                        cantidadProducto
                    })}
                    disabled={!id || !nombreProducto || !imagenProducto || !precioUnitario || !cantidadProducto}>
                    Guardar
                </Button>
            </Modal.Footer>
        </Modal>
    );
}
export default CreateProductoModal