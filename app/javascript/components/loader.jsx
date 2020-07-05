import React from "react";

export const Loader = () => {
  return (
    <div className="d-flex justify-content-center my-3">
      <div className="spinner-border" role="status">
        <span className="sr-only">Loading...</span>
      </div>
    </div>
  );
};
