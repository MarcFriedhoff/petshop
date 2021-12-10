import React, { useState, useEffect } from 'react';

const Pet = props => {
    var id = props.match.params.id;

    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [pet, setPet] = useState({});
    const [order, setOrder] = useState({});

    function submitOrder(e) {
        e.preventDefault();
        console.log('You clicked submit.');
        const requestPayload = {
            "id": Math.floor(Math.random() * 1048576),
            "petId": pet.id,
            "quantity": 1,
            "shipDate": new Date().toISOString(),
            "status": "placed",
            "complete": true
        };
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/team1_petstore/1.0.5/store/order", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestPayload) // body data type must match "Content-Type" header
        })
        .then(res => res.json())
        .then(
            (data) => {
//                alert("Order submitted: " + JSON.stringify(data))
                console.log(data);
                setOrder(data);
            },
            (error) => {
                alert("Error: " + JSON.stringify(error))
                console.log(error);
            }
        )
    }

    function deleteOrder(e) {
        e.preventDefault();
        console.log('You clicked delete.');
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/team1_petstore/1.0.5/store/order/" + order.id, {
            method: 'DELETE'
        })
        .then(res => res.json())
        .then(
            (data) => {
//                alert("Order deleted: " + JSON.stringify(data))
                console.log(data);
                setOrder({});
            },
            (error) => {
                alert("Error: " + JSON.stringify(error))
                console.log(error);
            }
        )
    }
        
    useEffect(() => {
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/team1_petstore/1.0.5/pet/" + id)
            .then(res => res.json())
            .then(
                (data) => {
                    console.log(data);
                    setPet(data);
                    setIsLoaded(true);
                },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                }
            )
    }, [])

    if (error) {
        return <div>Error: {error.message}</div>;
    }
    if (!isLoaded) {
        return <div>Loading...</div>;
    }  
    
    if (pet) {
        return (
            <div>
                <h1>{pet.name}</h1>
                <div>
                    Category: {pet.category.name}
                </div>
                <div>
                    Status: {pet.status}
                </div>
                {(order.id === undefined)
                    ? (
                        <button onClick={submitOrder}>
                            Submit Order
                        </button>
                    ) : (
                        <div>
                            <div>
                                Order ID: {order.id}
                            </div>
                            <div>
                                Order Date: {order.shipDate}
                            </div>
                            <button onClick={deleteOrder}>
                                Delete Order
                            </button>
                        </div>
                    )
                }
           </div>
        )
    }
};

export default Pet;
