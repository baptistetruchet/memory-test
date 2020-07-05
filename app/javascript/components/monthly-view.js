import React, { useEffect, useState } from "react";
import { ColumnChart } from "react-chartkick";
import "chart.js";
import { Loader } from "./loader";
import { getMonthlyRevenue } from "../utils/api-calls";

export const MonthlyView = ({ country }) => {
  const [montlyRevenue, setMontlyRevenue] = useState(null);

  useEffect(() => {
    setMontlyRevenue(null);
    getMonthlyRevenue(country).then((res) => setMontlyRevenue(res.data));
  }, [country]);

  return (
    <div className="my-5">
      <h2 className="mb-4">Revenue per Month</h2>
      {montlyRevenue ? (
        <ColumnChart
          data={montlyRevenue}
          xtitle="Month"
          ytitle="Revenue"
          prefix="$"
          thousands=","
          decimal="."
        />
      ) : (
        <Loader />
      )}
    </div>
  );
};
