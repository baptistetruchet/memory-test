import React from "react";
import { Card } from "./summary-card";

const t = {
  total_revenue: "Revenue",
  average_revenue_per_order: "Avg Rev / Order",
  number_of_distinct_customers: "Customers",
};

export const SummaryCards = ({ summary }) => {
  return (
    <div className="row">
      {Object.entries(summary).map(([key, value]) => {
        return (
          <div key={key} className="col-12 col-md-4">
            <Card title={t[key] || key} content={value}></Card>
          </div>
        );
      })}
    </div>
  );
};
