import React from 'react';
import { Card, Button } from 'react-bootstrap';

function CardMovie(props){
    const { image, name, id} = props;

    return (
        <Card className="text-center">
             <Card.Img height={250} variant="top" src={image} />
            <Card.Body>
            <Card.Title>{name}</Card.Title>
                <Card.Text>
                   
                </Card.Text>
                     </Card.Body>
            <Card.Footer className="text-muted">
                <Button variant="primary">Actualizar</Button>
                <Button 
                    variant="danger"
                    onClick={() => props.handleDeleteProducto(id)}>
                    Eliminar
                </Button>
            </Card.Footer>

        </Card>
    );
}

export default CardMovie;