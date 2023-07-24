import React from "react";
import PropTypes from "prop-types";

import { Bars } from "react-loader-spinner";
const Loading = ({ message }) => {
  return (
    <div className="bg-light min-vh-100 d-flex flex-row align-items-center">
      <div style={{ textAlign: "center" }}>
        <p>{message ? message : "Please Wait ..."}</p>
        <Bars
          heigth="200"
          width="5000"
          color="maroon"
          ariaLabel="loading-indicator"
        />
      </div>
    </div>
  );
};
Loading.propTypes = {
  message: PropTypes.string,
};
export default Loading;
