import React, { useState } from "react";
import ReactDOM from "react-dom";
import { CountrySelect } from "../components/country-select";
import { SummaryView } from "../components/summary-view";
import { MonthlyView } from "../components/monthly-view";

const Dashboard = () => {
  const [country, setCountry] = useState("");

  return (
    <>
      <CountrySelect country={country} setCountry={setCountry} />
      <SummaryView country={country} />
      <MonthlyView country={country} />
    </>
  );
};

document.addEventListener("turbolinks:load", () => {
  ReactDOM.render(<Dashboard />, document.getElementById("dashboard"));
});
