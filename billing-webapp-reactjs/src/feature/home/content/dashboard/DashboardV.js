import React from 'react'
import PropTypes from 'prop-types';

const DashboardV = ({ state, callback }) => {
  const {
    dashboardData,
  } = state

  return (
    <>
      <h1>{dashboardData[0].text}</h1>
    </>
  )
}

DashboardV.propTypes = {
  state: PropTypes.shape({
    dashboardData: PropTypes.array,
  }).isRequired,
  callback: PropTypes.shape({}),
};

export default DashboardV
