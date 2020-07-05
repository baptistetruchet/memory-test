import React from "react";

export const SummaryCard = ({ title, content }) => {
  return (
    <div className="card my-2">
      <div className="card-body text-center">
        <h5>{title}</h5>
        <p className="h2">{content}</p>
      </div>
    </div>
  );
};
