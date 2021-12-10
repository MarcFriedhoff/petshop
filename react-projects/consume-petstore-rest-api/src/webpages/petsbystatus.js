import React, { useState, useEffect }  from 'react';
import { Link } from 'react-router-dom';

const PetsByStatus = props => {
    var petStatus = props.match.params.petStatus;

    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [pets, setPets] = useState([]);

    useEffect(() => {
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/team1_petstore/1.0.5/pet/findByStatus?status=" + petStatus)
            .then(res => res.json())
            .then(
                (data) => {
                    setIsLoaded(true);
                    setPets(data);
                },
                (error) => {
                    setIsLoaded(true);
                    setError(error);
                }
            )
      }, [])

    if (error) {
        return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
        return <div>Loading...</div>;
    } else {
        return (
          <div>
            <h1>Pets in status {petStatus}</h1>
            <ul>
                {pets.map(pet => (
                <li key={pet.id}>
                        <Link to={`../pet/${pet.id}`}>{pet.name}</Link>
                </li>
                ))}
            </ul>
          </div>
        );
    }
};

export default PetsByStatus;
