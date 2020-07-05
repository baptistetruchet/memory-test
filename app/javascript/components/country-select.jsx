import React, { useEffect, useState } from "react";
import Select from "react-select";
import { getCountries } from "../utils/api-calls";

const selectStyles = {
  container: (styles) => ({ ...styles, minWidth: "220px" }),
};

export const CountrySelect = ({ country, setCountry }) => {
  const [availableCountries, setAvailableCountries] = useState([]);

  useEffect(() => {
    getCountries().then((res) => setAvailableCountries(res.data));
  }, []);

  const options = [{ value: "", label: "All" }];
  options.push(
    ...availableCountries.map((country) => ({
      value: country,
      label: country,
    }))
  );

  return (
    <div className="d-flex align-items-center my-5">
      <h2 className="mb-0 mr-4">Country</h2>
      <Select
        value={options.find((opt) => opt.value === country)}
        onChange={(e) => setCountry(e.value)}
        styles={selectStyles}
        options={options}
      />
    </div>
  );
};
