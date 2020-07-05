import React, { useEffect, useState } from "react";
import { getSummary } from "../utils/api-calls";
import { Loader } from "./loader";
import { SummaryCards } from "./summary-cards";

export const SummaryView = ({ country }) => {
  const [summary, setSummary] = useState(null);

  useEffect(() => {
    setSummary(null);
    getSummary(country).then((res) => setSummary(res.data));
  }, [country]);

  return (
    <div className="my-4">
      <h2 className="mb-3">Summary</h2>
      {summary ? <SummaryCards summary={summary} /> : <Loader />}
    </div>
  );
};
