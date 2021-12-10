import React, { useState, useEffect }  from 'react';
import { Link } from 'react-router-dom';

const Home = () => {
    const [error, setError] = useState(null);
    const [isLoaded, setIsLoaded] = useState(false);
    const [inventory, setInventory] = useState([]);
    const [newPetName, setNewPetName] = useState("Doggy");
    const [newPetId, setNewPetId] = useState(Math.floor(Math.random() * 1048576).toString());
    const [newCategoryName, setNewCategoryName] = useState("Dog");
    const [newCategoryId, setNewCategoryId] = useState(Math.floor(Math.random() * 1048576).toString());
    const [newPetStatus, setNewPetStatus] = useState("available");
    const [currencyConverter, setCurrencyConverter] = useState({ "fromCurrency": "EUR", "toCurrency": "USD", "value": "126.32" });

    function handlePetNameInputChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        setNewPetName(value);
    }

    function handlePetIdInputChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        setNewPetId(value);
    }

    function handleCategoryNameInputChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        setNewCategoryName(value);
    }

    function handleCategoryIdInputChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        setNewCategoryId(value);
    }

    function handleStatusInputChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        setNewPetStatus(value);
    }

    function handleCurrencyConverterInputChange(e) {
        const target = e.target;
        const value = target.type === 'checkbox' ? target.checked : target.value;
        const name = target.name;
        const newCurrencyConverter = Object.assign({}, currencyConverter);
        newCurrencyConverter[name] = value;
        console.log(newCurrencyConverter);
        setCurrencyConverter(newCurrencyConverter);
    }

    function submitPet(e) {
        e.preventDefault();
        console.log('You clicked submit.');
        const requestPayload = {
            "id": parseInt(newPetId),
            "name": newPetName,
            "category": {
                "id": parseInt(newCategoryId),
                "name": newCategoryName
            },
            "photoUrls": [],
            "status": newPetStatus
        };
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/team1_petstore/1.0.5/pet", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(requestPayload) // body data type must match "Content-Type" header
        })
        .then(res => res.json())
        .then(
            (data) => {
                alert("Pet submitted: " + JSON.stringify(data))
                console.log(data);
            },
            (error) => {
                alert("Error: " + JSON.stringify(error))
                console.log(error);
            }
        )
    }

    function convertCurrency(e) {
        e.preventDefault();
        console.log('You clicked convert.');
        const requestPayload = currencyConverter;
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/EEBCurrencyConverterAPI/1.0.0/currency", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'x-Gateway-APIKey': 'c07b5710-6789-4dba-bc50-7bcf2024b99e'
            },
            body: JSON.stringify(requestPayload) // body data type must match "Content-Type" header
        })
        .then(res => res.json())
        .then(
            (data) => {
                console.log(data);
                const newCurrencyConverter = Object.assign({}, currencyConverter);
                newCurrencyConverter.convertedValue = data.convertedValue;
                console.log(newCurrencyConverter);
                setCurrencyConverter(newCurrencyConverter);
            },
            (error) => {
                alert("Error: " + JSON.stringify(error))
                console.log(error);
            }
        )
    }

    useEffect(() => {
        fetch("http://insrsaeu.apigw-aw-eu.webmethods.io/gateway/team1_petstore/1.0.5/store/inventory")
            .then(res => res.json())
            .then(
                (data) => {
                    setIsLoaded(true);
                    setInventory(data);
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
            <h1>Inventory</h1>
            <ul>
                <li key="available">
                        Available: <Link to={`petsbystatus/available`}>{inventory.available}</Link>
                </li>
        		<li key="pending">
                        Pending: <Link to={`petsbystatus/pending`}>{inventory.pending}</Link>
                </li>
                <li key="sold">
                        Sold: <Link to={`petsbystatus/sold`}>{inventory.sold}</Link>
                </li>
            </ul>
            <h1>Create / update pet</h1>
            <form>
                <label>
                    Name:
                    <input type="text" value={newPetName} onChange={handlePetNameInputChange} />
                </label>
                <br/>
                <label>
                    ID:
                    <input type="text" value={newPetId} onChange={handlePetIdInputChange} />
                </label>
                <br/>
                <label>
                    Category name:
                    <input type="text" value={newCategoryName} onChange={handleCategoryNameInputChange} />
                </label>
                <br/>
                <label>
                    Category ID:
                    <input type="text" value={newCategoryId} onChange={handleCategoryIdInputChange} />
                </label>
                <br/>
                <label>
                    Status:
                    <select value={newPetStatus} onChange={handleStatusInputChange}>
                        <option value="available">available</option>
                        <option value="pending">pending</option>
                        <option value="sold">sold</option>
                    </select>
                </label>
                <br/>
                <input type="submit" value="Submit" onClick={submitPet} />
            </form>
            <h1>Currency converter</h1>
            <form>
                <label>
                    Convert:
                    <input type="text" name="value" value={currencyConverter.value} onChange={handleCurrencyConverterInputChange} />
                </label>
                <br/>
                <label>
                    from currency:
                    <select name="fromCurrency" value={currencyConverter.fromCurrency} onChange={handleCurrencyConverterInputChange}>
                        <option value="EUR">EUR</option>
                        <option value="USD">USD</option>
                        <option value="GBP">GBP</option>
                    </select>
                </label>
                <br/>
                <label>
                    to currency:
                    <select name="toCurrency" value={currencyConverter.toCurrency} onChange={handleCurrencyConverterInputChange}>
                        <option value="EUR">EUR</option>
                        <option value="USD">USD</option>
                        <option value="GBP">GBP</option>
                    </select>
                </label>
                <br/>
                <input type="submit" value="Convert" onClick={convertCurrency} />
            </form>
            {(currencyConverter.convertedValue)? (
                <div>Converted value: {currencyConverter.convertedValue}</div>
            ):(<div />)}
          </div>
        );
    }
};

export default Home;
