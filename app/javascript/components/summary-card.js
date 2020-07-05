import React from "react";

export const Card = ({ title, content }) => {
  return (
    <div className="card">
      <div className="card-body text-center">
        <h5>{title}</h5>
        <p className="h2">{content}</p>
      </div>
    </div>
  );
};
